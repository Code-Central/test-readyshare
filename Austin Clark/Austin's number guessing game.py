import random

name = input("What is your name?")
print("Hey " + name + " nice to meet you")

rand = random.randint(1, 20)

guess = int(input("What number am i thinking about"))

if guess == rand:
    print("You are right!")
if guess > rand:
    print("aaaww you guessed too high!")
     
if guess < rand:
    print("Dang, you guessed too low!")
     
