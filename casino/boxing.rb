require "colorize"
require "pry"



class Boxing
  attr_accessor :wallet, :bet, :boxer, :name
  def initialize(name, wallet)
    @wallet = wallet
    @name = name
    @bet = 0
    @boxer = []
    @answers = [
        "Won",
        "Lost"
      ]

    menu
  end

def menu
 puts "🥊 🥊 🥊 🥊 🥊  Boxing Main Event! 🥊 🥊 🥊 🥊 🥊".colorize(:green)
 puts "1: Place a Bet".colorize(:green)
 puts "2: View Balance".colorize(:green)
 puts "3: Main Menu".colorize(:green)
 print ">".colorize(:green)
 choice = gets.to_i

 case choice
 when 1
   that
 when 2
    puts "\nYou have $#{@wallet}".green
    menu
 when 3
  Casino.new(@name, @wallet)
 else
   puts "Invalid choice".colorize(:red)
   menu
 end
end

def that
 puts "🥊 🥊 🥊 🥊 (=O*_*)=O Q(*_*Q) 🥊 🥊 🥊 🥊"

 fighter
end

def fighter
   puts "Choose your fighter!".colorize(:green)
   puts "1: Floyd Mayweather".colorize(:green)
   puts "2: Manny Pacquiao".colorize(:green)
   puts "3: Oscar De La Hoya".colorize(:green)
   puts "4: Lennox Lewis".colorize(:green)
   print ">".colorize(:green)
   choice = gets.to_i

   case choice
   when 1
     @boxer << "Floyd Mayweather"
     #binding.pry
     bet
   when 2
     @boxer << "Manny Pacquiao"
     bet
   when 3
     @boxer << "Oscar De La Hoya"
     bet
   when 4
     @boxer << "Lennox Lewis"
     bet
   else
     puts "Invalid choice".colorize(:red)
     menu
   end
end

def bet
     puts "🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊"
     puts "Place Your Bet".colorize(:green)
     puts "1: $25".colorize(:green)
     puts "2: $50".colorize(:green)
     puts "3: $100".colorize(:green)
     puts "4: $500".colorize(:green)
     puts "5: Return to Boxing Menu".green
     print ">".colorize(:green)
     choice = gets.to_i

     case choice
     when 1
       @bet = 25
       if @bet > @wallet
        puts "You cannot bet more than you have.".red
        bet
       else
        rumble
       end
     when 2
       @bet = 50
       if @bet > @wallet
        puts "You cannot bet more than you have.".red
        bet
       else
        rumble
       end
     when 3
       @bet = 100
       if @bet > @wallet
        puts "You cannot bet more than you have.".red
        bet
       else
        rumble
       end
     when 4
       @bet = 500
       if @bet > @wallet
        puts "You cannot bet more than you have.".red
        bet
       else
        rumble
       end
     when 5
        menu
      else
       puts "Invalid choice".colorize(:red)
       menu
     end
end

def rumble
   puts "🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊 🥊"
   print "🥊 🥊 🥊 Let’s Get Ready To Rumble!!".colorize(:blue)
   sleep(1)
   print " 🥊".colorize(:blue)
   sleep(1)
   print " 🥊".colorize(:blue)
   sleep(1)
   print " 🥊".colorize(:blue)
   sleep(1)
   puts " 🥊".colorize(:blue)
   answer
end

def answer
 word = @answers.sample
   puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    print "#{@boxer.sample}".colorize(:cyan)
    print word.colorize(:cyan)
    puts "!!".colorize(:cyan)
   if word == "Won"
    @wallet += @bet
   print "You Won $".colorize(:cyan)
   puts "#{@bet}".colorize(:cyan)
   puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   sleep(4)
   menu
 else
   print "You Lost $".colorize(:cyan)
   puts "#{@bet}".colorize(:cyan)
   @wallet -= @bet
   puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

   sleep(4)
   menu
  end
 end
end