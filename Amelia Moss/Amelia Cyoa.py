def getName():
    Name = input("Whats your name? ")
    return Name

def getActivity():
    activity = ""
    while activity != "game" and activity != "outside":
        activity = input("do you want to game or go outside? ")
    return activity 

answer  = "yes"
while answer == "yes":
     name = getName()
     print("Hello " + name + "!")

     activity = getActivity()
     if activity == "game":
        print("Let's game!")
     if activity == "outside":
        print("Lest go play tag!")

     answer = input("Do you want to go again? ")