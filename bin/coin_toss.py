#!/usr/bin/python

import random

if __name__ == "__main__":
        gen = random.Random()
        no_of_rounds = int(input("Enter number of rounds: "))
        no_of_toss = int(input("Enter number of coin toss: "))
        heads = input("Enter prompt for heads: ")
        tails = input("Enter prompt for tails: ")
        score = 0
        score_heads = 0
        score_tails = 0
        for round in range(no_of_rounds):
            for var in range(no_of_toss):
                if gen.randint(0,1) == 0:
                    print(heads)
                    score = score + 1
                else:
                    print(tails)
            if score > ( no_of_toss - score):
                    print("HEAD WINS!!!")
                    score_heads = score_heads + 1
            elif score == ( no_of_toss - score):
                    print("It's a TIE!!!")
            else:
                    print("TAIL WINS!!!")
                    score_tails = score_tails + 1
            input("Score - Heads : %s Tails : %s" % (score_heads, score_tails))

        if score_heads > score_tails:
            print("Heads has won\n%s" % (heads, ))
        else:
            print("Tails has won\n%s" % (tails, ))
