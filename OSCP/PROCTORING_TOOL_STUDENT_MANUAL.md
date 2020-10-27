# 监考工具学生手册

声明 ：此中文版翻译截止 2020 年 9 月。

原文地址:[https://support.offensive-security.com/proctoring-tool-student-manual/](https://support.offensive-security.com/proctoring-tool-student-manual/)

---

该手册适用于 OSCP/OSCE/OSWE 考试。

参加考试前，请确认以下信息:

- 确保您已收到您的 OSID 和 MD5。
- 确保您使用的是支持的操作系统。
- 确保您使用的是带有摄像头的系统。
- 确保您使用的是谷歌浏览器。
- 确保你已经安装了 Janus 插件。

## 步骤 1：登录

请登录网址：[https://proctoring.offensive-security.com/Student/login](https://proctoring.offensive-security.com/Student/login)

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled.png)

1. 请输入您的 OSID
2. 请输入您的 MD5
3. 点击登录
4. 如果您无法登录，请用您的 OSID 联系`proctoring@offensive-security.com`

## 第 2 步：允许许可

成功登录后，Chrome 会提示您允许以下请求：

1. 请允许 "显示通知 "来接收来自 Proctors 的聊天通知。
2. 请允许 "使用您的相机"，以便监考人员看到您。

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%201.png)

如果请求被允许，"Webcam "和 "OS "图标将变成绿色，并带有一个勾号。
请输入你想在整个考试过程中显示的名字，然后点击 "开始"。

注意：在你参加考试时，这个名字不会在任何地方被使用，除非是为了确认身份

**如果 "网络摄像头 "检查失败，请尝试：**

1. 检查网络摄像头是否连接到系统上/在笔记本上启用
2. 遵循步骤 5

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%202.png)

## 第 3 步：JANUS 插件安装

如果您没有安装 Janus Plugin，则会弹出提示，要求您安装该插件，要继续进行考试，必须安装此插件。

请添加扩展，并刷新登陆页面，允许屏幕共享。

- 如果还没有安装 Janus 扩展，会提示安装 Janus 扩展：

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%203.png)

- Janus WebRTC Extension 的安装。请点击 "添加到 Chrome 浏览器"：

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%204.png)

- 允许安装 Janus 扩展。请点击 "添加扩展"：

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%205.png)

- 一旦 Janus WebRTC 扩展完成，你可以看到确认信息：

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%206.png)

## 第 4 步：允许屏幕共享

在开始考试之前，请分享您的屏幕。

如果安装了 Janus WebRTC Extension，应用程序将提示您共享屏幕。请注意，当屏幕刷新时，会提示您再次共享屏幕。

### 单屏

1. 您将被提示分享您的屏幕。
2. 请选择 "您的整个屏幕 "并点击 "共享"。
3. 你可以看到一个新的标签/通知，说明你正在分享你的屏幕。

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%207.png)

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%208.png)

**请注意**

在某些操作系统中，通知可以在同一标签页的底部，而在其他操作系统中，它可以在一个单独的标签页上。
在考试过程中，请不要在任何时候 "停止分享"。
如果不能共享屏幕，请刷新屏幕，并重复以上步骤。

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%209.png)

### 多屏

1. 先分享'屏幕 1'。
2. 共享屏幕 1 后，从下拉菜单中选择屏幕数量。
3. 根据从下拉菜单中选择的数量，会提示共享屏幕。
4. 请选择并分享每个提示中的相应画面。
5. 请在每个提示中仅从 "您的整个屏幕 "中选择屏幕。

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%2010.png)

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%2011.png)

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%2012.png)

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%2013.png)

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%2014.png)

## 步骤 5：核查

1. 请点击地址栏上的 "安全 "图标。
2. 请确认相机和通知访问是否为 "允许"。
3. 请确认屏幕共享已启用。
4. 请确认应用程序上显示的 OSID 是您的。
5. 请确认您可以通过聊天发送消息。
6. 加入代理后，您可以通过点击右上角的下拉菜单查看所有代理。

![](https://isecurityclub-1253463441.cos.ap-chengdu.myqcloud.com/Untitled%2015.png)

## 应用功能

- **HIDE WEBCAM**

`HIDE WEBCAM`功能将您的摄像头从您的应用程序中隐藏起来，以获得无缝体验，监护人仍然可以看到您的摄像头。

- **PAUSE WEBCAM**

`PAUSE WEBCAM` 功能要求监考员暂停你的网络摄像头。当你需要长时间的休息或在运行一个需要屏幕共享的脚本时，你可以使用这个选项。

暂停/恢复摄像头是由监考员从他们的一端开始。一旦监考员暂停了网络摄像机，他们将无法查看您的网络摄像机。当你回到你的办公桌时，请 "恢复摄像头"，要求恢复你的摄像头。

- **END SESSION**

此功能从您的一端结束您的考试。这将停止考试，**并且您将无法重新加入考试**。

如果您不小心结束了您的考试并想安排一个新的考试，请联系 [proctors@offensive-security.com](mailto:proctors@offensive-security.com)。
