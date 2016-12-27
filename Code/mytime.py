import time

class timer:
 _things = []

 def __init__(self, callback, seconds=1, minutes=0, hours=0):
  interval = (hours*60*60) + (minutes*60) + seconds
  actionTime = time.time() + interval
  self._things.append({"callback":callback,"interval":interval,"actionTime":actionTime})

 def tick(self):
  now = time.time()
  for i in self._things:
   if i["callback"] == None:
    continue
   if now >= i["actionTime"]:
    i["callback"]()
    i["actionTime"] += i["interval"]

checkTimer = timer(None)

''' This is code to test and illustrate the usage '''
def printSecond():
 print "second"

def printTwoSeconds():
 print "twoseconds"

def printMinute():
 print "minute"

if __name__ == "__main__":
 # First create any timers you need
 oneSecond = timer(printSecond, seconds=1)
 twoSeconds = timer(printTwoSeconds, seconds=2)
 minute = timer(printMinute, minutes=1)

 # now once in a while call tick to let them happen
 while True:
  checkTimer.tick()
  # a sleep lets the cpu have a rest to do other things.
  time.sleep(0.5)
