import turtle

t = turtle.Turtle()
t.speed(5)

# Face
t.pen(pencolor="black", fillcolor="yellow", pensize=5)

t.penup()
t.goto(0, -100)
t.pendown()

t.begin_fill()      # Fill start
t.circle(100)
t.end_fill()        # Fill end

# Left Eye
t.penup()
t.goto(-35, 30)
t.dot(15)

# Right Eye
t.goto(35, 30)
t.dot(15)

# Smile
t.goto(-40, -20)
t.setheading(-60)
t.pendown()
t.circle(50, 120)

turtle.done()