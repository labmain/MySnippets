@>mysql -u root -p
@>密码
mysql>update mysql.user set password=password(‘新密码’) where User=”jeecn” and Host=”localhost”;
mysql>flush privileges;
mysql>quit;
