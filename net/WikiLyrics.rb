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
		#récupère uniquement le text dans la div lyricbox
		def get_lyrics
			lyric = ""
			get_document.css('div.lyricbox').children.each do |node|
				lyric << node.content if node.text?
				lyric << "\n" if node.name == "br"
			end
			lyric
		end

		#récup la page html
		def get_document
			Nokogiri::HTML(open(@url))
		end
end
