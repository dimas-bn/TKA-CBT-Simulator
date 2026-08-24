-- =========================================================
-- IZINKAN INSERT SOAL BARU — dibutuhkan untuk halaman admin-soal.html
-- Aman dijalankan berkali-kali.
-- =========================================================

grant insert on bank_soal to anon, authenticated;

drop policy if exists "bank_soal_insert_all" on bank_soal;
create policy "bank_soal_insert_all" on bank_soal for insert with check (true);

-- CATATAN: kebijakan ini permisif (siapa pun dengan anon key bisa
-- insert), sama seperti pola tabel lain di aplikasi ini. Cukup untuk
-- pemakaian internal sekolah. Kalau nanti publik, perlu diperketat
-- pakai Supabase Auth (cek identitas guru yang login).
