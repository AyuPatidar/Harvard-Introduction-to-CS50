from cs50 import get_int

# get height from user
while True:
    h = get_int("Height: ")
    if h > 0:
        if h < 9:
            break

# print pyramid
for i in range(h):
    print(" "*(h-i-1), end="")
    print("#"*(i+1), end="")
    print("  ", end="")
    print("#"*(i+1))