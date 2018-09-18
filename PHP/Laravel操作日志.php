<?php
use Log;
 <!-- 在你的每个方法中写入：  -->
Log::info('This is some useful information.');

Log::warning('Something could be going wrong.');

Log::error('Something is really going wrong.');

<!-- 三个方法随意调用. -->

<!-- 然后去运行你的网页。 -->
<!-- 之后回到目录   /storage/logs/laravel.log中看一看是否已经存到日志中。如果存到的话。 -->
<!-- 接下来就是使用 file_get_contents() 可以从文件中读取了; -->
