行策略是用于控制 PowerShell 脚本的安全级别的一种设置。默认情况下，Windows 的执行策略设置为 "Restricted"，它禁止运行任何脚本 ⁴。

要解决这个问题，你可以尝试以下方法：

1. 以管理员身份运行 PowerShell：右键点击开始菜单中的 PowerShell，然后选择 "以管理员身份运行"。
2. 在管理员模式下，你可能会有权限更改执行策略。输入以下命令来更改执行策略：

```powershell
set-executionpolicy remotesigned
```

然后选择“是”，即可。这样你的电脑上就可以执行自己编写的脚本文件了。

如果你想要了解计算机上的现用执行策略，可以打开 PowerShell 然后输入以下命令 ¹²³：

```powershell
get-executionpolicy
```

这将显示当前的执行策略。希望这些信息对你有所帮助！

### 新建页面

```powershell
hexo new page custom-name

hexo new post name
```
