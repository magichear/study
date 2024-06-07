@echo off
echo Starting auto commit and push to git
git add .
git commit -m "重构git_control_way文件结构并扩展内容"
git push
echo -----------------
echo -Task completed--
echo -----------------
pause
