class Number

    @@ones = { 0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "elevin", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen" }

    @@tens = { 0 => "", 1 => "", 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }
    @@place= { 5 => "quadrillion, ", 4 => "trillion, ", 3 => "billion, ", 2 => "million, ", 1 => "thousand, ", 0 => "" }

    def initialize(number)
        @number = number
        @digits = number.digits(1000)
    end

    def to_eng(i = (@digits.length - 1))
        return "zero" if @number == 0
        temp = to_hundred(i)
        ((i == 0) ? (temp) : (temp + to_eng(i - 1))).gsub(/\s+\z/, "")
    end

    def to_hundred(i)
        return "" if (@digits[i] == 0)
        hundos = (@digits[i]/100).floor
        tens = @digits[i] - (hundos * (100))
        eng = (hundos == 0) ? ("") : ("#{@@ones.fetch(hundos)} hundred ")
        eng += ((tens < 20) ? "#{@@ones.fetch(tens)}" : "#{@@tens.fetch(tens.digits[1])} #{@@ones.fetch(tens.digits[0])}")
        "#{eng} #{@@place.fetch(i)}"
    end

    # def translator
    #     result_array = []
    #     if @number == 0
    #         result_array.push("zero")
    #     elsif @number < 20
    #         result_array.push(@@ones.fetch(@number))
    #     elsif @number < 100
    #         result_array.push(@@tens.fetch(@digits[1]))
    #         result_array.push(@@ones.fetch(@digits[0]))
    #     elsif @number < 1000
    #         result_array.push(@@ones.fetch(@digits[2]))
    #         result_array.push(@@base_place_number_words.fetch(@digits.length))
    #         result_array.push(@@tens.fetch(@digits[1]))
    #         result_array.push(@@ones.fetch(@digits[0]))
    #     elsif @number < 10000
    #         result_array.push(@@ones.fetch(@digits[3]))
    #         result_array.push(@@base_place_number_words.fetch(@digits.length))
    #         result_array.push(@@ones.fetch(@digits[2]))
    #         result_array.push(@@base_place_number_words.fetch(@digits.length-1))
    #         result_array.push(@@tens.fetch(@digits[1]))
    #         result_array.push(@@ones.fetch(@digits[0]))
    #     end
    #     result_array.join(" ")
    # end

end

number = Number.new(9000300800070006)
puts number.to_eng


# print 9000800070006.digits(1000)
