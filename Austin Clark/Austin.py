import time
def getName():
  name = input("What's your name? ")
  return name

 
def getActivity():
  activity = ""
  while activity != "game" and activity != "outside":
    activity = input("Do you want to play a game or go outside?")
  return activity

name = getName()
print("Hello " + name + "!")

answer = "yes"
while answer == "yes":

  activity = getActivity()
  if activity == "game":
    print ("Let's game!")
  if activity == "outside":
    print("Lets go play tag!")
    
  time.sleep(2)
  print("that was fun!!")
  answer = input("Want to go again?")
  
