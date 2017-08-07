class Article < ApplicationRecord
	require 'open-uri'
	require 'nokogiri'

	def self.get_results(url)
		base_url = 'https://sfbay.craigslist.org'
		docs = Nokogiri::HTML(open(url))
		posts = docs.css('li[class=result-row] a')

		posts.each do |post|
			article = Nokogiri::HTML(open(base_url+post['href']))
			body = article.css('section#postingbody').text
			if Article.find_by(title:article.title).nil? && !body.nil?
				Article.create(title:article.title,body:body)
			end
		end

	end


end
