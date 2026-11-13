# write stire five subject 75 8o 65,92,50  in a list and them calculate the percentage the marks of the student i the percentage is greaterthan 75  then print great a ig the percentage between 33 and 75  pritn great b and if the pecentage  less then 33 print fail  maximum marks per subject is 100

marks= [75,80,65,90,50]

percentage = sum(marks)/500*100


if percentage >= 75:
   print("Greate you are doing great")

elif percentage >= 33 and percentage >= 75:
    print("B")

elif percentage <=33:
    print("Fail")
else:
    print("You are very bad student")
