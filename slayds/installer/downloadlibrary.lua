local args = {...}
local file = args[1]
local path = http.get("https://sulfrix.github.io/slayds/content/".. file)
path = http.get("https://sulfrix.github.io/slayds/content/programs/".. file ..".lua")
local destpath = args[2]
program = fs.open("slaydsfiles/programfiles/".. destpath, "w")
program.write(path.readAll())
program.close()
path.close()
