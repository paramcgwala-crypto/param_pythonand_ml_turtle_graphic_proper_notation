marks = [78, 45, 89, 32, 67, 91, 55]

total = int(input("Enter the number"))
highest = int(input("Enter the number"))
lowest = int(input("Enter the number"))
passed = int(input("Enter the number"))
failed = int(input("Enter the number"))

for mark in marks:
    total = total + mark

    if mark > highest:
        highest = mark

    if mark < lowest:
        lowest = mark

    if mark >= 40:
        passed = passed + 1
    else:
        failed = failed + 1

average = total / len(marks)

print("Total Marks:", total)
print("Average:", average)
print("Highest Marks:", highest)
print("Lowest Marks:", lowest)
print("Passed Students:", passed)
print("Failed Students:", failed)