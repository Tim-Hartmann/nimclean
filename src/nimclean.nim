import os, rdstdin

var path: string
var skipConfirm: bool = false

## Cmd param parsing
let pCount = paramCount()
if pCount == 0:
  path = $CurDir
elif pCount == 1:
  let param1 = paramStr(1)
  if param1 == "-y":
    path = $CurDir
    skipConfirm = true
  else:
    path = param1
elif pCount == 2:
  for p in [paramStr(1), paramStr(2)]:
    if p == "-y":
      skipConfirm = true
    elif $p[0] != "-":
      path = p

## User confirmation
if not skipConfirm:
  skipConfirm = (readLineFromStdin("Nimclean is aimed at " & 
    absolutePath(path) & 
    ". Continue (y/N)?:") in ["y","Y"])

# Action
if skipConfirm:
  if not (absolutePath(path) == "/"):
    for i in walkDirRec(path):
      let fileSplit = splitFile(i)
      if ".nim" == fileSplit.ext:
        let binaryPath = absolutePath(fileSplit.dir & "/" & fileSplit.name)
        if existsFile(binaryPath):
          echo "removing " & binaryPath
          removeFile(binaryPath)
  else:
    echo "please don't run from /" & path
else:
  echo "aborting"