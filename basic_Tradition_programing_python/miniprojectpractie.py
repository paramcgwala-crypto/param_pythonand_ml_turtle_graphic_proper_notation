marks = [78, 45, 89, 32, 67, 91, 55]

total = 0
highest = marks[0]
lowest = marks[0]
passed = 0
failed = 0

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