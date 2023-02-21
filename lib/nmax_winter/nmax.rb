require "sorted_set"

module NmaxWinter
  class Nmax
    def initialize(stdin, argv)
      @stdin = stdin
      @nmax = argv[0].to_i
    end
  
    def call
      check_valid
      calc_nmax
    rescue ArgumentError => e
      e.message
    end
  
    private
  
    def check_valid
      raise ArgumentError, "The input data stream is not specified" if @stdin.tty?
      raise ArgumentError, "Enter correct number of the largest numbers" if @nmax.zero?
    end
  
    def calc_nmax
      n = @nmax
      set = SortedSet.new
      number = ""
      is_number = true
      previous = ""
      minus = false
      @stdin.each_char do |ch|
        if ch =~ /[0-9]/ && is_number
          number << ch
          previous = ch
          next
        end
  
        if [" ", "\n", "\t"].include?(ch)
          number_i = number.to_i if is_number && number.size != 0 && number != "-"
          # не убирется мин число
          set << number_i if number_i && (set.empty? || set.count < n || number_i < set.min)
  
          number = ""
          is_number = true
          minus = false
          previous = ch
          next
        end
        if ch == "-" && is_number && ch != previous
          number << ch
          previous = ch
          if minus || number.size > 1
            number = ""
            is_number = false
          end
          minus = true
          next
        end
  
        number = "" if ch == "-" && minus
        # other cases
        is_number = false
      end
      number_i = number.to_i if is_number && number.size != 0 && number != "-"
      set << number_i if number_i && (set.empty? || set.count < n || number_i < set.min)
  
      set.to_a.join(" ")
    end
  end
end


