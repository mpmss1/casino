require_relative "blackjack.rb"
require_relative "slots.rb"
require_relative "roulette.rb"
require_relative "highlow.rb"
require_relative "boxing.rb"
require "pry"
require "colorize"

class Casino
  attr_accessor :menuoptions
  def initialize(name, wallet)
    @menuoptions = ["Blackjack", "Roulette", "Slots", "Lucky-Dice", "Boxing", "View Balance", "Add Funds", "Quit"]
    @userwallet = wallet
    @username = name
    menu
  end

  def menu
    puts "======================================"
    puts "      Welcome to the Casino."
    puts "   What would you like to play?\n "
    @menuoptions.each_with_index do |game, index|
      puts "#{index+1}) #{game}"
    end
    selection
  end
    
  def selection
    puts
    print "> "
    choice = gets.strip.to_i
    case choice
      when 1
        Blackjack.new(@username, @userwallet)
      when 2
        Roulette.new(@username, @userwallet)
      when 3
        Slots.new(@username, @userwallet)
      when 4
        Luckydice.new(@username, @userwallet)
      when 5
        Boxing.new(@username, @userwallet)
      when 6
        puts "\nYou have $#{@userwallet}"
        sleep(2)
        menu
      when 7
        puts "How much would you like to add? "
        print "> $"
        @userwallet += gets.strip.to_i
        menu
      when 8
        cash_out
      else
        puts "\nInvalid entry, try again."
        menu
    end
  end
  def cash_out
    puts "Thank you for coming. Your balance is $#{@userwallet}."
    exit
  end
    
end
    

def start_game
  
  decal = <<~HEREDOC
    █     █ █████ ██     ▄████▄  █████  ███▄ ▄███ ██████  ▄▄▄█████  █████     ▄▄▄█████ ██  ██ █████    
    █  █  █ █     ██     ██▀ ▀█  ██  ██ ██ ▀█▀ ██ █           ██    ██  ██       ██▒   ██  ██ █        
    █  █  █ ███   ██     ▓█    ▄ ██  ██ ██     ██ ███         ██    ██  ██       ██░   ██▀▀██ ███      
    █  █  █ █     ██     ▓▓▄ ▄██ ██  ██ ██     ██ ▓█          ██    ██  ██       ██▓   ▓█  ██ ▓█       
     ██▒██  ████  ██████   ███▀   ████  ██     ██ ▒████       ██    ████▓        ██▒   ▓█  ██ ▒████▒     

                                                                              
                             ▄████▄  ▄▄▄       ██████ ██ ███▄    █  █████                              
                             ██▀ ▀█  ████▄   ▒██      ██ ██ ▀█   █ ██   ██                            
                             ▓█    ▄ ██  ▀█▄   ▓██▄   ██ ██  ▀█ ██ ██   ██                            
                             ▓▓▄ ▄██ ██▄▄▄▄██      ██ ██ ██   ▐▌██ ██   ██                            
                              ▓███▀  ▓█   ▓██ ██████  ██ ██     ██  ████▓                                                   
                      
  HEREDOC
  puts decal.blue
  puts "\nHello, before you enter the Casino, what is your name?".blue
  print "> "
  name = gets.strip
  puts "\nHow much money do you have?".red
  print "> $"
  wallet = gets.strip.to_i
  while wallet < 2
    puts "Invalid Entry, try again"
    print "> "
    wallet = gets.strip.to_i
  end
  Casino.new(name, wallet)
end
 
start_game