def getname():
    name = input("What's you name adventurer? I am Adam you guide " )
    return name

def getActivity():
    activity = ""
    while activity != "game" and activity != "outside":
        activity = input("Do you want to play Beat Sir.Spank or have some fun outside or do you want to play fortnite ")
    return activity

answer = "yes"
while answer == "yes":
  name = getname()
  print("Hello Adventurer "  + name +  "! Sir.Spank has TAKE IN THE KING AND HERE NEEDS YOUR HELP")

   activity = getActivity()
   if activity == "Lets play some Beat Sir.Spank":
       print("Opening BEAT SIR.SPANK")
   if activity == "no lets play outside":
       print("Your a terable person your dumb and dumb and dumb and dumb and dumb and dumb and dumb and dumb")
    if activity == "No lets play fortnite":
       print("Ok I like Fortnite too cool " + name + )   






















