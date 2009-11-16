#!	/usr/bin/env ruby
require 'rubygems'
require 'id3lib'
require 'net/WikiLyrics'

tag = ID3Lib::Tag.new('/home/ashita/Mousika/Green Day/American Idiot/12 Homecoming.mp3')

wikilyrics = WikiLyrics.new(tag.artist, tag.title)
puts wikilyrics.lyric

#we remove the fucking comments
tag.remove_frame(:COMM)

#we add the lyric
tag.lyrics = ""

#and we save
#tag.update!
