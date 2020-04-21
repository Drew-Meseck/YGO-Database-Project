#Drew H Meseck
#Card Insert Generator
#YGO-Database-Project

#Takes csv of cards and returns a .txt output file of mySQL insert statements for the "Card" table. 
#This will be used to generate other insert statements for other tables.

import sys

def generate_line(line): # generates one line of output given some split array from the csv
    if(line[3] == "Spell" or line[3] == "Trap"):
        ID = line[1]
        title = line[2]
        classify = line[3]
        rarity = line[4]
        price = 0
        _type = line[7] 
        _Desc = line[11]
        #format write for spell/trap to fout
    else:
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
        #format write for monster to fout


def generate_insert(fin, fout): 
    for row in range(0, 3502):
        txt = fin.readline()
        line = txt.split('\t')
        generate_line(line)
        print(line)

def main():
   din = input("Provide Input Path: ")
   dout = input("Provide Output Path: ")
   fin = open(din, 'r', encoding="ISO-8859-1")
   fout = open(dout, 'w')
   generate_insert(fin, fout)


if __name__ == '__main__':
    main()

        