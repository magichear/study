### 设置

    git config --global user.name "Name"
    git config --global user.email "Mailname@mail"

### 常用命令

- 初始化新仓库

      git init

- 查看仓库状态

      git status

- 添加所有未添加的文件

      git add .

### 消息命令

- -m 表示将双引号内的消息记录到项目的历史记录中

      git commit -m "Started project"

- 第 n 次提交，-a 把所有修改了的文件添加进去

      git commit -am "......"

### 检查命令

- 放弃最后一次提交后所做的所有修改，将项目恢复到最后一次提交时的情况

      git checkout .

- 任意一次提交的 ID 的前六个字符

      git checkout

- 新建分支（一般配合上一条命令一起）

      git checkout -b

- 回到主分支

      git checkout master

- 查看 commit 次数：

```bash
git rev-list --count HEAD
```

这个命令会返回一个数字，表示你在当前分支上做了多少次 commit。

- 查看 push 次数：
  - Git 并没有直接提供查看 push 次数的命令，因为 push 操作并不会在本地仓库留下记录。
  - 然而，你可以通过查看远程仓库的 commit 记录来间接得到这个信息。
  - 例如，如果你想查看你向 `origin/main` 分支的 push 次数，可以使用以下命令：

```bash
git rev-list --count origin/main
```

这个命令会返回一个数字，表示 `origin/main` 分支上有多少次 commit。如果你每次都是在本地做了 commit 之后立即进行 push，那么这个数字就可以看作是 push 次数。

### 日志

- 查看日志

      git log

- 查看精简日志

      git log --pretty=oneline

- 日志太长无法退出可以按 q 键

### 同步本地与 github

- 将本地的仓库同步到 github 上

      git push

- 若无法运行，请执行

      git config --global --unset http.proxy
      git config --global --unset https.proxy

- 仍无法执行，请关闭 VPN 重试

      当然，建议使用ssh进行连接

- 将 github 上的仓库同步到本地

      git pull

### 自动拉取、提交

**GPU.bat**

```sh
@echo off
echo Starting auto commit and push to git
git add .
git commit -m "Normal update"
git push
echo -----------------
echo -Task completed--
echo -----------------
pause
```

**GPU. sh**

```sh
#!/bin/bash
echo "Starting auto commit and push to git"
git add .
git commit -m "Normal update1"
# 唤醒ssh，我的linux环境下非常需要这一步
eval "$(ssh-agent -s)"
git push
echo "-----------------"
echo "-Task completed--"
echo "-----------------"
read -p "Press enter to continue"
```

**GitPull.bat**

```sh
@echo off
echo Starting pull
git reset --hard
git pull
echo -----------------
echo -Task completed--
echo -----------------
pause
```

**GitPull. sh**

```sh
#!/bin/sh
eval "$(ssh-agent -s)"
# 撤销所有修改，因为我的linux环境主要用于测试
git reset --hard
git pull
```

**Githelp.bat**

```sh
start  https://magichear.github.io/study/docs/shortcut/#git
```
