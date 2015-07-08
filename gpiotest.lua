--test D0 and D2
flip = 0
nightPin = 0
dayPin = 2
gpio.mode(nightPin,gpio.OUTPUT)
gpio.mode(dayPin,gpio.OUTPUT)

tmr.alarm(0, 1000, 1, function()
     if flip == 0 then
          gpio.write(nightPin,gpio.LOW)
          gpio.write(dayPin,gpio.LOW)
          flip = 1
     else 
          gpio.write(nightPin,gpio.HIGH)
          gpio.write(dayPin,gpio.HIGH)
          flip = 0
     end
end)