require 'open-uri'
class GamesController < ApplicationController


  def new
    #display new random grid and form, which will be submitted with POST to the score
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @base_url = 'https://wagon-dictionary.herokuapp.com/'
    @word = params[:word]
    @grid = params[:grid]
    @result = @word.chars.all? { |letter| @word.count(letter) <= @grid.count(letter) }
    @url = "#{@base_url}#{@word}"
    json = open(@url).read
    @found = JSON.parse(json)["found"]
  end

end
