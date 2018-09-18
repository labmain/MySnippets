1. 生成控制器
php artisan make:controller Admin/StudentController

2、生成模型

php artisan make:model User -m

默认的模型文件生成在App目录，如果要生成在其他目录要带目录，比方说我把Model放到了App/Models/目录，则执行

php artisan make:model Models/Question -m

-m参数为生成模型同时生成数据库创建文件
