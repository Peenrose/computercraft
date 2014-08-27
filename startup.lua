-- installs and updates programs.

local id = os.getComputerID()
local link = "https://raw.githubusercontent.com/simon6689/computercraft/master/"

print("Computer #"..id.." Powering On...")

-- Check HTTP Connection

if not http then
	print("Error: HTTP API Disabled.")
	return
else
	print("HTTP API Enabled")
end

ping = http.get("http://www.pastebin.com/")
if ping.getResponseCode() == 200 then
	print("Error: HTTP Connection Offline")
	return
else
	ping.close()
	print("HTTP Connection Online")
end

ping = http.get("https://raw.githubusercontent.com/simon6689/computercraft/master/")
if ping.getResponseCode() == 400 then
	print("Error: GitHub Not Available")
	return
else
	ping.close()
	print("GitHub Connection Established")
end

-- Update Files

if fs.exists("config.lua") then
	--check what scripts are installed
	--check for updates
	--update programs
else

end