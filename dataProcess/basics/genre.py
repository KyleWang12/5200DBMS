f=open("./newa.tsv","r")
fout = open("./genre.tsv","w")
for line in f:
    list = line.split("\t")
    for genre in list[-1][:-1].split(","):
        if(genre!="\\N"):
            fout.write(list[0]+'\t'+genre+'\n')
f.close()
fout.close()