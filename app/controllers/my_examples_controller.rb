class MyExamplesController < ApplicationController
  def fortune_method
    fortunes = ["You will receive a large inheritance", "You get nothing, you lose!", "You will die in a skydiving accident"]
    render json: { fortune: fortunes.sample }
  end

  def random_number_method
    numbers = []
    6.times do
      numbers << rand(1..60)
    end
    render json: { message: "The winning numbers are: #{numbers}" }
  end

  def page_visits_method
    session[:page_visits] ||= 0
    session[:page_visits] += 1
    page_visits = session[:page_visits]
    render json: { message: "You have visited this page #{page_visits} times" }
  end

  def bottles_lyrics
    if session[:beers_left] > 2
      session[:beers_left] ||= 100
      beers_left = session[:beers_left]
      new_beers_left = session[:beers_left] - 1
      render json: { message: "#{beers_left} bottles of beer on the wall, #{beers_left} bottles of beer. Take one down and pass it around, #{new_beers_left} bottles of beer on the wall." }
      session[:beers_left] -= 1
    elsif session[:beers_left] == 2
      render json: { message: "2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall." }
      session[:beers_left] = 1
    elsif session[:beers_left] == 1
      render json: { message: "1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no bottles of beer on the wall." }
      session[:beers_left] = 0
    else
      render json: { message: "You're out of beer" }
      session[:beers_left] = 99
    end
  end
end
