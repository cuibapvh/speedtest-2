# HTML5 SpeedTest 中文版

一个基于 HTML5 并采用 XMLHttpRequest 和 Web Workers 的轻量级（部分）无后端服务器测速程序  
主要代码来自adolfintel
***
## ⚠警告
本程序所提供之测试结果受环境因素较大，**结果仅供参考**，其他原理相似的程序同理  
测试服务器或测试端如性能低下则可能导致测速结果异常，尤其对高速连接测速时请注意

如需较为准确的连接速度，建议使用 iperf 等专业工具
***
## 特点

支持测试上传、下载、延迟和抖动，显示使用者ip地址

## 截图展示

![Screenshot](https://raw.githubusercontent.com/wegood9/wegood9.github.io/master/images/showcase.jpg)

## 兼容性

支持所有现代浏览器(IE11, Edge, Chrome, Firefox, Safari)，及移动版本。

## 安装

### 使用ngnix
_使用ngnix时可以做到无后端_

下载本项目 master 分支到你的网站目录
```
git clone https://github.com/wegood9/speedtest.git -b master
```
ngnix配置示例（未经充分测试）
```
  server {
    listen 80;
    location = /favicon.ico {
      alias /var/speedtest/favicon.ico;
    }
    location / {
      root /var/speedtest;
    }
    location /ip {
      default_type text/plain;
      return 200 "${remote_addr}";
    }
    location /empty {
      default_type text/plain;
      return 200;
	  add_header Access-Control-Allow-Origin *;
	  add_header Access-Control-Allow-Methods "GET, POST";
	  add_header Cache-Control "no-store, no-cache, must-revalidate, max-age=0, s-maxage=0";
	  add_header Cache-Control "post-check=0, pre-check=0";
	  add_header Pragma no-cache;
    }
  }
```
此外还需提高ngnix接受POST包的大小
### 使用Caddy v1

_Caddy 必须使用后端，否则上传测试时会产生TCP_RST_
_，这里采用 CGI 作为后端_

安装 Caddy 并加载 CGI 中间件

下载本项目 caddy 分支到你的网站目录
```
git clone https://github.com/wegood9/speedtest.git -b caddy
```
Caddyfile 示例已提供

## test.js测速配置

请参考 [librespeed](https://github.com/librespeed/speedtest/blob/master/doc.md) 进行修改
***
## 感谢
相关开源项目  
https://github.com/mencargo/speed  
https://github.com/librespeed/speedtest