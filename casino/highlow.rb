class Luckydice
  attr_accessor :wallet
  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    decal = <<~HEREDOC
       .-------.       .-------.    
     /    o   / |    /    o   / |
    /_______ / o|   /_______ / o|
   | o      |   |  | o      |   |
   |   o    | o/   |   o    | o/ 
   |     o  | /    |     o  | /  
    '-------'       '-------'   
    HEREDOC
    puts decal.green
    menu
    Casino.new(@name, @wallet)
  end

  def menu
    puts "======================================"
    puts "       Welcome to Lucky-Dice"
    puts "         Choose an option:"
    puts
    puts "1) Play"
    puts "2) Instructions"
    puts "3) View Balance"
    puts "4) Main Menu"
    print "> "
    choice = gets.to_i
    case choice
      when 1
        game
      when 2
        puts "\nYou will roll the dice. After \nseeing the first dice roll you\nwill place a bet then guess if\nyour next roll will be higher \nlower, or the same as the previous\nroll. If correct, you win 1.5 times \nyour bet on higher or lower calls.\nOn same calls you win 10 times \nyour bet\n "
        menu
      when 3
        puts "You have $#{@wallet}"
        sleep(2)
        menu
      when 4
        Casino.new(@name, @wallet)
      else
        puts "Invalid option. Try again."
        menu
    end
  end

  def game
    array = (1..6).to_a
    @roll1 = array.sample + array.sample
    @roll2 = array.sample + array.sample
    first_roll
    
  end
  def first_roll
    puts "\n#{@roll1} was the first roll"
    bet
  end

  def bet
    puts "\nHow much would you like to bet?"
    print "> $"
    @amount = gets.to_i
    if @amount > @wallet
      puts "\nYou may not bet more than you have."
      bet
    else
      @wallet -= @amount
      higher_or_lower
    end
  end
  def higher_or_lower
    puts "\nDo you think the next roll will be:"
    puts "1) Higher"
    puts "2) Lower"
    puts "3) The Same\n "
    print "> "
    guess = gets.to_i
    puts "\n#{@roll2} was the second roll"
    case guess
      when 1
        if @roll1 < @roll2
          puts "\nYou were right! Congrats. You made #{@amount *= 1.5}"
          sleep(2)
          @wallet += @amount
          menu
        else
          puts "\nYou were wrong. Please play again."
          menu
        end
      when 2
        if @roll1 > @roll2
          puts "\nYou were right! Congrats. You made #{@amount *= 1.5}"
          @wallet += @amount
          menu
        else
          puts "\nYou were wrong. Please play again."
          menu
        end
      when 3
          if @roll1 == @roll2
            puts "\nYou were right! Congrats. You made #{@amount *= 10}"
            @wallet += @amount
            menu
          else
            puts "\nYou were wrong. Please play again."
            menu
          end
      else
        puts "\nInvalid Entry. Try again."
        higher_or_lower
     end
  end
       

end

