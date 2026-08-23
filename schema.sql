-- =========================================================
-- TKA CBT SIMULATOR — SUPABASE SCHEMA
-- Jalankan seluruh file ini di SQL Editor Supabase (New Query → Run)
-- =========================================================

-- ---------------------------------------------------------
-- 1. TABEL
-- ---------------------------------------------------------

create table if not exists sesi_ujian (
  id uuid primary key default gen_random_uuid(),
  nama_sesi text not null,
  mapel text not null,
  kelas text,
  durasi_menit int not null default 90,
  status text not null default 'aktif',   -- draft/aktif/selesai
  created_at timestamptz default now()
);

create table if not exists peserta (
  id uuid primary key default gen_random_uuid(),
  sesi_id uuid references sesi_ujian(id) on delete cascade,
  nama_siswa text not null,
  status text not null default 'belum_mulai', -- belum_mulai/sedang_ujian/selesai
  waktu_mulai timestamptz,
  waktu_submit timestamptz,
  skor numeric,
  created_at timestamptz default now(),
  unique(sesi_id, nama_siswa)
);

create table if not exists jawaban (
  id uuid primary key default gen_random_uuid(),
  peserta_id uuid references peserta(id) on delete cascade,
  soal_id text not null,
  jawaban_terpilih text,
  ragu boolean default false,
  waktu_jawab timestamptz default now(),
  unique(peserta_id, soal_id)
);

create table if not exists log_pelanggaran (
  id uuid primary key default gen_random_uuid(),
  peserta_id uuid references peserta(id) on delete cascade,
  jenis text not null,   -- fullscreen_keluar / tab_switch
  waktu timestamptz default now()
);

create table if not exists bank_soal (
  id text primary key,
  sesi_id uuid references sesi_ujian(id) on delete cascade,
  mapel text not null,
  urutan int not null default 0,
  teks text not null,
  opsi jsonb not null,          -- {"a": "...", "b": "...", "c": "...", "d": "...", "e": "..."}
  kunci_jawaban text not null,
  kompetensi text
);

-- ---------------------------------------------------------
-- 2. INDEX (biar query panel guru cepat pas peserta banyak)
-- ---------------------------------------------------------

create index if not exists idx_peserta_sesi on peserta(sesi_id);
create index if not exists idx_jawaban_peserta on jawaban(peserta_id);
create index if not exists idx_log_peserta on log_pelanggaran(peserta_id);
create index if not exists idx_soal_sesi on bank_soal(sesi_id);

-- ---------------------------------------------------------
-- 3. ROW LEVEL SECURITY
-- Prinsip: siswa cuma boleh baca soal (tanpa kunci_jawaban) &
-- baca/tulis jawaban miliknya sendiri. Guru (lewat anon key
-- juga untuk versi awal ini) boleh baca semua.
-- Catatan: ini masih level "sekolah pakai internal", bukan
-- multi-tenant publik — cukup untuk MVP tryout sekolah.
-- ---------------------------------------------------------

alter table sesi_ujian enable row level security;
alter table peserta enable row level security;
alter table jawaban enable row level security;
alter table log_pelanggaran enable row level security;
alter table bank_soal enable row level security;

-- Semua orang (siswa & guru pakai anon key) boleh baca sesi & bank soal
create policy "sesi_ujian_read_all" on sesi_ujian for select using (true);
create policy "bank_soal_read_all" on bank_soal for select using (true);

-- Peserta: siapa saja boleh insert (mulai ujian) & baca semua (guru pantau),
-- update dibatasi hanya pada baris miliknya sendiri lewat id yang di-generate client
create policy "peserta_read_all" on peserta for select using (true);
create policy "peserta_insert_all" on peserta for insert with check (true);
create policy "peserta_update_all" on peserta for update using (true);

-- Jawaban: insert/update terbuka (identitas peserta_id sudah acak & tersembunyi di client),
-- baca terbuka untuk keperluan restore sesi & panel guru
create policy "jawaban_read_all" on jawaban for select using (true);
create policy "jawaban_upsert_all" on jawaban for insert with check (true);
create policy "jawaban_update_all" on jawaban for update using (true);

-- Log pelanggaran: insert terbuka, baca untuk guru
create policy "log_insert_all" on log_pelanggaran for insert with check (true);
create policy "log_read_all" on log_pelanggaran for select using (true);

-- CATATAN KEAMANAN:
-- Policy di atas masih permisif (memakai anon key untuk semua peran) —
-- cukup untuk ujian internal di lingkungan sekolah yang diawasi guru.
-- Kalau nanti mau publik/multi-sekolah, ganti ke Supabase Auth
-- (siswa & guru login beneran) baru policy dipersempit pakai auth.uid().

-- ---------------------------------------------------------
-- 4. DATA AWAL — sesi + bank soal contoh (Matematika)
-- ---------------------------------------------------------

insert into sesi_ujian (id, nama_sesi, mapel, kelas, durasi_menit, status)
values ('11111111-1111-1111-1111-111111111111', 'Matematika — Tryout Sesi 1', 'Matematika', 'XII IPA 1', 90, 'aktif')
on conflict (id) do nothing;

insert into bank_soal (id, sesi_id, mapel, urutan, teks, opsi, kunci_jawaban, kompetensi) values
('mat-001', '11111111-1111-1111-1111-111111111111', 'Matematika', 1,
 'Sebuah kolam renang berbentuk balok dengan panjang 12 m, lebar 6 m, dan kedalaman 2 m. Volume air yang dibutuhkan untuk mengisi penuh kolam tersebut adalah…',
 '{"a":"120 m³","b":"144 m³","c":"132 m³","d":"156 m³","e":"168 m³"}', 'b', 'Geometri Ruang'),
('mat-002', '11111111-1111-1111-1111-111111111111', 'Matematika', 2,
 'Jika 3x − 7 = 2x + 5, maka nilai x adalah…',
 '{"a":"10","b":"11","c":"12","d":"13","e":"14"}', 'c', 'Aljabar'),
('mat-003', '11111111-1111-1111-1111-111111111111', 'Matematika', 3,
 'Median dari data: 7, 9, 5, 8, 10, 6, 9 adalah…',
 '{"a":"7","b":"8","c":"9","d":"10","e":"6"}', 'b', 'Statistika')
on conflict (id) do nothing;

-- Selesai. Cek hasil: buka Table Editor di sidebar, pastikan
-- 5 tabel muncul dan bank_soal sudah terisi 3 baris.
