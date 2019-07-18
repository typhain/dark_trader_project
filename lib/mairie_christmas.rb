require 'open-uri'
	require 'nokogiri'

def get_url
  url = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//tr/td/p//@href').each do |node|
    url << node.text.gsub!('./', 'http://annuaire-des-mairies.com/')
  end
  url.drop(1)
end


def get_emails
      emails = []
      i = -1
      while i < get_url.size do
        i += 1
    doc = Nokogiri::HTML(open(get_url[i]))
    doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
      emails << node.text
    end
    end
    emails
end

def get_city
  city = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    doc.xpath("//tr/td/p/a").each do |node|
      city << node.text
    end
      city
end

def combine

  myhash = Hash[get_city.zip get_emails]

  Hash.class_eval do
    def split_into(get_emails.size)
      count = 0
      inject([]) do |final, key_value|
        final[count%divisions] ||= {}
        final[count%divisions].merge!({key_value[0] => key_value[1]})
        count += 1
        final
      end
    end
  end
    a = [myhash.split_into(get_symbols.size)]
    puts a
end

combine
