-- =========================================================
-- KEAMANAN: BATASI AKSES KUNCI_JAWABAN & PEMBAHASAN
-- Jalankan sekali di SQL Editor Supabase. Aman dijalankan ulang.
--
-- Prinsip: kolom kunci_jawaban & pembahasan dicabut dari akses
-- langsung (anon/authenticated). Satu-satunya jalan mengambil
-- data itu adalah lewat function get_pembahasan(), yang
-- mem-validasi status peserta = 'selesai' DI DALAM DATABASE —
-- jadi tidak bisa dilewati lewat manipulasi kode di browser.
-- =========================================================

-- ---------------------------------------------------------
-- 1. CABUT AKSES SELECT PENUH, GANTI JADI PER-KOLOM
-- ---------------------------------------------------------

revoke select on bank_soal from anon, authenticated;

-- Kolom yang boleh diakses langsung selama ujian berlangsung
-- (TIDAK termasuk kunci_jawaban & pembahasan)
grant select (id, sesi_id, mapel, urutan, teks, opsi) on bank_soal to anon, authenticated;

-- ---------------------------------------------------------
-- 2. FUNCTION KHUSUS — validasi status peserta di server
-- ---------------------------------------------------------

create or replace function get_pembahasan(p_peserta_id uuid)
returns table (
  id text,
  teks text,
  opsi jsonb,
  kunci_jawaban text,
  pembahasan text
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_sesi_id uuid;
  v_status text;
begin
  select peserta.sesi_id, peserta.status into v_sesi_id, v_status
  from peserta
  where peserta.id = p_peserta_id;

  if v_sesi_id is null then
    raise exception 'Peserta tidak ditemukan';
  end if;

  if v_status <> 'selesai' then
    raise exception 'Ujian belum diselesaikan, pembahasan belum tersedia';
  end if;

  return query
    select bank_soal.id, bank_soal.teks, bank_soal.opsi, bank_soal.kunci_jawaban, bank_soal.pembahasan
    from bank_soal
    where bank_soal.sesi_id = v_sesi_id
    order by bank_soal.urutan;
end;
$$;

-- Izinkan anon (siswa) memanggil function ini lewat RPC
grant execute on function get_pembahasan(uuid) to anon, authenticated;

-- ---------------------------------------------------------
-- CATATAN
-- ---------------------------------------------------------
-- - Fungsi ini "security definer" artinya dia jalan dengan hak
--   akses pemilik function (bisa baca semua kolom), bukan hak
--   akses anon yang memanggilnya — makanya bisa "menembus"
--   pembatasan kolom di atas, tapi HANYA lewat jalur yang sudah
--   divalidasi (status = selesai).
-- - Batasan yang masih ada: siapa pun yang tahu UUID peserta_id
--   milik siswa lain yang SUDAH selesai, bisa memanggil function
--   ini dan dapat pembahasan yang sama (karena soal & kunci
--   jawaban memang sama untuk 1 sesi/kelas). UUID v4 praktis
--   tidak bisa ditebak, jadi risiko ini sangat kecil untuk
--   konteks ujian internal sekolah.
