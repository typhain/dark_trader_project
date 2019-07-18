require 'open-uri'
	require 'nokogiri'

def get_url
  url = []
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  doc.xpath('//tbody/tr/td//@href').each do |node|
    url << node.text.gsub!('/d', 'http://www2.assemblee-nationale.fr/d')
  end
  url
end

def get_emails
  i = -1
  while i < get_url.size do
    emails = []
    i += 1
  doc = Nokogiri::HTML(open(get_url[i]))
  doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |node|
    emails << node.text
  end
end
  emails
end


def get_first_names
  first_names = []
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  doc.xpath('//td[1]/a[1]').each do |node|
    first_names << node.text.gsub('M. ','').gsub('Mme ','').split.first
  end
  first_names
end

def get_last_names
   last_names = []
   doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
   doc.xpath('//td[1]/a[1]').each do |node|
     last_names << node.text.gsub('M. ', '').gsub('Mme ', '').split(' ')[1..-1].join(' ')
   end
   puts last_names
 end

 puts get_last_names
