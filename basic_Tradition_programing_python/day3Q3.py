num = int(input("Enter a number: "))

if num % 3 == 0 and num % 9 == 0 and num % 16 == 0:
    print("Number is divisible by 3, 9 and 16")
else:
    print("Number is not divisible by 3, 9 and 16")