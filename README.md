# FreelanceHub V2 — Full Stack Cloudflare

## Sudah tersedia
- Register + login aman (PBKDF2 + JWT)
- Role client / freelancer / admin
- Dashboard user
- Client dapat membuat proyek
- Freelancer dapat mengirim proposal
- Search + filter proyek
- Database Cloudflare D1
- Responsive UI
- Siap deploy gratis ke Cloudflare Pages

## Setup singkat
1. Buat repository GitHub dan upload seluruh isi folder ini.
2. Di Cloudflare: Workers & Pages → Create → Pages → Connect to Git.
3. Pilih repository ini dan build command kosong. Output directory: `public`.
4. Buat D1 database bernama `freelancehub-db`.
5. Isi `database_id` pada `wrangler.toml` dengan ID D1.
6. Jalankan `schema.sql` pada database D1.
7. Buat secret `JWT_SECRET` pada Pages project (nilai acak panjang).
8. Deploy.

## Penting
V2 ini benar-benar memakai backend + database, bukan demo/localStorage. Namun pembayaran otomatis, escrow, chat realtime, upload portofolio, dan payout bank/e-wallet memerlukan integrasi provider/API tambahan. Jangan memasukkan API key/payment secret ke frontend.
