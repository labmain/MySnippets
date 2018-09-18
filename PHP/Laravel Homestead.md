## 启动 OR 关闭
```bash
cd ~/Homestead
vagrant up ## 启动
vagrant halt ## 关闭
```
## 销毁

```bash
vagrant destroy –force
```
## 重载配置文件
如果你是在 `Homestead` 盒子启动之后进行了上述修改，需要运行 `vagrant reload --provision` 更新虚拟机上的 `Nginx` 配置。
