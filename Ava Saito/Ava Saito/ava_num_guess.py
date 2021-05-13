import random

name = input("What's yor name?")
print("Hello" + name + "nice to meet you!")

rand = random.randint(1, 20)
guess = 0

while guess !=rand:

    guess = int(input("What number am I thinking of? "))

    if guess == rand:
        print("You were right!")

    if guess > rand:
        print("You guess too high!")

    if guess < rand:
        print("You guessed too low!")