print("Enter a URL to download the contents of it.")
local file = read()
print("Where should this be stored? (this makes a new file if it doesn't already exist. Otherwise, it overwrites the file.)")
local dest = read()
local path = http.get(file)
program = fs.open("dest", "w")
program.write(path.readAll())
program.close()
path.close()
print("File downloaded.")
