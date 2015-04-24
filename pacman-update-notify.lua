local process
local exit_code

print("Synchronize database...")

process = assert(io.popen("pacman -Sy", "r"))
process:close()

print("Retrieve updates...")

process = assert(io.popen("pacman -Qu", "r"))
exit_code = {process:close()}

if exit_code == 0 then
	os.execute("su username -c 'notify-send \"Updates available\"'")
end
