# ==========================
# LIST
# ==========================

a = [100, 200, 3000, 5, 8]

print("List =", a)
print("Type =", type(a))

# Indexing
print(a[0])
print(a[1])
print(a[-1])

# Multiplication
print(a[1] * 4)

# Update List
a[0] = 5
print("Updated List =", a)

a[2] = 6 
print("Updated list =",a)

# List Slicing
print(a[1:3])
print(a[1:3:1])
print(a[1:5:2])
print(a[:])
print(a[::-1])

print("Length of List =", len(a))


# ==========================
# SET
# ==========================

b = {10000, 20000, 30000, 400000}

print("\nSet =", b)
print("Type =", type(b))

# Set me indexing aur slicing nahi hoti.
# Isliye niche wali line mat chalana:
# print(b[2])
# print(b[2:0])

print("Length of Set =", len(b))


# ==========================
# TUPLE
# ==========================

c = (10000, 40000, 300000)

print("\nTuple =","\n",c)
print("Type =", type(c))

# Tuple Indexing
print(c[0])
print(c[1])
print(c[-1])

# Tuple Slicing
print(c[0:2])

print("Length of Tuple =", len(c))


# ==========================
# COMPARISON
# ==========================

print("comaprison opereater use hova hai ",a[1] > 100)
print(c[2] > 100000)

# ==========================
# MODULUS
# ==========================

print(a[2] % 4)