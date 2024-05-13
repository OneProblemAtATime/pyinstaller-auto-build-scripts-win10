rem Allows variable changes throughout the script
setlocal enabledelayedexpansion

rem Make a virtual environment
python -m venv exebuildenv

rem Move required folders
copy main.py ".\exebuildenv\Scripts\"

rem Installed required python libraries
.\exebuildenv\Scripts\pip install -r requirements.txt

rem Build project
.\exebuildenv\Scripts\pyinstaller .\exebuildenv\Scripts\main.py --upx-dir=.\upx.exe -y --onefile

set foldername=%date:~-7,2%.%date:~-10,2%.%date:~-4,4%-"%time:~0,2%.%time:~3,2%.%time:~6,2%

set foldername=!foldername: =!

mkdir !foldername!

rem Place compiled executable in base folder
copy .\dist\main.exe .\%foldername%\

rem Clean up
rm -rf build
rem rm -rf exebuildenv
rm -rf dist
rm main.spec