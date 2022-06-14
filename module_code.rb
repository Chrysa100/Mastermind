module Code
  CODE= []
  POSSIBLE_NUMBERS = [0,1,2,3,4,5,6]
  EXISTING_NUMBERS = [nil,nil,nil,nil]
  def store_code(code)
    code.each {|num| CODE.push(num)} # it may not be needed. I could use sthg like code_maker.code perhaps?
  end

  def evaluate_guess(guess)
    count_all_right = 0
    count_right_color = 0
    flag = 100
    guess.each_with_index  do |g_color, g_index|
      CODE.each_with_index do |c_color, c_index|
        if g_color == c_color
          if g_index == c_index
            count_all_right += 1
            break
          elsif (guess[c_index] == g_color ||
                  CODE[g_index] == c_color ||
                        c_index == flag)
            next
          else
            count_right_color += 1
            flag = c_index
            break
          end
        else next
        end
      end
    end
    puts "\t\t#{count_all_right} \t\t|\t\t\t#{count_right_color} "
    if count_all_right == 4
      puts "\n\n Code is found!"
      exit
    end
  end

  def computer_break_code
    count_all_right = 0
    count_right_color = 0
    flag = 100
    if EXISTING_NUMBERS.all? {|num| num != nil}
      @guess = EXISTING_NUMBERS.shuffle!

    else
    index = rand(POSSIBLE_NUMBERS.length - 1)
    puts "index : #{index}"
    @guess = Array.new(4, POSSIBLE_NUMBERS[index])
    #@guess = Array.new(4, rand(6) # it gives the same num in all
    #@guess = Array.new(4) {rand(6)}
    end
    p @guess
    print "How many right colors in right positions? "
    count_all_right = gets.chomp.to_i
    print "How many right colors but in wrong positions? "
    count_right_color = gets.chomp.to_i
    puts "\n\t\t\t Right Position | Right number/wrong position\n\n"
    print @guess
    puts "\t\t#{count_all_right} \t\t|\t\t\t#{count_right_color} "
    POSSIBLE_NUMBERS.delete(@guess[0])
    if count_all_right == 4
      puts "\n\n Code is found!"
      exit
    elsif count_all_right != 0 || count_right_color != 0
      (count_all_right + count_right_color).times do
        EXISTING_NUMBERS.push(@guess[0])
        EXISTING_NUMBERS.shift
      end
    elsif POSSIBLE_NUMBERS.length == 1 &&
          EXISTING_NUMBERS.any? {|num| num == nil}
            num = POSSIBLE_NUMBERS[0]
        #POSSIBLE_NUMBERS.delete(@guess[0])
    end
  end
end
