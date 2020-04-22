#Drew H Meseck
#Card Insert Generator
#YGO-Database-Project

#Takes csv of cards and returns a .txt output file of mySQL insert statements for the "Card" table. 
#This will be used to generate other insert statements for other tables.

import sys
import random


def getbox(ID):
    if(len(ID) == 10):
        return ID[0] + ID[1] + ID[2] + ID[3]
    else:
        return ID[0] + ID[1] + ID[2]

def getPrice(rarity):
    if(len(rarity) <= 1):
        return str(7 + random.randint(0, 7))
    r = rarity[0] + rarity[1]
    r = r.lower()
    p = 0
    if(r == "co"):
        p = 1
    elif(r == "su"):
        p = 5
    elif (r == "ul"):
        p = 10
    elif (r == "se"):
        p = 20
    elif (r == "ra"):
        p = 2
    else:
        p = 3
    
    rand = random.randint(0, p)
    p = rand + p
    return str(p)
    
    return "$10"

def generate_line(line, fout): # generates one line of output given some split array from the csv
    
    ID = line[1]
    title = line[2]
    classify = line[3]
    rarity = line[4]
    price = 0
    attr = line[6]
    _type = line[7]
    lvl = line[8]
    atk = line[9]
    de = line[10]
    _Desc = line[11]
    #format write for card to fout

    out_construct = "insert into card values( '" + ID + "', '" + title + "', '" + getbox(ID) + "', '" + classify + "', '" + rarity + "', '" + attr + "', '" + _type + "', '" + lvl +  "', '" + atk + "', '" + de + "', '" + getPrice(rarity) + "'); \n"
    fout.write(out_construct)

def generate_insert(fin, fout): 
    for row in range(0, 3502):
        txt = fin.readline()
        line = txt.split('\t')
        generate_line(line, fout)

def main():
   din = input("Provide Input Path: ")
   dout = input("Provide Output Path: ")
   fin = open(din, 'r', encoding="ISO-8859-1")
   fout = open(dout, 'w', encoding="ISO-8859-1")
   generate_insert(fin, fout)
   print("Generation Complete")


if __name__ == '__main__':
    main()

        