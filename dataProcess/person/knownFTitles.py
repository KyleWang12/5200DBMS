fset=open("../basics/newa.tsv")
ids=set()
for line in fset:
    list = line.split("\t")
    ids.add(list[0])
fset.close()

f=open("./data.tsv","r")
next(f)
fout = open("./knownForTitles.tsv","w")
for line in f:
    list = line.split("\t")
    for title in list[-1][:-1].split(","):
        if(title!="\\N" and title in ids):
            fout.write(list[0]+'\t'+title+'\n')
f.close()
fout.close()