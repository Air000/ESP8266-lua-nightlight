-- get time from baidu.com 
hour = 0
minute = 0
second = 0

print("Getting time...")
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload)
   print(payload)
   time = string.sub(payload,string.find(payload,"Date: ")+23,string.find(payload,"Date: ")+31)
   hour = string.sub(time, 0, 2) + 8
   minute = string.sub(time, 4,5) + 0
   second = string.sub(time, 7,9) + 0
   print(hour.."-"..minute.."-"..second)
   conn:close()
   lastUpdate = 0
   end) 
conn:dns('nodemcu.com',function(conn,ip) 
   print(ip)
   ipaddr=ip 
   end)
conn:connect(80,ipaddr) 
heap = node.heap()
conn:send("HEAD / HTTP/1.1\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; ESP8266 NodeMcu Lua;)\r\n") 
conn:send("\r\n")
