### tomcat需要java环境才能运行
1. 下载安装jdk
http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html
2. 为什么要配置变量环境
    1. PATH环境变量。作用是指定命令搜索路径，在shell下面执行命令时，它会到PATH变量所指定的路径中查找看是否能找到相应的命令程序。我们需要把 jdk安装目录下的bin目录增加到现有的PATH变量中，bin目录中包含经常要用到的可执行文件如javac/java/javadoc等待，设置好 PATH变量后，就可以在任何目录下执行javac/java等工具了。 
    2. CLASSPATH环境变量。作用是指定类搜索路径，要使用已经编写好的类，前提当然是能够找到它们了，JVM就是通过CLASSPTH来寻找类的。我们 需要把jdk安装目录下的lib子目录中的dt.jar和tools.jar设置到CLASSPATH中，当然，当前目录“.”也必须加入到该变量中。 
    3. JAVA_HOME环境变量。它指向jdk的安装目录，Eclipse/NetBeans/Tomcat等软件就是通过搜索JAVA_HOME变量来找到并使用安装好的jdk。 
3. 配置java环境
    1. 在“系统变量”中，设置3项属性，JAVA_HOME,PATH,CLASSPATH(大小写无所谓),若已存在则点击“编辑”，不存在则点击“新建”;
    2. `“JAVA_HOME”`，`“C:\Program Files\Java\jdk1.6.0”`（根据安装路径填写）
    3. “PATH”使得系统可以在任何路径下识别java命令，设为：
    `%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin`
    4. `“CLASSPATH”`为java加载类(classorlib)路径，只有类在classpath中，java命令才能识别，设为：
    `.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar`
    (要加.表示当前路径)%JAVA_HOME%就是引用前面指定的JAVA_HOME;

4. 测试java是否安装成功
    1. 运行——cmd
    2. 输入java，如果显示下面界面，就说明配置成功
![](http://7xpp6e.com1.z0.glb.clouddn.com/2016-09-27-15%3A53%3A24.jpg)

### 配置server.xml
1. 修改默认的apps  
![](http://7xpp6e.com1.z0.glb.clouddn.com/2016-09-27-15%3A55%3A33.jpg)
2. 添加一条：
`<Context path="" docBase="D:\web\O2jamRank2" reloadable="true" crossContext="false" />`
重启tomcat，即可生效
