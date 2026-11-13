# isme humne turtle ko multiple colour suke shape ke sath kaise change hoga ye sikh rahe hai 



import turtle 

screen = turtle.Screen()
screen.bgcolor("black")

t = turtle.Turtle()
t.speed(0)
colors = ["red", "blue", "green", "orange", "purple", "cyan"]

while True:

   for color  in colors :
    t.color(color)

    for i in range(4):
      t.forward(100)
      t.left(90)

    t.lt(35)

turtle.done()


      