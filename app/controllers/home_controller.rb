class HomeController < ApplicationController
	def home
		@news   = Feedjira::Feed.fetch_and_parse('http://k.img.com.ua/rss/ua/all_news2.0.xml').entries[0,5]
		@games  = Feedjira::Feed.fetch_and_parse('http://www.gametrailers.com/shows/feed').entries[0,5]
		@sience = Feedjira::Feed.fetch_and_parse('http://news.sciencemag.org/rss/current.xml').entries[0,5]
	end
end
