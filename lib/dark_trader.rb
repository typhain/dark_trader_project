require 'open-uri'
	require 'nokogiri'

def get_symbols
      symbols = []
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  	doc.xpath('//td[3]').each do |node|
  	  symbols << node.text
  	end
    symbols
end

def get_prices
      prices = []
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  	doc.xpath('//td[5]/a').each do |node|
  	  prices << node.text
  	end
    prices.map!{ |element| element.gsub("$", '') }
end

combination = Hash[get_symbols.zip get_prices]

Hash.class_eval do
  def split_into(divisions)
    count = 0
    inject([]) do |final, key_value|
      final[count%divisions] ||= {}
      final[count%divisions].merge!({key_value[0] => key_value[1]})
      count += 1
      final
    end
  end
end

puts combination.split_into(2276)
