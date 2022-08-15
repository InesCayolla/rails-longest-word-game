require 'open-uri'
require 'json'


class GamesController < ApplicationController
  def new
    @numbers

      @letters = Array.new(10) { ('A'..'Z').to_a.sample }


  end

  def score

    @word = params[:word]
    @letters = params[:letters]


    if included?(@word.upcase, @letters)
      if english_word?(@word)
        @score = "well done"
      else
        @score = "not an english word"
      end
    else
    "not in the grid"
    end


  end

  

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
