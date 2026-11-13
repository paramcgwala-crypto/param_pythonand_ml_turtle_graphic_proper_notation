total = 0

for i in range(1, 4):
    for j in range(1, 4):
        if i == j:
            total = total + i * j
        else:
            total = total + 1

print(total)