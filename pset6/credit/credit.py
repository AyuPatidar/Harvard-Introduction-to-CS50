from cs50 import get_int
import sys

# get card nober from user
no = get_int("number: ")
temp = no
n = 0
sum = 0
f = 0
temp2 = 0
i = 0

# Apply luhn's algorithm
while temp >= 1:
    n += 1
    # for even places
    if (n % 2) == 0:
        i = ((temp % 10) * 2)
        if i > 9:
            temp2 = 0
            for j in range(2):
                temp2 = temp2 + (i % 10)
                i /= 10
        else:
            temp2 = i
        sum += temp2
    # for odd places
    else:
        sum = sum + (temp % 10)
    temp /= 10
    temp = int(temp)
    sum = int(sum)
temp = no

# terminating program if end digit of sum is not 0
if (sum % 10) != 0:
    print("INVALID")
    sys.exit(0)

# Printing company of card. Also, the flag comes in action here
# Checking conditions for American Express
if n == 15:
    for i in range(14):
        if int(no / 10) == 34 or int(no / 10) == 37:
            print("AMEX")
            f = 1
        no /= 10
# conditions for VISA
elif n == 13 or n == 16:
    for i in range(16):
        if int(temp / 10) == 4:
            print("VISA")
            f = 1
        temp /= 10
# condition for MASTERCARD
if n == 16 and f == 0:
    for i in range(14):
        if int(no / 10) == 51 or int(no / 10) == 52 or int(no / 10) == 53 or int(no / 10) == 54 or int(no / 10) == 55:
            print("MASTERCARD")
            f = 1
        no /= 10
# Rest all cases involved
if f == 0:
    print("INVALID")