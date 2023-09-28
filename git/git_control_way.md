### 设置

- git config --global user.name "Name"
- git config --global user.email "Mailname@mail"

### 常用命令

- git init 初始化新仓库
- git status 查看仓库状态
- git add . 添加所有未添加的文件

### 消息命令

- git commit -m "Started project" -m 表示将双引号内的消息记录到项目的历史记录中
- git commit -am "......" 第 n 次提交，-a 把所有修改了的文件添加进去

### 检查命令

- git checkout . 放弃最后一次提交后所做的所有修改，将项目恢复到最后一次提交时的情况
- git checkout 任意一次提交的 ID 的前六个字符
- git checkout -b 新建分支（一般配合上一条命令一起）
- git checkout master 回到主分支

### 日志

- git log 查看日志
- git log --pretty=oneline 查看精简日志
- 日志太长无法退出可以按 q 键

### 同步本地与 github

- git push 将本地的仓库同步到 github 上
- 若无法运行，请执行
  git config --global --unset http.proxy
  git config --global --unset https.proxy
- 仍无法执行，请关闭 VPN 重试
