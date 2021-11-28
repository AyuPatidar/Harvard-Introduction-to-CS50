import math
import cs50

l = 0.0     # letter count
s = 0.0     # sentence count
w = 1.0     # word count
temp = 0.0
index = 0
L = 0.0     # Letter count per 100 words
S = 0.0     # Sentence count per 100 words

# get text from user
a = cs50.get_string("Text: ")

# Count letters, words & sentences in the text
for c in a:
    if c >= "A" and c <= "Z":
        l += 1
    if c >= "a" and c <= "z":
        l += 1
for c in a:
    if c == " ":
        w += 1
for c in a:
    if c == "." or c == "?" or c == "!":
        s += 1

L = (l*100)/w
S = (s*100)/w
temp = (0.0588 * L) - (0.296 * S) - 15.8
index = round(temp)
print(index)
if index < 1:
    print("Before Grade 1")
elif index > 16:
    print("Grade 16+")
else:
    print(f"Grade {index}")