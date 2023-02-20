import aiohttp, asyncio
from sys import platform

if platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())


proxy_to_test = []

with open("servers.txt", "r", encoding="utf-8") as servers_list:
    servers = servers_list.read().split("\n")
    for server in servers:
        server_ip = server.split(":")[0]
        proxy_to_test.append(f"{server_ip}:3128")



async def test_proxy(proxy_arg):
    async with aiohttp.ClientSession() as session:
        async with session.get("https://ipinfo.io/json", proxy="http://" + proxy_arg) as response:
            if response.status == 200:
                print(f"{proxy_arg} is valid and ready to work!")
            else:
                print(f"{proxy_arg} | {response.status}")


async def test_all():
    tasks = []

    for i in proxy_to_test:
        tasks.append(asyncio.create_task(test_proxy(i)))
        
    await asyncio.gather(*tasks)


asyncio.run(test_all())