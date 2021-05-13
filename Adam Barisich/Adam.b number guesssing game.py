import random 

name = input("Hello my name is Adam your number randomizer, whats your name? ")
print("Hello " + name  + " Nice to meet you I really like your name " + name) 

rand = random.randint(1,20)
guess = 0

while guess != rand:
    guess = int(input("What number am I thinking of " + name ))

    if guess == rand:
        print("Your are right " + name )

    if guess > rand:
        print("Your a bit high " + name )

    if guess < rand:
        print("Your bit low " + name )

 
