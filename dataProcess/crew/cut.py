fset=open("../basics/newa.tsv")
ids=set()
for line in fset:
    list = line.split("\t")
    ids.add(list[0])
fset.close()

f=open("./data.tsv","r")
next(f)
dout = open("./directors.tsv","w")
wout = open("./writers.tsv","w")
for line in f:
    [tconst, directors, writers] = line.split("\t")
    if(tconst in ids):
        for d in directors.split(","):
            if(d!="\\N"):
                dout.write(tconst+"\t"+d+"\n")
        for w in writers[:-1].split(","):
            if(w!='\\N'):
                wout.write(tconst+"\t"+w+"\n")
f.close()
dout.close()
wout.close()
