本项目用于为 FlutterDemo 项目提供服务支持

通过 IIS Express 启动此项目后，模拟器和局域网可能无法访问，请做如下配置
1、将 Properties/launchSettings.json 中的 iisSettings.iisExpress.applicationUrl 配置为 ip 加端口的方式，比如 http://192.168.8.197:42656
2、如果修改后无法启动，可能是权限问题，通过管理员打开 PowerShell 后执行类似如下的命令即可 netsh http add urlacl url=http://192.168.8.197:42656/ user=everyone
3、重启 vs 和 IIS Express 后就可以了