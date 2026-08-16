# Fullstack Dev Container (React + Tailwind, Django + DRF, PostgreSQL)

Portable dev environment: same setup, every Windows machine, zero manual installs.

## One-time setup (do this once per machine, not per project)
1. Install **Docker Desktop for Windows** (enable WSL2 backend during install).
2. Install **VS Code**.
3. Install the VS Code extension **"Dev Containers"** (by Microsoft).

That's it — this only needs doing once per machine, ever.

## Using this template for a new project
1. Copy this whole folder to your project location (or push it to a Git repo and `git clone` it on each machine).
2. If you don't have a Django project yet, drop your Django app code into `backend/`
   (must contain `manage.py` at `backend/` root, plus `requirements.txt`).
3. If you don't have a React app yet, scaffold one into `frontend/`:
   ```
   npm create vite@latest . -- --template react
   npm install -D tailwindcss postcss autoprefixer
   npx tailwindcss init -p
   ```
4. Open the project folder in VS Code.
5. VS Code will prompt: **"Reopen in Container"** → click it.
   (First time: takes a few minutes to build images. After that: seconds.)

## Daily workflow (every time, every machine) — fully automatic now

**Option A — just double-click `start.bat`.** No VS Code, no typing.
It runs `docker compose up`, which automatically: builds the containers if needed,
runs Django migrations, starts the Django server, installs npm packages, starts the
Vite dev server, and opens both in your browser. Double-click `stop.bat` when you're done.

**Option B — open in VS Code (if you want to actually edit code, which you will).**
1. Open the project folder in VS Code.
2. Click **"Reopen in Container"** when prompted.
3. That's it — migrations run and both servers start automatically in the background
   (same commands as `start.bat`, just triggered by VS Code instead).
4. Edit your code normally; both servers auto-reload on save.

Either way, visit:
- Frontend: http://localhost:5173
- Backend/API: http://localhost:8000
- Postgres: localhost:5432 (user: appuser, pass: apppassword, db: appdb — change these in docker-compose.yml for real projects)

## What's portable and what isn't
- **Portable (syncs everywhere via this repo):** all code, dependency versions, DB schema/migrations, editor extensions, environment config.
- **NOT portable (per-machine, stays local):** the actual database *data* — each machine's Postgres volume is separate. For shared data, either:
  - run migrations fresh on each machine (fine for dev), or
  - use `pg_dump` / `pg_restore` to move a snapshot, or
  - point `DATABASE_URL` at a single shared remote Postgres (e.g. a free-tier hosted Postgres) instead of the local container — then literally everything including data is identical across machines.

## Next-level option
If even the "clone repo + open in container" step feels like too much, push this repo to GitHub and use **GitHub Codespaces** instead — you'd just open a browser tab and get the same environment running in the cloud, no Docker Desktop needed at all.
