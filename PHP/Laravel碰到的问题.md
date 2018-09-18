## 打开 dubug 模式 查看错误信息

有时候会出现问题，有不知道具体的信息，所以需要打开laravel的debug模式，可能查看更多的输出。
进入到laravel项目的/app/config/app.php
//把配置中的debug的false改成true
'debug' => true

## 设置目录权限

chmod -R 775 app/storage
chmod -R 775 app/bootstrap/cache

Laravel下的storage 和 bootstrap/cache 需要可写权限，其他文件只需要降低到满足要求的最小权限。

## 初始化 .env

Laravel 出现"RuntimeException inEncrypter.php line 43: The only supported ciphers are AES-128-CBC and AES-256-CBC with the correct key lengths."问题的解决办法

如果没有 .env 先拷贝一份
cp .env.example .env
生成key
php artisan key:generate

## 安装vender

composer install
