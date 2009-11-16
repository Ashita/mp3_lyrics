#!	/usr/bin/env ruby
require 'rubygems'
require 'id3lib'
require 'net/WikiLyrics'

tag = ID3Lib::Tag.new('/home/ashita/Mousika/Green Day/American Idiot/12 Homecoming.mp3')

wikilyrics = WikiLyrics.new(tag.artist, tag.title)
puts wikilyrics.lyric

#on vire les comments de merde
tag.remove_frame(:COMM)

#on rajoute les paroles
tag.lyrics = ""

#et on sauvegarde
#tag.update!
