-- =========================================================
-- TAMBAH SOAL — perbanyak soal per kompetensi biar radar chart
-- lebih representatif (minimal 3 soal per kompetensi).
-- Aman dijalankan berkali-kali (on conflict do nothing).
-- =========================================================

-- ---------------------------------------------------------
-- MATEMATIKA — tambah Aljabar (x2), Geometri Ruang (x2),
-- Statistika (x2), + kompetensi baru Aritmatika (x3)
-- ---------------------------------------------------------

insert into bank_soal (id, sesi_id, mapel, urutan, teks, opsi, kunci_jawaban, kompetensi, pembahasan) values

('mat-004', '11111111-1111-1111-1111-111111111111', 'Matematika', 4,
 'Jika 2(x + 3) = 4x − 2, maka nilai x adalah…',
 '{"a":"2","b":"3","c":"4","d":"5","e":"6"}', 'c', 'Aljabar',
 '2(x+3) = 4x−2 → 2x+6 = 4x−2 → 6+2 = 4x−2x → 8 = 2x → x = 4.'),

('mat-005', '11111111-1111-1111-1111-111111111111', 'Matematika', 5,
 'Diketahui fungsi f(x) = 2x² − 3x + 1. Nilai f(2) adalah…',
 '{"a":"1","b":"2","c":"3","d":"4","e":"5"}', 'c', 'Aljabar',
 'f(2) = 2(2)² − 3(2) + 1 = 2(4) − 6 + 1 = 8 − 6 + 1 = 3.'),

('mat-006', '11111111-1111-1111-1111-111111111111', 'Matematika', 6,
 'Sebuah tabung memiliki jari-jari alas 7 cm dan tinggi 10 cm. Volume tabung tersebut adalah… (π = 22/7)',
 '{"a":"1.200 cm³","b":"1.340 cm³","c":"1.440 cm³","d":"1.540 cm³","e":"1.640 cm³"}', 'd', 'Geometri Ruang',
 'Volume tabung = πr²t = 22/7 × 7² × 10 = 22 × 7 × 10 = 1.540 cm³.'),

('mat-007', '11111111-1111-1111-1111-111111111111', 'Matematika', 7,
 'Luas permukaan kubus dengan panjang rusuk 5 cm adalah…',
 '{"a":"100 cm²","b":"125 cm²","c":"150 cm²","d":"175 cm²","e":"200 cm²"}', 'c', 'Geometri Ruang',
 'Luas permukaan kubus = 6 × s² = 6 × 5² = 6 × 25 = 150 cm².'),

('mat-008', '11111111-1111-1111-1111-111111111111', 'Matematika', 8,
 'Rata-rata dari data 6, 8, 7, 9, 10 adalah…',
 '{"a":"7","b":"7,5","c":"8","d":"8,5","e":"9"}', 'c', 'Statistika',
 'Rata-rata = (6+8+7+9+10) / 5 = 40 / 5 = 8.'),

('mat-009', '11111111-1111-1111-1111-111111111111', 'Matematika', 9,
 'Modus dari data: 4, 5, 5, 6, 7, 5, 8 adalah…',
 '{"a":"4","b":"5","c":"6","d":"7","e":"8"}', 'b', 'Statistika',
 'Modus adalah data yang paling sering muncul. Angka 5 muncul 3 kali, paling banyak dibanding angka lain.'),

('mat-010', '11111111-1111-1111-1111-111111111111', 'Matematika', 10,
 'Hasil dari 15% dari 240 adalah…',
 '{"a":"24","b":"30","c":"36","d":"42","e":"48"}', 'c', 'Aritmatika',
 '15% × 240 = 0,15 × 240 = 36.'),

('mat-011', '11111111-1111-1111-1111-111111111111', 'Matematika', 11,
 'Sebuah barang dibeli seharga Rp80.000 dan dijual dengan untung 25%. Harga jual barang tersebut adalah…',
 '{"a":"Rp90.000","b":"Rp95.000","c":"Rp100.000","d":"Rp105.000","e":"Rp110.000"}', 'c', 'Aritmatika',
 'Harga jual = harga beli × (1 + persen untung) = 80.000 × 1,25 = 100.000.'),

('mat-012', '11111111-1111-1111-1111-111111111111', 'Matematika', 12,
 'Hasil dari 2³ + 3² adalah…',
 '{"a":"13","b":"15","c":"17","d":"19","e":"21"}', 'c', 'Aritmatika',
 '2³ = 8 dan 3² = 9, sehingga 2³ + 3² = 8 + 9 = 17.')

on conflict (id) do nothing;

-- ---------------------------------------------------------
-- BAHASA INDONESIA — tambah Membaca Pemahaman (x2),
-- Kaidah Kebahasaan (x1), + kompetensi baru Menulis dan
-- Menyunting (x3)
-- ---------------------------------------------------------

insert into bank_soal (id, sesi_id, mapel, urutan, teks, opsi, kunci_jawaban, kompetensi, pembahasan) values

('bindo-004', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 4,
 'Bacalah kutipan berikut: "Sampah plastik yang dibuang sembarangan dapat mencemari sungai dan laut, mengancam kehidupan biota air." Simpulan yang tepat dari kutipan tersebut adalah…',
 '{"a":"Sampah plastik mahal harganya","b":"Pembuangan sampah plastik sembarangan berdampak buruk bagi ekosistem air","c":"Laut adalah tempat pembuangan sampah","d":"Biota air tahan terhadap pencemaran","e":"Sungai lebih bersih daripada laut"}', 'b', 'Membaca Pemahaman',
 'Kutipan menyatakan hubungan sebab-akibat: pembuangan sampah plastik sembarangan (sebab) mengancam kehidupan biota air (akibat), sehingga simpulannya adalah dampak buruknya terhadap ekosistem air.'),

('bindo-005', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 5,
 'Bacalah kutipan berikut: "Program vaksinasi telah menjangkau 80% penduduk desa tersebut dalam tiga bulan terakhir." Pernyataan yang sesuai dengan kutipan tersebut adalah…',
 '{"a":"Seluruh penduduk desa sudah divaksin","b":"Vaksinasi berjalan lambat","c":"Sebagian besar penduduk desa telah menerima vaksin","d":"Vaksinasi baru dimulai","e":"Desa tersebut menolak vaksinasi"}', 'c', 'Membaca Pemahaman',
 '80% adalah sebagian besar (bukan seluruh), sehingga pernyataan yang paling sesuai adalah "sebagian besar penduduk desa telah menerima vaksin".'),

('bindo-006', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 6,
 'Kalimat yang menggunakan ejaan sesuai PUEBI adalah…',
 '{"a":"Rapat akan dilaksanakan di Gedung Serba Guna pada hari Senin.","b":"rapat akan dilaksanakan di gedung serba guna pada hari senin.","c":"Rapat akan di laksanakan di gedung Serba Guna pada hari Senin.","d":"Rapat akan dilaksanakan Di Gedung Serba Guna pada hari senin.","e":"rapat akan di laksanakan di Gedung serba guna pada hari Senin."}', 'a', 'Kaidah Kebahasaan',
 'Kalimat (a) benar: huruf kapital di awal kalimat dan nama tempat, serta "dilaksanakan" ditulis serangkai (bukan "di laksanakan" karena "di" di sini adalah awalan, bukan kata depan).'),

('bindo-007', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 7,
 'Kalimat berikut yang paling efektif adalah…',
 '{"a":"Bagi siswa-siswa yang terlambat harap segera masuk kelas.","b":"Siswa yang terlambat harap segera masuk kelas.","c":"Untuk para siswa yang terlambat, agar segera masuk kelas.","d":"Bagi siswa yang terlambat, supaya segera masuk kelas.","e":"Siswa-siswa yang terlambat, untuk segera masuk kelas."}', 'b', 'Menulis dan Menyunting',
 'Kalimat (b) paling ringkas dan efektif — tanpa kata mubazir seperti "bagi...", "untuk...agar/supaya" yang membuat kalimat lain jadi bertele-tele atau tidak bersubjek jelas.'),

('bindo-008', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 8,
 'Perbaikan yang tepat untuk kalimat "Dalam laporan itu menjelaskan tentang penurunan angka kemiskinan." adalah…',
 '{"a":"Laporan itu menjelaskan tentang penurunan angka kemiskinan.","b":"Dalam laporan itu dijelaskan penurunan angka kemiskinan.","c":"Laporan itu tentang menjelaskan penurunan angka kemiskinan.","d":"Dalam laporan itu menjelaskan penurunan angka kemiskinan saja.","e":"Penurunan angka kemiskinan dalam laporan itu menjelaskan."}', 'a', 'Menulis dan Menyunting',
 'Kalimat asli tidak memiliki subjek yang jelas karena diawali kata depan "dalam". Menghilangkan "dalam" membuat "laporan itu" menjadi subjek kalimat yang jelas.'),

('bindo-009', '22222222-2222-2222-2222-222222222222', 'Bahasa Indonesia', 9,
 'Kalimat yang menggunakan tanda baca dengan tepat adalah…',
 '{"a":"Ibu membeli, buah, sayur, dan daging di pasar.","b":"Ibu membeli buah, sayur, dan daging di pasar.","c":"Ibu membeli buah sayur dan daging, di pasar.","d":"Ibu, membeli buah, sayur dan daging di pasar.","e":"Ibu membeli buah, sayur dan, daging di pasar."}', 'b', 'Menulis dan Menyunting',
 'Tanda koma digunakan untuk memisahkan unsur-unsur dalam perincian (buah, sayur, dan daging), tanpa koma yang tidak perlu sebelum atau di tempat lain dalam kalimat.')

on conflict (id) do nothing;

-- ---------------------------------------------------------
-- BAHASA INGGRIS — tambah Grammar (x2), Reading Comprehension
-- (x2), Vocabulary (x2)
-- ---------------------------------------------------------

insert into bank_soal (id, sesi_id, mapel, urutan, teks, opsi, kunci_jawaban, kompetensi, pembahasan) values

('bing-004', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 4,
 'Choose the correct sentence:',
 '{"a":"If it rain tomorrow, we will cancel the trip.","b":"If it rains tomorrow, we will cancel the trip.","c":"If it will rain tomorrow, we cancel the trip.","d":"If it raining tomorrow, we will cancel the trip.","e":"If it rained tomorrow, we will cancel the trip."}', 'b', 'Grammar',
 'First conditional (kejadian yang mungkin terjadi di masa depan) menggunakan pola: if + present simple, will + base verb. Maka "if it rains" adalah bentuk yang benar.'),

('bing-005', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 5,
 'She ____ to the office by bus every day.',
 '{"a":"go","b":"goes","c":"going","d":"gone","e":"is go"}', 'b', 'Grammar',
 'Subjek "she" (orang ketiga tunggal) dalam present simple memerlukan verb + s/es, sehingga bentuk yang benar adalah "goes".'),

('bing-006', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 6,
 'Read the text: "Many companies now allow employees to work remotely at least twice a week. Surveys show this flexibility has improved employee satisfaction, although some managers worry about reduced collaboration." What is a concern some managers have?',
 '{"a":"Increased employee satisfaction","b":"Reduced collaboration","c":"Higher company profit","d":"More remote job openings","e":"Employees working overtime"}', 'b', 'Reading Comprehension',
 'Teks secara eksplisit menyebutkan "some managers worry about reduced collaboration" — jadi kekhawatirannya adalah berkurangnya kolaborasi tim.'),

('bing-007', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 7,
 'Read the text: "Renewable energy sources such as solar and wind are becoming more affordable, making them increasingly competitive with fossil fuels." What does the text imply about renewable energy?',
 '{"a":"It is more expensive than fossil fuels","b":"It is losing popularity","c":"Its cost is decreasing, making it more competitive","d":"It cannot compete with fossil fuels","e":"It is only used in developed countries"}', 'c', 'Reading Comprehension',
 'Kata "more affordable" dan "increasingly competitive" menunjukkan bahwa biaya energi terbarukan semakin turun sehingga makin bisa bersaing dengan bahan bakar fosil.'),

('bing-008', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 8,
 'Choose the word closest in meaning to "crucial":',
 '{"a":"unimportant","b":"essential","c":"optional","d":"rare","e":"accidental"}', 'b', 'Vocabulary',
 '"Crucial" berarti sangat penting/menentukan, sinonim terdekatnya adalah "essential" (penting/wajib ada).'),

('bing-009', '33333333-3333-3333-3333-333333333333', 'Bahasa Inggris', 9,
 'The opposite (antonym) of the word "increase" is…',
 '{"a":"rise","b":"grow","c":"decrease","d":"expand","e":"extend"}', 'c', 'Vocabulary',
 '"Increase" berarti bertambah/naik. Lawan katanya adalah "decrease" yang berarti berkurang/menurun.')

on conflict (id) do nothing;

-- Selesai. Cek: Table Editor > bank_soal harus punya total
-- 12 (Matematika) + 9 (Bahasa Indonesia) + 9 (Bahasa Inggris) = 30 baris.
