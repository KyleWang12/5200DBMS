f=open("./newa.tsv","r")
fout = open("./genreType.tsv","w")
genres = set()
for line in f:
    list = line.split("\t")
    for genre in list[-1][:-1].split(","):
        if(genre!='\\N'):
            genres.add(genre)
for g in genres:
    fout.write(g+"\n")
f.close()
fout.close()
