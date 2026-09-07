PRAGMA foreign_keys=ON;
CREATE TABLE IF NOT EXISTS users(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT NOT NULL,
 email TEXT NOT NULL UNIQUE,
 password_hash TEXT NOT NULL,
 password_salt TEXT NOT NULL,
 role TEXT NOT NULL CHECK(role IN ('client','freelancer','admin')),
 balance INTEGER NOT NULL DEFAULT 0,
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS jobs(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 client_id INTEGER NOT NULL,
 title TEXT NOT NULL,
 category TEXT NOT NULL,
 budget TEXT NOT NULL,
 skills TEXT DEFAULT '',
 description TEXT NOT NULL,
 status TEXT NOT NULL DEFAULT 'open',
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(client_id) REFERENCES users(id)
);
CREATE TABLE IF NOT EXISTS bids(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 job_id INTEGER NOT NULL,
 freelancer_id INTEGER NOT NULL,
 amount TEXT NOT NULL,
 proposal TEXT NOT NULL,
 status TEXT NOT NULL DEFAULT 'pending',
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE(job_id,freelancer_id),
 FOREIGN KEY(job_id) REFERENCES jobs(id),
 FOREIGN KEY(freelancer_id) REFERENCES users(id)
);
CREATE INDEX IF NOT EXISTS idx_jobs_status ON jobs(status);
CREATE INDEX IF NOT EXISTS idx_jobs_client ON jobs(client_id);
CREATE INDEX IF NOT EXISTS idx_bids_user ON bids(freelancer_id);

-- Setelah akun admin dibuat lewat register, jalankan:
-- UPDATE users SET role='admin' WHERE email='EMAIL_ADMIN_KAMU';
