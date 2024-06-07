@echo off
echo Starting auto commit and push to git
git add .
git commit -m "Reconstruct the structure of git_control_way.md & expand its content"
git push
echo -----------------
echo -Task completed--
echo -----------------
pause
