import random
name = input("Whats your name,I am Zobo")

print("Hello" + name + "nice to meet you" )
rand = random.randint(1, 20)
print(rand)
guess = int(input("what number am I thinking of?"))
while guess != rand:
    if guess == rand:
        print("you are corect now leav  I know its tea time but leav")
    if guess > rand:
        print("Tooooooooooo hight :P")
    if guess < rand:
        print("you are not high enofe You arn't smart")
    guess = int(input("what number am I thinking of?"))
if guess == rand:
    print("I did not think you were smart enofe to figer it out.")