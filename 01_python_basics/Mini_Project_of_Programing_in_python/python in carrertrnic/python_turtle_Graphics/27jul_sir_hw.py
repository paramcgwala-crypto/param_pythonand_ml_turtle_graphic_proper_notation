import turtle

t = turtle.Turtle()

for j in range(4):
    for i in range(4):
        t.forward(50)
        t.right(90)

    t.penup()
    t.forward(20)
    t.right(90)
    t.forward(20)
    t.left(90)
    t.pendown()

turtle.done()