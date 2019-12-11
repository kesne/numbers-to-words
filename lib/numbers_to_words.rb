def fixed_array(size, other)
    Array.new(size) { |i| other[i] }
end

class Number
    @@ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "elevin", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    @@tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    @@place = ["", "thousand, ", "million, ", "billion, ", "trillion, ", "quadrillion, "]

    def initialize(number)
        @number = number
        @groups = number.digits(1000)
    end

    def to_eng(i = (@groups.length - 1))
        return "zero" if @number == 0
        temp = to_hundred(i)
        ((i == 0) ? (temp) : (temp + to_eng(i - 1))).strip.gsub(/,\z/, "").gsub("  ", " ")
    end

    def to_hundred(i)
        return "" if (@groups[i] == 0)
        digits = Array.new(3){ |j| @groups[i].digits[j] || 0 }

        ((digits[2] == 0) ? "" : "#{@@ones[digits[2]]} hundred") +
        ((digits[1] < 2) ? "#{@@ones[(digits[1]*10) + digits[0]]} " : (" #{@@tens[digits[1]]} #{@@ones[digits[0]]} ")) +
        (@@place[i])
    end
end
