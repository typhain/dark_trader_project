require 'open-uri'
	require 'nokogiri'

  def get_emails
         emails = []
      doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
     	doc.xpath('/html/body/div[2]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
     	  puts node.text
     	end
			get_emails
   end

puts get_emails
