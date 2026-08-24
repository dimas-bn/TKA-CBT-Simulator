-- =========================================================
-- TAMBAH KOLOM PEMBAHASAN + ISI UNTUK SOAL YANG SUDAH ADA
-- Aman dijalankan berkali-kali.
-- =========================================================

alter table bank_soal add column if not exists pembahasan text;

-- ---------------------------------------------------------
-- Matematika
-- ---------------------------------------------------------
update bank_soal set pembahasan =
  'Volume balok = panjang × lebar × tinggi = 12 × 6 × 2 = 144 m³.'
  where id = 'mat-001';

update bank_soal set pembahasan =
  '3x − 7 = 2x + 5 → 3x − 2x = 5 + 7 → x = 12.'
  where id = 'mat-002';

update bank_soal set pembahasan =
  'Urutkan data: 5, 6, 7, 8, 9, 9, 10. Data berjumlah 7 (ganjil), median adalah data tengah (ke-4) = 8.'
  where id = 'mat-003';

-- ---------------------------------------------------------
-- Bahasa Indonesia
-- ---------------------------------------------------------
update bank_soal set pembahasan =
  'Gagasan utama terletak pada hubungan sebab-akibat yang dibangun paragraf: perubahan iklim (sebab) memengaruhi kegiatan bertani (akibat), sehingga inti paragraf adalah dampak perubahan iklim terhadap pertanian.'
  where id = 'bindo-001';

update bank_soal set pembahasan =
  'Kata baku yang benar adalah "mengevaluasi" (bukan "menganalisa", "praktek", "ijin", atau "aktifitas" yang merupakan bentuk tidak baku).'
  where id = 'bindo-002';

update bank_soal set pembahasan =
  '"Namun" menghubungkan dua klausa yang isinya bertentangan (usaha keras vs hasil belum memuaskan), sehingga berfungsi sebagai konjungsi pertentangan.'
  where id = 'bindo-003';

-- ---------------------------------------------------------
-- Bahasa Inggris
-- ---------------------------------------------------------
update bank_soal set pembahasan =
  'Subject "she" (singular) + do-support negatif menggunakan "doesn''t", diikuti bentuk dasar (base form) verb: "doesn''t like".'
  where id = 'bing-001';

update bank_soal set pembahasan =
  'Kalimat pertama teks secara eksplisit menyebutkan "a significant increase in revenue" — jadi topik utamanya adalah kenaikan pendapatan perusahaan.'
  where id = 'bing-002';

update bank_soal set pembahasan =
  '"Significant" berarti "cukup besar/berarti", sinonim terdekat dari pilihan yang ada adalah "considerable" (cukup besar).'
  where id = 'bing-003';

-- Selesai. Cek: buka Table Editor > bank_soal, pastikan kolom
-- pembahasan sudah terisi untuk 9 baris di atas.
