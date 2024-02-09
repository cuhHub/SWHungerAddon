# // ---------------------------------------------------------------------
# // ------- [cuhHub] Tools - Combiner
# // ---------------------------------------------------------------------

# -----------------------------------------
# // ---- Imports
# -----------------------------------------
import os
import time

# -----------------------------------------
# // ---- Variables
# -----------------------------------------
mainPath = "src"
outputPath = "src/script.lua"

__allowedFileExtensions = [".lua"]
__fileExceptions = ["src/p1_framework/intellisense.lua"]
__folderExceptions = ["src/intellisense"]

# -----------------------------------------
# // ---- Functions
# -----------------------------------------
# // Read a file
def quickRead(path: str):
    with open(path, "r") as f:
        return f.read()
    
# // Write to a file
def quickWrite(path: str, content: str):
    with open(path, "w") as f:
        return f.write(content)
    
# // Check if path is in list
def pathInList(path: str, paths: list):
    for currentPath in paths:
        if os.path.samefile(path, currentPath):
            return True
        
    return False

# // Get contents of all files in a path
def recursiveRead(targetDir: str, allowedFileExtensions: list[str], fileExceptions: list[str], folderExceptions: list[str]) -> dict[str, str]:
    # list files
    files = os.listdir(targetDir)
    contents = {}
    
    # iterate through them
    for file in files:
        # get file-related variables
        _, extension = os.path.splitext(file)
        path = os.path.join(targetDir, file)
        
        # file extension check
        if extension == "":
            # file is folder, but is an exception
            if pathInList(path, folderExceptions):
                continue
            
            # file is folder, so read it too
            contents = {**contents, **recursiveRead(path, allowedFileExtensions, fileExceptions, folderExceptions)}
            
        # correct extension check
        if extension not in allowedFileExtensions:
            continue
            
        # exceptions check
        if pathInList(path, fileExceptions):
            continue
        
        # get file content
        content = quickRead(path)
        
        # append file content to contents
        contents[path] = content
        
    return contents

# -----------------------------------------
# // ---- Main
# -----------------------------------------
# // Setup
# create output path
folder = os.path.split(outputPath)[0]

if folder != "":
    os.makedirs(folder, exist_ok = True)

quickWrite(outputPath, "")

# prevent combining output file and this file
__fileExceptions.extend([outputPath, os.path.relpath(__file__)])

# // Main combine loop
while True:
    # wait
    time.sleep(0.1)
    
    # get content of all files
    result = recursiveRead(
        mainPath,
        __allowedFileExtensions,
        __fileExceptions,
        __folderExceptions
    )
    
    # print message
    print("Combined the following files:\n- " + "\n- ".join([path.replace("\\", "/") for path in result.keys()]))
    
    # format result
    for path, content in result.items():
        newContent = [
            "----------------------------------------------",
            f"-- // [File] {path}",
            "----------------------------------------------",
            content
        ]
        
        result[path] = "\n".join(newContent)

    # dump it into output file
    try:
        quickWrite(outputPath, "\n\n".join(result.values()))
    except:
        print("Failed to output.")