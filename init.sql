           CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root';
           GRANT ALL PRIVILEGES ON cnergy.* TO 'root'@'%';
           FLUSH PRIVILEGES;