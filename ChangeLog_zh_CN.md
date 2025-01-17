+ 版本: v0.5.16
  - 修复 DockDebugLog 崩溃. 详见:  https://github.com/KangLin/RabbitCommon/commit/af2e434e39af35876113436ead2a946efcf74199

+ 版本: v0.5.15
  - 使用 RabbitCommon v2
  - 使用 CMake 管理工程

+ 版本: v0.5.14
  - 修复日志输出到文件

+ 版本: v0.5.13
  - 修复在 LINUX 下有不同版本依赖库时,不能加载正确的依赖库
  - 增加关闭窗口时,保存窗口状态

+ 版本: v0.5.12
  - 修复拼写错误
  - github actions:
    + msvc.yml 能够工作
  - 关于对话框中增加校订版本,并能直接从主库中打开.

+ 版本: v0.5.11
  - 更新与 RabbitCommon 相关的代码
  - 支持 Qt6
  - 修改 github actions
  - 重命名 tag.sh 到 deploy.sh
  
+ 版本: v0.5.10
  - 修复除 0 引起的崩溃。影响前面所有发行版本。此错误是 RabbitCommon 引起的。
    详见： https://github.com/KangLin/RabbitCommon/commit/7ed300a206d8a36c30003b6c19ad181682d0ff5f

+ 版本: v0.5.9
  - 增加镜像库
  - 修改自动化编译
    + 增加 github actions
  
+ 版本: v0.5.8
  - 用更新后的 RabbitCommon::CStyle
  
+ 版本: v0.5.7
  - 修改样式实现，用RabbitCommon::CStyle
  - 增加 QUIWidget 实现窗口
  
+ 版本: v0.5.6
  - 修改界面：增加收缩按钮
  - 增加状态指示
  - 自动化编译: 增加 github actions
  
+ 版本: v0.5.5
  - 修改一些杂项
  
+ 版本: v0.5.4
  - 修改一些 BUG
  - 增加打开保存文件和打开发送文件

+ 版本: v0.5.3
  - 修改界面
    + 增加流动界面
    + 修改编码
    + 修改十六进制发送
    + 修改发送文件

+ 版本: v0.5.2
  - 修改安装
  
+ 版本: v0.5.1
  - 修改自动化编译
  - 更新 RabbitCommon 接口
  - 修改更新
  - 增加 android 签名

+ 版本: v0.5.0
  - 修改捐赠

+ 版本: v0.4.9
  - 修改文档
  
+ 版本: v0.4.8
  - 修改 build
  
+ 版本: v0.4.7
  - 修改工程结构

+ 版本: v0.4.6
  - 修改 ci appimage

+ 版本: v0.4.5
  - 修改 RabbitCommon 语言 BUG
  
* 版本: v0.4.4
  - 修改 CI 错误
  - 修改样式
  
* 版本: v0.4.3
  - 修改工程文件，RabbitCommon以库工程方式加入到主工程文件中
  - 增加刷新串口工具。详见：Issues #3
  
* 版本: v0.4.2
  - 修改 linux CI 依赖库错误
  - 修改 install 文件
  
* 版本: v0.4.1
  - 使用 RabbitCommon v1.0.0
  - 使用 RabbitCommon 翻译
  
* 版本: v0.4.0
  - 修改 Install.sh
  
* 版本: v0.3.9
  - 只做 linux 下安装更新测试
  
* 版本: v0.3.8
  - 修改 tar 打包内容
  
* 版本: v0.3.7
  - 增加 update_linux_appimage.xml
  
* 版本: v0.3.6
  - 测试新版本号更新
  
* 版本: v0.3.5
  - 重新使用版本号 vX.X.X
  
* 版本: 0.3.7
  - 修改捐赠

* 版本: 0.3.6
  - 修改下载更新
  
* 版本: 0.3.5
  - 增加 LINUX 分发

* 版本: v0.3.4
  - 使用RabbitCommon库中的GlobalDir

* 版本: v0.3.3
  - 修改发送编码BUG
  - 增加在线更新
  - 增加 DEB 包
  
* 版本: v0.3.2
  - 增加加载文件
  - 增加日志文件
  - 增加接收保存到文件
  - 增加循环发送次数
  - 修改安装
  
* 版本: v0.3.1
  - 修改tag.sh

* 版本: v0.3.0
  - 修改自动化编译
  
* 版本: v0.2.0
  - 自动ci上传改为qt5.7，因为qt5.8后不再支持windowsxp

* 版本: v0.1.0
  - 修改打开串口（非COM开头）失败

* 版本: v0.0.9
  - 修改版本号的产生
  - 修改发送统计数
  - 限定QTextEdit的长度
  - 修改自动编译
  
* 版本: v0.0.8
  - 增加样式

* 版本: v0.0.7
  - 修改安装文件
  - 修改自动编译

* 版本: v0.0.6
  - 修改关于对话框
  - 修改编码显示
  - 修改语言菜单
  - 修改版权信息
  
* 版本: v0.0.5
  - 修改应用最近发送
  - 发送失败LOG
  - 修改显示时间格式

* 版本: v0.0.4
  - 修改安装包乱码错误（Install.nsi 必须是UTF8+[utf8 BOM]编码）

* 版本: v0.0.3
  - 保存设置
  - 增加英文 README
  - 修改一些 BUG
  - 增加tag脚本，修改版本号，Install.nsi

* 版本: v0.0.2
  - 完善界面

* 版本: 0.0.1
  - 完成基本串口功能
