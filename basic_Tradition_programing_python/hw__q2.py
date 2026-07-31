"""Wap to check  wheather  a user given  day is   a valid day or not  """

user_given_day = (input("Enter the day")).strip().title()


if ( user_given_day == "Monday"or 
     user_given_day == "Tuesday" or 
     user_given_day == "Wednesday" or 
     user_given_day == "Thursday" or 
     user_given_day == "Friday" or 
     user_given_day == "Sataurday" or 
     user_given_day == "Sunday"):

     print(" A Valid day ")

else:
    print("Not Valid day")



