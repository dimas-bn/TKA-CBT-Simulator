# TKA CBT Simulator

Simulasi ujian berbasis komputer (CBT) untuk latihan TKA (Tes Kemampuan Akademik) — mode ujian formal per-siswa dengan panel pemantauan real-time untuk guru.

## Stack

- HTML + Vanilla JS + Tailwind CSS (CDN)
- Supabase (database + realtime) — `@supabase/supabase-js` v2 via CDN
- Deploy: Cloudflare Pages

## Struktur

```
├── ujian.html        # Halaman ujian — diakses tiap siswa dari device masing-masing
├── panel-guru.html   # Panel pemantauan — status peserta real-time
└── schema.sql        # Schema database (jalankan sekali di Supabase SQL Editor)
```

## Setup

1. Buat project di [supabase.com](https://supabase.com), region Singapore.
2. Jalankan seluruh isi `schema.sql` di SQL Editor Supabase.
3. Buka **Database → Replication**, aktifkan Realtime untuk tabel `peserta`.
4. Buka **Project Settings → API**, salin `Project URL` dan `anon public` key.
5. Isi kredensial itu di `ujian.html` dan `panel-guru.html`, pada bagian:
   ```javascript
   const SUPABASE_URL = 'GANTI_DENGAN_PROJECT_URL';
   const SUPABASE_ANON_KEY = 'GANTI_DENGAN_ANON_KEY';
   ```
6. Buka `ujian.html` untuk sisi siswa, `panel-guru.html` untuk sisi guru.

> Catatan: Supabase **anon key** memang didesain untuk ditempel di sisi client (bukan rahasia seperti service role key) — keamanan data diatur lewat Row Level Security (RLS), sudah termasuk di `schema.sql`.

## Status

MVP tahap awal — mode ujian formal (timer, navigasi soal, auto-save, deteksi pelanggaran) dan panel guru (monitoring real-time, export CSV) sudah jalan dengan bank soal contoh (3 soal Matematika). Belum ada: multi-mapel, dashboard kompetensi/radar chart, dan halaman hasil pembahasan.

## Deploy

Belum dikoneksikan ke Cloudflare Pages — repo masih tahap lokal/pengembangan.
