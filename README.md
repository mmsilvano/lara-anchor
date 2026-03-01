# ⚓ Lara Anchor

**Lara Anchor** is a lightweight, minimal **Laravel Docker starter** for development.  
Spin up a full Laravel development stack with **PHP 8.5, MySQL 8.3, and Node.js 22**—all on **Alpine Linux**—fast, simple, and highly customizable.

---

## 🎯 What's Different?

No bloat. No Redis. No Nginx overhead. Just what you need for Laravel development:
- ✅ **PHP 8.5 CLI** with php artisan serve (not FPM)
- ✅ **MySQL 8.3** for your database
- ✅ **Node.js 22** (optional, via dev profile) with **pnpm** for asset compilation
- ✅ **Alpine Linux** for minimal image sizes
- ✅ **Highly Customizable** - extend with any service you need
- ❌ No Nginx (use php artisan serve instead)
- ❌ No Redis (add if you need it)

---

## 🚀 Quick Start

### One-Command Installation

```bash
curl -s https://lara-anchor.netlify.app/install.sh | bash
```

This downloads and extracts the latest Lara Anchor template automatically.



## ⚙️ Highly Customizable

### Built-in Customization
- **Memory Limits**: Adjust PHP and MySQL memory via `.env`
- **Docker Profiles**: Enable/disable services easily
- **Node.js Dev Profile**: Optional Node 22 container for asset compilation
- **Custom Extensions**: Modify Dockerfiles to add PHP extensions

### Easy to Extend
Add services directly to `docker-compose.yml`:

```yaml
# Add Redis if needed
redis:
  image: redis:alpine
  container_name: laravel_redis

# Add Nginx for production
nginx:
  image: nginx:alpine
  ports:
    - "80:80"
  volumes:
    - ./nginx.conf:/etc/nginx/nginx.conf
```

### Modify Dockerfiles
Edit PHP or Node images to add extensions:

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
Edit `.env` or `docker-compose.yml` to change container memory allocations:
```yaml
mem_limit: ${APP_MEM_LIMIT:-256m}  # Change 256m to your desired limit
```

---

## 📋 Common Commands

### Docker Compose
```bash
# Start containers (background)
docker-compose up -d

# Stop containers
docker-compose down

# View logs
docker-compose logs -f app

# Restart containers
docker-compose restart
```

### Laravel Artisan
```bash
# Run artisan commands
docker-compose exec app php artisan migrate
docker-compose exec app php artisan tinker
docker-compose exec app php artisan cache:clear

# Run tests
docker-compose exec app php artisan test
```

### Composer
```bash
# Install packages
docker-compose exec app composer install

# Require new package
docker-compose exec app composer require vendor/package

# Update packages
docker-compose exec app composer update
```

### Database
```bash
# Access MySQL shell
docker-compose exec mysql mysql -u laravel -p laravel

# Or with root
docker-compose exec mysql mysql -u root -p -e "your sql commands"
```

### Node (Optional - Dev Profile)
```bash
# Start with Node container
docker-compose --profile dev up -d

# Run pnpm commands
docker-compose exec node pnpm install
docker-compose exec node pnpm dev
docker-compose exec node pnpm build
```

---

## 🛠️ Development Workflow

### File Synchronization
Your local files are mounted as volumes. Changes are reflected instantly in the container. No rebuilds needed.

### Debug Mode
Enable debug mode in `.env`:
```env
APP_DEBUG=true
```

### Database Access
Connect using any MySQL client:
- **Host:** localhost
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

Then restart:
```bash
docker-compose down
docker-compose up -d
```

---

## 🆘 Troubleshooting

### Port 8000 Already in Use
```bash
# Find process using port 8000
lsof -i :8000

# Kill the process
kill -9 <PID>

# Or change the port in docker-compose.yml
```

### Database Connection Error
Ensure MySQL is running and credentials match:
```bash
docker-compose ps
docker-compose logs mysql
```

### Permission Denied on Storage
```bash
docker-compose exec app chmod -R 777 storage bootstrap/cache
```

### Containers Won't Start
Check the logs:
```bash
docker-compose logs
```

### Clear Cache & Rebuild
```bash
docker-compose exec app composer clear-cache
docker-compose exec app php artisan cache:clear
docker-compose up -d --build
```



## 🔗 Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Docker Documentation](https://docs.docker.com/)
- [MySQL Docker Hub](https://hub.docker.com/_/mysql)
- [Node.js Docker Hub](https://hub.docker.com/_/node)

---

## 📝 License

This project is open source and available under the MIT License.

---

## 🤝 Contributing

Found a bug or have suggestions? Feel free to submit issues or pull requests!

---

Made with ❤️ for Laravel developers
