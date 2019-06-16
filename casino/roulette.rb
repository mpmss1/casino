require_relative "casino.rb"
require "pry"

class Roulette 
 
  attr_accessor :wallet
  def initialize (name, wallet)
    @name = name
    @wallet = wallet
    @array = [1, 2]
    @bet = 0
    bet
  end  

  def bet 
    puts "---Welcome to Roulette---".yellow
    
    sleep (1)
    puts "How much would you like to bet?"
    puts "1) 25 Dollars"
    puts "2) 50 Dollars"
    puts "3) 100 Dollars"
    puts "4) Return to Casino"
    choice = gets.to_i
  
    case choice
      when 1
        @bet = 25 
      when 2
        @bet = 50
      when 3 
        @bet = 100
      when 4
        puts "Thanks for playing! Come again!"  
        sleep (3)
        Casino.new(@name, @wallet)
    end    
      color
    end 


  def color
    puts "What color would you like to bet on?"
    sleep(1)
    puts "1) Red"
    puts "2) Black"
    puts "spinning"
    sleep(3)
    choice = gets.to_i
    if @array.sample == choice
      puts "You Win!!"
      @bet = @bet * 2
      @wallet += @bet
      bet
    else
      puts "You Lose, want to play again?"
      @wallet -= @bet
      bet
    end
  end
end

