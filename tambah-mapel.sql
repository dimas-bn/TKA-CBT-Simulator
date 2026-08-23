-- =========================================================
-- TAMBAH MAPEL BARU — Bahasa Indonesia & Bahasa Inggris
-- Jalankan di SQL Editor Supabase. Aman dijalankan berkali-kali
-- (pakai on conflict do nothing).
-- =========================================================

-- ---------------------------------------------------------
-- SESI BARU
-- ---------------------------------------------------------

insert into sesi_ujian (id, nama_sesi, mapel, kelas, durasi_menit, status)
values
  ('22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia — Tryout Sesi 1', 'Bahasa Indonesia', 'XII IPA 1', 90, 'aktif'),
  ('33333333-3333-3333-3333-333333333333', 'Bahasa Inggris — Tryout Sesi 1', 'Bahasa Inggris', 'XII IPA 1', 90, 'aktif')
on conflict (id) do nothing;

-- ---------------------------------------------------------
-- BANK SOAL — Bahasa Indonesia (contoh 3 soal, tambah sendiri
-- dengan pola yang sama untuk soal ke-4 dst)
-- ---------------------------------------------------------

insert into bank_soal (id, sesi_id, mapel, urutan, teks, opsi, kunci_jawaban, kompetensi) values
('bindo-001', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 1,
 'Bacalah paragraf berikut: "Perubahan iklim menyebabkan cuaca ekstrem yang semakin sering terjadi. Petani mengalami kesulitan memprediksi musim tanam." Gagasan utama paragraf tersebut adalah…',
 '{"a":"Petani kesulitan menanam padi","b":"Dampak perubahan iklim terhadap pertanian","c":"Cuaca ekstrem di Indonesia","d":"Musim tanam yang berubah-ubah","e":"Prediksi cuaca oleh petani"}', 'b', 'Membaca Pemahaman'),
('bindo-002', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 2,
 'Kalimat yang menggunakan kata baku dengan tepat adalah…',
 '{"a":"Dia sedang menganalisa data penjualan","b":"Kami akan mengevaluasi hasil ujian","c":"Praktek dokter itu buka pukul 8 pagi","d":"Ijin masuk sudah diberikan kepala sekolah","e":"Aktifitas belajar berjalan lancar"}', 'b', 'Kaidah Kebahasaan'),
('bindo-003', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 3,
 'Kata "namun" dalam kalimat "Ia telah berusaha keras, namun hasilnya belum memuaskan" berfungsi sebagai…',
 '{"a":"Kata penghubung penambahan","b":"Kata penghubung pertentangan","c":"Kata penghubung sebab akibat","d":"Kata penghubung waktu","e":"Kata penghubung syarat"}', 'b', 'Kaidah Kebahasaan')
on conflict (id) do nothing;

-- ---------------------------------------------------------
-- BANK SOAL — Bahasa Inggris (contoh 3 soal)
-- ---------------------------------------------------------

insert into bank_soal (id, sesi_id, mapel, urutan, teks, opsi, kunci_jawaban, kompetensi) values
('bing-001', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 1,
 'Choose the correct sentence:',
 '{"a":"She don''t like coffee","b":"She doesn''t likes coffee","c":"She doesn''t like coffee","d":"She not like coffee","e":"She isn''t like coffee"}', 'c', 'Grammar'),
('bing-002', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 2,
 'Read the text: "The company reported a significant increase in revenue last quarter, driven mainly by strong overseas sales." What does the text mainly discuss?',
 '{"a":"A decline in company profit","b":"Overseas sales strategy meetings","c":"An increase in company revenue","d":"A change in company leadership","e":"Domestic sales performance"}', 'c', 'Reading Comprehension'),
('bing-003', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 3,
 'The word "significant" in the text above is closest in meaning to…',
 '{"a":"small","b":"unclear","c":"temporary","d":"considerable","e":"negative"}', 'd', 'Vocabulary')
on conflict (id) do nothing;

-- Selesai. Cek: Table Editor > sesi_ujian harus ada 3 baris total
-- (Matematika + Bahasa Indonesia + Bahasa Inggris), dan bank_soal
-- bertambah 6 baris baru.
