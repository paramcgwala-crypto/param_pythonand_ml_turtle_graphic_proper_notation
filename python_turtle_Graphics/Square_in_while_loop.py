import turtle 

t = turtle.Turtle()
t.speed(0)


# while true krne se  wo infinite time loop mai chala jata hai 

while True:
  
# pattern ke jitne sides hai utne range mai likne hote hai 

  for i in range(4):
       t.fd(100)
       t.lt(90)

# ab hame loop ke sath thoda ghuman padega tab next square bnata jayega and infinite time 

       t.lt(35)

turtle.done()