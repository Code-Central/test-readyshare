import random

name = input("What's your name? ")
print("Hello " + name + " nice to meet you!")

rand = random.randint(1, 20)
guess = 0

while guess != rand:

    guess = int(input("What number am I thinking of? "))
        
    if guess == rand:
        print("YOU WERE CORRECT!!!")

    if guess > rand:
        print("You're too high!")

    if guess < rand:
        print("You're too low!")