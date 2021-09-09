## 创建备份脚本  

```bash
#!/bin/bash
docker exec -t gitlab-ce gitlab-rake gitlab:backup:create
echo "Do"
```

## 备份后的文件所在目录为  

Local location	
`/docker/gitlab/data/backups`

Container location
`/var/opt/gitlab/backups`

## 还原备份  

1. 重新部署gitlab，并且新的gitlab版本必须与旧的gitlab一致
2. 复制备份到gitlab的backup目录  
```bash
cp 1550764828_2019_02_21_11.7.5_gitlab_backup.tar /opt/gitlab/data/backups/
chmod +r /opt/gitlab/data/backups/ 1550764828_2019_02_21_11.7.5_gitlab_backup.tar
```
3. 恢复gitlab

`docker exec -it gitlab-ce gitlab-rake gitlab:backup:restore`