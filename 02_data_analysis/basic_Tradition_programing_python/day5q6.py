percentage = int(input("Enter Percentage: "))
entrance = int(input("Enter Entrance Exam Score: "))

if percentage >= 75:
    if entrance >= 80:
        print("Admission Confirmed")
    else:
        print("Waiting List")

elif percentage >= 60 and percentage <= 74:
    if entrance >= 90:
        print("Admission Confirmed")
    else:
        print("Rejected")

else:
    print("Rejected")