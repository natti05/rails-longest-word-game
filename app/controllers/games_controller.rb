require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split
    @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }

    url = 'https://wagon-dictionary.herokuapp.com/'
    en_word = open(url).read
     result = JSON.parse(en_word)
  end

end
