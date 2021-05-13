def getName():
    name = input("What's your name? ")
    return name

def getActivity():
    activity = ""
    while activity != "game" and activity != "outside":
        activity = input("Do you want to game or go outside? ")
    return activity

answer = "yes"
while answer == "yes":
    name = getName()
    print("Hello " + name + "!")

    activity = getActivity()
    if activity == "game":
        print("Let's game!")
    if activity == "outside":
        print("Let's go play tag!")

    answer = input("Do you want to go again? ")