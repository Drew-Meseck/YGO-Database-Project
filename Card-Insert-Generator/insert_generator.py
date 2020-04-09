



def generate_line(line):
    pass


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

        