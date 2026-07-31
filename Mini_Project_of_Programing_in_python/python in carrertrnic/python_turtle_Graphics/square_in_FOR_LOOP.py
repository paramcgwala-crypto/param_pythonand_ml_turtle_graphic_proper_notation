import turtle 

t = turtle.Turtle()



for i in range(100):        # 100 naye squares

    # ek square banao
    for S in range(4):
        t.forward(100)
        t.left(90)

    # next square ke liye direction change
    t.left(35)