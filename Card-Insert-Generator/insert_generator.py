



def generate_line(line):
    if(line[3] == "Spell" || line[3] == "Trap"):
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
    for row in range(0, 3504):
        txt = fin.readline()
        line = txt.split('\t')
        generate_line(line)
        print(line)

def main():
   din = "C:\\Users\\droot\\Documents\\Senior Year Sem 1\\DMS\\Project\\YGO-Database-Project\\Card-Insert-Generator\\in.csv"
   dout = "C:\\Users\\droot\\Documents\\Senior Year Sem 1\\DMS\\Project\\YGO-Database-Project\\Card-Insert-Generator\\out.txt"
   fin = open(din, 'r')
   fout = open(dout, 'w')
   generate_insert(fin, fout)


if __name__ == '__main__':
    main()

        