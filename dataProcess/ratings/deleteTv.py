fset=open("../basics/newa.tsv")
ids=set()
for line in fset:
    list = line.split("\t")
    ids.add(list[0])
fset.close()

f=open("./data.tsv","r")
next(f)
fout = open("./newData.tsv","w")
for line in f:
    list = line.split("\t")
    if(list[0] in ids):
        fout.write(line)
f.close()
fout.close()