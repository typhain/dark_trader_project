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
  emails = []
  # Instead of 3 put get_url.size in order to get the 577 deputies ;)  ==============================================
    while i < 3 do
      i += 1
        doc = Nokogiri::HTML(open(get_url[i]))
          doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |node|
            node.text
              emails << node.text
          end
    end
    emails
end

def get_first_names
  first_names = []
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  doc.xpath('//td[1]/a[1]').each do |node|
    first_names << node.text.gsub('M. ', '').gsub('Mme ', '').split.first
  end
  first_names
end

def get_last_names
  last_names = []
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  doc.xpath('//td[1]/a[1]').each do |node|
    last_names << node.text.gsub('M. ', '').gsub('Mme ', '').split(' ')[1..-1].join(' ')
  end
  last_names
end

def combine
  test = []
  i = 0
  # In order to get the full 577 deputies replace 3 by get_first_names.size ==============================================
    while i < 3 do
      i += 1
    test << {"First Name" => get_first_names[i], "Last Name" => get_last_names[i], "Email" => get_emails[i]}
    end
    test
end

print combine
