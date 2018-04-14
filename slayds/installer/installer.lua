local args = {...}
local file = args[1]
local path = http.get("https://theslaymann.github.io/slayds/content/programs/".. file ..".lua")
if not fs.exists("slaydsfiles/program") then
  if not fs.exists("slaydsfiles/") then
    fs.makeDir("slaydsfiles/")
  end
  local program = fs.open("slaydsfiles/program", "w")
  program.close()
end
program = fs.open("slaydsfiles/program", "w")
program.write(path.readAll())
program.close()
path.close()
print("Program has finished downloading. Run it?")
print("[Y] Run the program")
print("[N] Don't but save it")
print("[S] Save the program somewhere")
local event, key = os.pullEvent("key")
if key == keys.y then
  shell.run("clear")
  shell.run("slaydsfiles/program")
end
if key == keys.n then
  print("File saved to slaydsfiles/program")
end
if key == keys.s then
  shell.run("clear")
  print("Enter the path for the program.")
  local destpath = read()
  program = fs.open(destpath, "w")
  program.write(path.readAll())
  program.close()
  path.close()
end
