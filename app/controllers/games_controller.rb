require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = [*'A'..'Z'].sample(10)
  end

  def valid_word
    true if (params[:word].upcase.chars - @letters).empty?
    return "Sorry but its invalid"
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_verify = URI.open(url).read
    word_exist = JSON.parse(word_verify)
  end
end
