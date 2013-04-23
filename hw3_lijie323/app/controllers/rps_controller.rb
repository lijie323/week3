class RpsController < ApplicationController
  def index
    @choose = ["rock", "paper", "scissors"]
  end

  def compare
    @choose = ["rock", "paper", "scissors"]
    @self = params[:choose]
    @computer = @choose.sample(1)[0]
    case[@self,@computer]
    when ["rock","paper"],["paper","scissors"],["scissors","rock"]
      @result = "YOU LOSE!"
    when ["paper","rock"],["scissors","paper"],["rock","scissors"]
      @result = "YOU WIN！"
    when ["paper","paper"],["rock","rock"],["scissors","scissors"]
      @result = "It's a tie"
    else
      @result = "Oops!"
    end
  end





end
