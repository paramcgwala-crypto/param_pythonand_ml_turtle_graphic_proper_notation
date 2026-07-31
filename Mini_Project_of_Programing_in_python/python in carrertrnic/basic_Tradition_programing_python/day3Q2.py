p = int(input("Enter the  principal"))
t = int(input("Enter the  Time  "))
r = int(input("Enter the Rate "))

a = p * (1 + r/100) ** t

ci = a - p

print("Amount =", a)
print("Compound Interest =", ci)
