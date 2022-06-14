require_relative 'module_code.rb'
include Code

class Codemaker
  #@@points = 0
  attr_reader :code, :codebreaker
  #attr_accessor :points
  def initialize
    print "Is the codemaker the computer? Y/N: "
    answer = gets.chomp.upcase
    if answer == "Y"
      @code = Array.new(4) {rand(7)}
      store_code(@code)
      codebreaker = Codebreaker.new("human")
    else
      print "Enter your code. 4 numbers from 0 to 6: "
      @code = gets.chomp.split("").map {|x| x.to_i}
      store_code(@code)
      codebreaker = Codebreaker.new("computer")
    end
  end
end

class Codebreaker
  @@tries = 0
  attr_reader :guess
  def initialize(codebreaker)
    #while (@@tries < 12) do
      if codebreaker == "human"
      while (@@tries < 12) do
        puts "_" * 60
        input = 'a'
        while (input =~ /[^0-6]/ || input.length > 4) do
          print "\nGuess the code. 4 numbers from 0 to 6: "
          input = gets.chomp
          @guess = input.split("").map {|x| x.to_i}
        end
      #else
      #  @guess = computer_break_code
      #end
      @@tries += 1
      puts "\n\nCodemaker's points: #{@@tries}"
      puts "\n\t\t\t Right Position | Right number/wrong position\n\n"
      print @guess
      evaluate_guess(@guess)
      end
      else #codebreaker == "computer"
      while (@@tries < 12) do
        puts "_" * 60
        @@tries += 1
        puts "\n\nCodemaker's points: #{@@tries}"

        @guess = computer_break_code

        print @guess
      end
    end
    puts "\nThe code was #{CODE}\nThe code is not broken. + 1 point! \n\nCodemaker's points: #{@@tries + 1}"
  end


end


#evaluate_guess(@guess)
codemaker = Codemaker.new
