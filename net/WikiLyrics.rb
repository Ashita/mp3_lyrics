require 'nokogiri'
require 'open-uri'

class String 
	def wikilyrize
		words = self.split(/ /).map! {|word| word.capitalize}
		return words.join '_'
	end
end

class WikiLyrics
	#initialize wikilyrics with artist and title
	def	initialize(artist,title)
		@url = "http://lyrics.wikia.com/#{artist.wikilyrize}:#{title.wikilyrize}"
	end
	
	def lyric
		get_lyrics
	end

	private
		#retrieve only text in 'lyricbox div'
		def get_lyrics
			lyric = ""
			get_page.css('div.lyricbox').children.each do |node|
				lyric << node.content if node.text?
				lyric << "\n" if node.name == "br"
			end
			lyric
		end

		#retrieve html page
		def get_page
			Nokogiri::HTML(open(@url))
		end
end
