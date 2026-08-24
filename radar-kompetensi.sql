-- =========================================================
-- UPDATE get_pembahasan() — tambahkan kolom kompetensi
-- (dibutuhkan untuk radar chart kekuatan-kelemahan siswa)
--
-- Perlu DROP dulu karena Postgres tidak izinkan CREATE OR REPLACE
-- kalau daftar kolom return berubah.
-- =========================================================

drop function if exists get_pembahasan(uuid);

create or replace function get_pembahasan(p_peserta_id uuid)
returns table (
  id text,
  teks text,
  opsi jsonb,
  kunci_jawaban text,
  pembahasan text,
  kompetensi text
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
    select bank_soal.id, bank_soal.teks, bank_soal.opsi, bank_soal.kunci_jawaban,
           bank_soal.pembahasan, bank_soal.kompetensi
    from bank_soal
    where bank_soal.sesi_id = v_sesi_id
    order by bank_soal.urutan;
end;
$$;

grant execute on function get_pembahasan(uuid) to anon, authenticated;

-- Cek: jalankan manual di SQL Editor untuk pastikan kompetensi ikut kekirim
-- select * from get_pembahasan('<uuid peserta yang statusnya selesai>');
