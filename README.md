# Mind Gym

Laravel, Vue, Inertia, and MySQL project.

## Development

Copy the environment file once:

```bash
cp .env.example .env
```

Start the Docker services:

```bash
docker compose up -d
```

Run Laravel commands through the app container:

```bash
docker compose exec app php artisan migrate
docker compose exec app php artisan db:seed
docker compose exec app npm run build
```

Open the app at `http://localhost:8000`.

phpMyAdmin is available at `http://localhost:8080`. Using `mind_gym_duomenys.sql` you can import Demo data.