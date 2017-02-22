require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
page = Nokogiri::HTML(open('https://www.eia.gov/petroleum/weekly/'))

page.xpath('//*[@id="rp_diesel"]/td[2]').text

page.css('div.pagecontent.mr_temp5 div.main_col table:nth-child(1) tbody tr:nth-child(5) td:nth-child(4)')