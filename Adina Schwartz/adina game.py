def getname():
    name = input("whats your name?")
    return name

def getActivity():
    activity = ""
    while activity != "game" and activity != "outside":
        activity = input("Do you want to play a game or go outside?")
    return activity

   
def getFriend():
    friend = ""
    while friend != "Emma"  and friend != "Jackson":

        friend = input("Do you want to play with Emma or Jackson?")
    return friend
name = getname()
print("Hello" + name + "!")
print("Lets PLAY PLAY PLAY!!!!")

activity = getActivity()
print("Hello" + name +  "!")
if activity =="game":
    game = ""
    while game != "Roblox" and game != "Hollow Knight":
        game = input("Do you want to play Roblox or Hollow Knight?")
if activity == "outside":
    print("Lets find a friend! ")
    getFriend()