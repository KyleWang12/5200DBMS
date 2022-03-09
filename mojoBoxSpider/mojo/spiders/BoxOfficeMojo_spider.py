import scrapy
import xml.etree.ElementTree as ET
import csv

class DomesticSpider(scrapy.Spider): 
    
    name = "mojo"

    def generate_urls(self):
        urls = []
        base = "https://www.boxofficemojo.com/year/"
        # movies from 1977 to 2021
        for i in range(1977, 2022):
            urls.append(base+str(i)+"/")
        return urls

    def start_requests(self):
        urls = self.generate_urls()
        for d in urls:
            yield scrapy.Request(d,callback=self.parse)
    
    def parse(self, response):
        year = str(response)[-6:-2]
        fields = ['year','name', 'gross', 'theaters', 'totalGross','relDate','distributor']
        tables = response.xpath('//*[@id="table"]/div/table/tr')[1:]
        contents=[]
        filename = "GROSS BY YEAR/"+year + "-gross.csv"
        for table in tables:
            row = []
            row.append(year)
            row.append(ET.fromstring(table.xpath('./td[2]/a')[0].extract()).text)
            row.append(ET.fromstring(table.xpath('./td[6]')[0].extract()).text[1:].replace(',', ''))
            row.append(ET.fromstring(table.xpath('./td[7]')[0].extract()).text.replace(',', ''))
            row.append(ET.fromstring(table.xpath('./td[8]')[0].extract()).text[1:].replace(',', ''))
            row.append(ET.fromstring(table.xpath('./td[9]')[0].extract()).text)
            try:
                row.append(ET.fromstring(table.xpath('./td[10]/a')[0].extract()).text)
            except:
                pass
            contents.append(row)

        with open(filename, 'w') as csvfile: 
            csvwriter = csv.writer(csvfile) 
            csvwriter.writerow(fields) 
            csvwriter.writerows(contents)
