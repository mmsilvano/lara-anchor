# ⚓ Lara Anchor

<p align="center">
  <strong>Lightweight, minimal Laravel Docker starter for development.</strong><br>
  Spin up a full Laravel development stack with PHP 8.5, MySQL 8.3, and Node.js 22—all on Alpine Linux—fast, simple, and highly customizable.
</p>

<p align="center">
  <a href="#-whats-different">Why Lara Anchor?</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#%EF%B8%8F-configuration">Configuration</a> •
  <a href="#-common-commands">Commands</a>
</p>

---

## 🎯 What's Different?

No bloat. No Redis. No Nginx overhead. Just what you need for modern Laravel development:

- ✅ **PHP 8.5 CLI** running via `php artisan serve` (no FPM complexity)
- ✅ **MySQL 8.3** as the primary data store
- ✅ **Node.js 22** (optional profile) with **pnpm** for instantaneous asset compilation
- ✅ **Alpine Linux** base for incredibly minimal image sizes and fast boot times
- ✅ **Highly Customizable** – effortlessly extend the core with any additional services

---

## 🚀 Quick Start

### One-Command Installation

The easiest way to bootstrap your project is via our installation script:

```bash
curl -s https://lara-anchor.netlify.app/install.sh | bash
```

> This automatically downloads and extracts the latest Lara Anchor template directly into your current directory.

### Manual Setup (Docker Compose)
If you already have your environment variables configured (`cp .env.example .env`), just spin it up:
```bash
docker-compose up -d
```

---

## ⚙️ Highly Customizable

Lara Anchor is built to be a solid foundation, not a black box.

### Built-in Customization
- **Memory Limits**: Protect your host machine by adjusting PHP and MySQL memory directly in `.env`.
- **Docker Profiles**: Keep your setup lean by enabling optional services (like Node.js) only when you need them.
- **Custom Extensions**: Add any required PHP extensions by modifying the clean, well-documented Dockerfiles.

### Easy to Extend
Need more services? Just add them to `docker-compose.yml`:

```yaml
# Add Redis if needed
redis:
  image: redis:alpine
  container_name: laravel_redis

# Add Nginx for production-like routing
nginx:
  image: nginx:alpine
  ports:
    - "80:80"
  volumes:
    - ./nginx.conf:/etc/nginx/nginx.conf
```

### Modify Dockerfiles
Easily slip in new extensions:

```dockerfile
# In templates/docker/php/Dockerfile
RUN apk add --no-cache postgresql-dev && \
    docker-php-ext-install pdo_pgsql

# Then rebuild
docker-compose up -d --build
```

---

## ⚙️ Configuration

### Environment Variables (.env)

Everything is controlled via a centralized configuration:

```env
# Laravel Configuration
APP_NAME=Laravel
APP_DEBUG=true
APP_URL=http://localhost:8000

# Database Configuration
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret

# MySQL Root Password
MYSQL_ROOT_PASSWORD=root

# Memory Limits (optional)
APP_MEM_LIMIT=256m          # PHP container memory
DB_MEM_LIMIT=512m           # MySQL container memory
```

### Adjust Memory Limits
Edit `.env` or `docker-compose.yml` to strictly allocate memory:
```yaml
mem_limit: ${APP_MEM_LIMIT:-256m}  # Adjust 256m to your desired ceiling
```

---

## 📋 Common Commands

### Docker Compose
```bash
# Start containers (background)
docker-compose up -d

# Stop all containers
docker-compose down

# Tail logs
docker-compose logs -f app

# Restart the stack
docker-compose restart
```

### Laravel Artisan
```bash
# General Artisan usage
docker-compose exec app php artisan migrate
docker-compose exec app php artisan tinker
docker-compose exec app php artisan cache:clear

# Execute Test Suite
docker-compose exec app php artisan test
```

### Composer
```bash
# General Package Management
docker-compose exec app composer install
docker-compose exec app composer require vendor/package
docker-compose exec app composer update
```

### Database Operations
```bash
# Access MySQL interactive shell as standard user
docker-compose exec mysql mysql -u laravel -p laravel

# Run arbitrary SQL as root
docker-compose exec mysql mysql -u root -p -e "SHOW DATABASES;"
```

### Node (Optional - Dev Profile)
Asset compilation is isolated in a separate container accessible via the `dev` profile.

```bash
# Boot the stack including the Node container
docker-compose --profile dev up -d

# Execute Frontend Tooling
docker-compose exec node pnpm install
docker-compose exec node pnpm dev
docker-compose exec node pnpm build
```

---

## 🛠️ Development Workflow

### File Synchronization
Your local directories are deeply synced as Docker volumes. Any changes hit the container instantly—absolutely zero rebuilds are necessary for application code.

### Database Access
Connect using any MySQL client:
- **Host:** mysql
- **Port:** 3306
- **User:** laravel
- **Password:** secret (from .env)
- **Database:** laravel

### Modify Memory Limits
If you need more resources, edit `.env`:
```env
APP_MEM_LIMIT=512m      # Increase PHP memory
DB_MEM_LIMIT=1024m      # Increase MySQL memory
```
Then cycle the cluster:
```bash
docker-compose down && docker-compose up -d
```

---

## 🆘 Troubleshooting

<details>
<summary><strong>Port 8000 Already in Use</strong></summary>

```bash
# Find the rogue process
lsof -i :8000

# Terminate it
kill -9 <PID>

# Alternatively, just remap the port in docker-compose.yml
```
</details>

<details>
<summary><strong>Database Connection Error</strong></summary>

Ensure the database container is actively running and credentials map exactly correctly:
```bash
docker-compose ps
docker-compose logs mysql
```
</details>

<details>
<summary><strong>Permission Denied on Storage Directories</strong></summary>

```bash
docker-compose exec app chmod -R 777 storage bootstrap/cache
```
</details>

<details>
<summary><strong>Containers Repeatedly Flailing or Failing to Start</strong></summary>

Check the master logs to isolate the exact fault:
```bash
docker-compose logs
```
</details>

<details>
<summary><strong>Out of Sync Cache or Hard Reset</strong></summary>

```bash
docker-compose exec app composer clear-cache
docker-compose exec app php artisan cache:clear
docker-compose down -v
docker-compose up -d --build
```
</details>

---

## 🔗 Resources
- [Laravel Documentation](https://laravel.com/docs)
- [Docker Documentation](https://docs.docker.com/)
- [MySQL Docker Hub](https://hub.docker.com/_/mysql)
- [Node.js Docker Hub](https://hub.docker.com/_/node)

---

## 🤝 Contributing
Found a bug, want to add a feature, or have a suggestion? Feel absolutely free to submit issues or open pull requests!

---

<p align="center">Made with ❤️ for Laravel developers</p>

---

## License

Lara Anchor is open-sourced software licensed under the [MIT License](LICENSE).
