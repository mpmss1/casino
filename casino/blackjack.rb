require "colorize"
# require "pry"
#require_relative "casino.rb"
class Blackjack
  attr_accessor :name, :wallet, :playerhand, :dealerhand, :deck
  def initialize(name, wallet)
    @name = name
    @bet = 0
    @wallet = wallet    
    @playerhand = []
    @dealerhand = []
    @deck = [{suit: "♠",  value: 2, number: 2}, {suit: "♠",  value: 4, number: 4}, {suit: "♠",  value: 6, number: 6}, 
      {suit: "♠",  value: 8, number: 8}, {suit: "♠",  value: 10, number: "J"}, {suit: "♠",  value: 10, number: "K"}, 
      {suit: "♦️",  value: 2, number: 2}, {suit: "♦️",  value: 4, number: 4}, {suit: "♦️",  value: 6, number: 6}, 
      {suit: "♦️",  value: 8, number: 8}, {suit: "♦️",  value: 10, number: "J"}, {suit: "♦️",  value: 10, number: "K"},
      {suit: "♣️",  value: 3, number: 3}, {suit: "♣️",  value: 5, number: 5}, {suit: "♣️",  value: 7, number: 7}, 
      {suit: "♣️",  value: 9, number: 9}, {suit: "♣️",  value: 10, number: "Q"}, {suit: "♣️",  value: 11, number: "A"},
      {suit: "♥️",  value: 3, number: 3}, {suit: "♥️",  value: 5, number: 5}, {suit: "♥️",  value: 7, number: 7}, 
      {suit: "♥️",  value: 9, number: 9}, {suit: "♥️",  value: 10, number: "Q"}, {suit: "♥️",  value: 11, number: "A"}, 
      {suit: "♠",  value: 3, number: 3}, {suit: "♠",  value: 5, number: 5}, {suit: "♠",  value: 7, number: 7}, 
      {suit: "♠",  value: 9, number: 9}, {suit: "♠",  value: 10, number: "Q"}, {suit: "♠",  value: 11, number: "A"}, 
      {suit: "♥️",  value: 2, number: 2}, {suit: "♥️",  value: 4, number: 4}, {suit: "♥️",  value: 6, number: 6}, 
      {suit: "♥️",  value: 8, number: 8}, {suit: "♥️",  value: 10, number: "J"}, {suit: "♥️",  value: 10, number: "K"},
      {suit: "♣️",  value: 2, number: 2}, {suit: "♣️",  value: 4, number: 4}, {suit: "♣️",  value: 6, number: 6}, 
      {suit: "♣️",  value: 8, number: 8}, {suit: "♣️",  value: 10, number: "J"}, {suit: "♣️",  value: 10, number: "K"},
      {suit: "♦️",  value: 3, number: 3}, {suit: "♦️",  value: 5, number: 5}, {suit: "♦️",  value: 7, number: 7}, 
      {suit: "♦️",  value: 9, number: 9}, {suit: "♦️",  value: 10, number: "Q"}, {suit: "♦️",  value: 11, number: "A"}
    ]
    menu
  end
  def bet
    puts "How much would you like to bet?".blue
    print " >".blue
    puts
    @bet = gets.strip.to_i
    while @bet < 2
      puts "Invalid Entry. Try again".red
      bet
    end
    while @bet > @wallet
      puts "You cannot bet more than you have".red
      bet
    end
  end
  def menu
    @playerhand.clear
    @dealerhand.clear
    puts "🃎 🂠 Welcome to Blackjack 🂠 🃎".colorize(:green)
    puts "1: Deal".colorize(:green)
    puts "2: View Balance".green
    puts "3: Main Menu".colorize(:green)
    
    print "> ".colorize(:green)
    choice = gets.to_i

    case choice
    when 1
      bet
      print "Dealing..".colorize(:blue)
      sleep(1)
      print ".".colorize(:blue)
      sleep(1)
      print ".".colorize(:blue)
      sleep(1)
      puts ".".colorize(:blue)
      deal
    when 2
      puts "\nYour balance is $#{@wallet}".green
      puts
      menu
    when 3
      puts "Thanks for playing Blackjack!".colorize(:yellow)
      sleep(2)
      Casino.new(@name, @wallet)
    else
      puts "Invalid choice".colorize(:red)
      menu
    end
    end

  def deal
    puts "Your Hand:".colorize(:green)
    rng = Random.new
    num = rng.rand(@deck.count)
    @playerhand << @deck[num][:value]


  puts "     ------------------------
      | #{@deck[num][:suit]}                    |
      | #{@deck[num][:number]}                    |
      |                      |
      |                      |
      |                      |
      |                      |
      |                      |
      |                      |
      |                    #{@deck[num][:suit]} |
      |                    #{@deck[num][:number]} |
      ------------------------"
      rng = Random.new
      num = rng.rand(@deck.count)
      @playerhand << @deck[num][:value]
      
      
      puts "          ------------------------
            | #{@deck[num][:suit]}                    |
            | #{@deck[num][:number]}                    |
            |                      |
            |                      |
            |                      |
            |                      |
            |                      |
            |                      |
            |                    #{@deck[num][:suit]} |
            |                    #{@deck[num][:number]} |
            ------------------------"
    
      that = @playerhand.inject(0){|sum,x| sum + x } 
      print "Your total is: ".colorize(:green)
      puts that
      if that > 21
        puts "Oh no!!! You busted! You lose the hand!".colorize(:red)
        puts "You lost $#{@bet}".red
        @wallet -= @bet
        @playerhand.clear
        @dealerhand.clear
        menu
      else
      game
    end
  end

  def game

    puts "Dealer Hand:".colorize(:blue)
    rng = Random.new
    num = rng.rand(@deck.count)
    @dealerhand << @deck[num][:value]


  puts "     ------------------------
      | #{@deck[num][:suit]}                    |
      | #{@deck[num][:number]}                    |
      |                      |
      |                      |
      |                      |
      |                      |
      |                      |
      |                      |
      |                    #{@deck[num][:suit]} |
      |                    #{@deck[num][:number]} |
      ------------------------"

      puts "        -------------------------
          | ??                    |
          |                       |
          |                       |
          |                       |
          |                       |
          |                       |
          |                       |
          |                       |
          |                       |
          |                    ?? |
          -------------------------"
    that = @playerhand.inject(0){|sum,x| sum + x }
    print "Your total is: ".colorize(:blue)
    puts that
    print "Deler's is showing ".colorize(:blue)
    print  "#{@deck[num][:value]} ".colorize(:blue)
    puts "and a face down card".colorize(:blue)
    rng = Random.new
    num = rng.rand(@deck.count)
    @dealerhand << @deck[num][:value]
    question
  end

  def question    
      puts "What do you want to do?".colorize(:green)
      puts "1: Hit".colorize(:green)
      puts "2: Stand".colorize(:green)
      print ">".colorize(:green)
      choice = gets.to_i
    
      case choice
      
      when 1
        hitt
      
      when 2
        puts "OK!".colorize(:yellow)
        sleep(2)
        print `clear`
      maybe
      else
        puts "Invalid choice".colorize(:red)
        question
      end
      end

      def hitt
        rng = Random.new
        num = rng.rand(@deck.count)
        @playerhand << @deck[num][:value]
        
        
        puts "           -----------------------
            | #{@deck[num][:suit]}                    |
            | #{@deck[num][:number]}                    |
            |                      |
            |                      |
            |                      |
            |                      |
            |                      |
            |                      |
            |                    #{@deck[num][:suit]} |
            |                    #{@deck[num][:number]} |
            ------------------------"
            
            that = @playerhand.inject(0){|sum,x| sum + x }
              
            print "Your total is: ".colorize(:green)
            puts that
            if that > 21
              puts "Oh no!!! You busted! You lose the hand!".colorize(:red)
              puts "You lost your bet".red
              @wallet -= @bet
              @playerhand.clear
              @dealerhand.clear
              menu
            else
              question
          end
        end

    def maybe
    this = @dealerhand.inject(0){|sum,x| sum + x }
      if this < 17
        rng = Random.new
        num = rng.rand(@deck.count)
        @dealerhand << @deck[num][:value]
    puts "Dealer Hits".colorize(:blue)
    puts "     ------------------------
      | #{@deck[num][:suit]}                    |
      | #{@deck[num][:number]}                    |
      |                      |
      |                      |
      |                      |
      |                      |
      |                      |
      |                      |
      |                    #{@deck[num][:suit]} |
      |                    #{@deck[num][:number]} |
      ------------------------"
        maybe
      else 
        cray
      end
    end

    def cray
      this = @dealerhand.inject(0){|sum,x| sum + x }
      that = @playerhand.inject(0){|sum,x| sum + x }
        if this > 21
          print "Your Hand ".colorize(:green)
          puts that
          print "Dealer Hand ".colorize(:blue)
          puts this
          puts "Dealer Bust! You Win!".colorize(:green)
          puts "You doubled your money!".green
          @wallet += @bet
          menu
        else
          out
        end
      end


    def out
      that = @playerhand.inject(0){|sum,x| sum + x }
      this = @dealerhand.inject(0){|sum,x| sum + x }

      print "Your Hand ".colorize(:green)
      puts that
      print "Dealer Hand ".colorize(:blue)
      puts this
      
      if that > this
        puts "You Win!".colorize(:green)
        puts "You doubled your money!".green
        @wallet += @bet
        menu
      elsif this > that
        puts "Dealer Wins".colorize(:blue)
        puts "You lost your bet".green
        @wallet -= @bet
        menu
      else that = this
        puts "It's a Tie".colorize(:yellow)
        puts "You get your money back".green
        menu
  end
end
end