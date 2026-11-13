import  turtle 

screen = turtle.Screen()
screen.bgcolor("black")

t = turtle.Turtle()
t.speed(0)
colors = ["red","blue", "green", "orange", "purple", "cyan"]

while True:

     for color in colors:
        t.color(color)



     for i in range(5):
        t.fd(100)
        t.lt(72)


        t.lt(35)

turtle.done()