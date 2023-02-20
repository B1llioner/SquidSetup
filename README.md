# SquidSetup
This 2 .sh scripts allows to make fast setup of squid-proxy to all servers from "servers.txt"

**Donate: 0x0e09a18d1ee2FA15AC811cBAe5169434781a1974**


- First you need to install sshpass by command "sudo apt-get install sshpass"
- After that, you need to fill your servers to "servers.txt" in format ip:port:login:password
- Replace YOUR_IP_ADDRESS in script2.sh to your actual ip address (this need to add access from your ip to proxy)
- Run "sh script.sh"
- Run "sh script2.sh"

After all actions, you can test your proxies through "test_proxies.py"

For that script you will need to install:
- python<3.9
- "aiohttp" library for python<3.9

You can install library by run command:
- "python -m pip install aiohttp"
