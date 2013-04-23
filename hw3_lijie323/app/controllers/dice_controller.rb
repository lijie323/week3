class DiceController < ApplicationController
  def dice

  end

  def roll
    # @point = [1,2,3,4,5,6]
    # @ftry1 = @point.sample
    # @ftry2 = @point.sample
    @ftry1=rand(6)+1
    @ftry2=rand(6)+1
    $fsum = @ftry1+@ftry2
    case $fsum
      when 7,11
        @result = "YOU WIN!"
      when 2,3,12
        @result = "YOU LOSE!"
      else
        @result = "Your point is #{$fsum}.\n Now try to get #{$fsum} again before you roll a 7."
        render 'continue'
        # redirect_to "/dice/roll?score=#{@fsum}"
        # render :action => 'retry',:id => @fsum
    end
  end

  def continue
    redirect_to "/dice/retry?score=#{$fsum}"
  end

  def retry
    @goal = params[:score].to_i
    # @point = [1,2,3,4,5,6]
    # @try1 = @point.sample
    # @try2 = @point.sample
    @try1=rand(6)+1
    @try2=rand(6)+1
    @sum = @try1+@try2
    case @sum
    when @goal
      @ftry1 = @try1
      @ftry2 = @try2
      @result = "YOU WIN!"
      render 'roll'
    when 7
      @ftry1 = @try1
      @ftry2 = @try2
      @result = "YOU LOSE!"
      render 'roll'
    else
      # redirect_to "/dice/retry?score=#{@goal}"
      @result = "Your point is #{$fsum}.Try again."
      render 'retry'
    end

  end
end
