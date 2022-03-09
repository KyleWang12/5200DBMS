f=open("./data.tsv","r")
next(f)
fout = open("./newa.tsv","w")
for line in f:
    list = line.split("\t")
    if(list[1]!="tvEpisode" and list[1]!="short" and list[1]!="videoGame" and list[1]!="tvShort" and list[1]!="tvSeries" and list[1]!="tvSpecial" and list[1]!="tvMiniSeries"):
        fout.write(line)
f.close()
fout.close()
