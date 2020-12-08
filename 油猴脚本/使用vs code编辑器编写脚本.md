* 浏览器开启TamperMonkey,访问本地文件的权限；
新建一个脚本，require 填写本地地址
```js
// ==UserScript==
// @name         小脚本
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @require      file:///Users/shun/Dropbox/Code/TamperMonkey/untitled.js
// @author       You
// @match        https://www.baidu.com/*
// @grant        unsafeWindow
// ==/UserScript==
```