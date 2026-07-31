"""3. WAP to check convert user given speed in m/sec to km/hr and if the speed is greater than 60 km/hr,
 print a challan of 2000Rs else print good citizen. """

user_speed = float(input("Enter ther speed in m/sec: "))

speed_km_hr = user_speed* 3.6


if speed_km_hr >= 60 :
    print("Challan of 2000 rupess is done")


else:
    print("you are good citizen ")

