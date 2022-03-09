fout=open("./gross.csv","w")
# first file:
for line in open("./GROSS BY YEAR/1978-gross.csv"):
    fout.write(line)
# now the rest:    
for num in range(1978,2022):
    f = open("./GROSS BY YEAR/"+str(num)+"-gross.csv")
    f.next() # skip the header
    for line in f:
         fout.write(line)
    f.close() # not really needed
fout.close()