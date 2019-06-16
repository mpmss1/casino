require_relative "casino.rb"
require "colorize"

class Slots
  def initialize(name, wallet)
    @username = name
    @userwallet = wallet
    play
  end

  def multiplier(s1, s2, s3)
   if s1==s2 && s2==s3
     3
   elsif s1==s2 || s2==s3 || s1==s3
     2
   else
     0
    end
  end
  
  def play
    puts "Welcome to Slots #{@username} ".yellow
    puts "Would you like to play: ".yellow
    puts "1) Yes 2) EXIT".yellow
    gets.to_i
    if 1
    @wheel = ["CHERRY","BANANA","COCONUT"]
    
    puts "How much would you like to bet? ".green
    puts "You have $#{@userwallet}".green
    ante = gets.to_i
    bet = @userwallet - ante

      if ante < @userwallet
        result1 = @wheel.sample
        result2 = @wheel.sample
        result3 = @wheel.sample
        puts "#{result1} - #{result2} - #{result3}".red
        win = bet * multiplier(result1, result2, result3)  
        puts "YOU WIN #{win}".green
        play
      else
        puts "Sorry you don't have enough to cover that bet!".red
        puts "You have #{@userwallet}".green
        puts "Try Again".red
        play
      end

    else 2    
      exit
      Casino.new(@username, @userwallet)
    end
  end
end
