py combine.py --directory "src" --destination "src/script.lua" --allow_file_extension ".lua" --ignore_path "playlist.xml" --ignore_path "src/intellisense" --ignore_path "src/p1_framework/intellisense.lua"
py sync.py -sf "src" -d "%appdata%/Stormworks/data/missions/SWHungerAddon"