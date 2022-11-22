SQL Installation
```bash
sudo apt update
sudo apt upgrade
sudo apt install mysql-server
mysql --version
```

SQL Setup
```bash
sudo usermod -d /var/lib/mysql/ mysql
sudo mysqld_safe --skip-grant-tables
sudo service mysql start
sudo mysql -u root mysql
```

SQL Quit
```sql
\q
```

Create Database
```sql
create database practical;
```
