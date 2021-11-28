import sys
import csv


def main():

    # Check for the number of arguments passed
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        sys.exit(0)

    # Reading the csv file
    persons = []
    with open(sys.argv[1]) as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            persons.append(row)

    # for row in persons:
    #     print(row)

    # Reading the sequence text file
    sequence = []
    with open(sys.argv[2]) as txtfile:
        reader = csv.reader(txtfile)
        for row in reader:
            for c in row:
                sequence = c

    char = persons[0][1]
    count = 0
    k = 0
    for j in range(0, len(sequence), 1):
        ch = sequence[j:j+len(char)]
        if ch == char:
            k += 1
            if k > count:
                count = k
            if sequence[j+len(char):j+len(char)+len(char)] != char:
                k = 0

    flag = 0
    possible_match = persons[1]
    result = False

    for person in persons[1:len(persons):1]:
        if int(person[1]) == count:
            possible_match = person
            result = check(persons[0], possible_match, sequence)
        if result == True:
            flag = 1
            print(possible_match[0])
            break
    if flag == 0:
        print("No match")


def check(persons, possible_match, sequence):
    for i in range(1, len(persons), 1):
        count = 0
        k = 0
        char = persons[i]
        for j in range(0, len(sequence), 1):
            ch = sequence[j:j+len(char)]
            if ch == char:
                k += 1
                if k > count:
                    count = k
                if sequence[j+len(char):j+len(char)+len(char)] != char:
                    k = 0
        if count != int(possible_match[i]):
            return False
    return True


main()