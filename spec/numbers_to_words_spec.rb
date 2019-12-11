require('rspec')
require('numbers_to_words.rb')

describe('intiger#number') do

  it("returns a written-word version of the intiger") do
    number = Number.new(0)
    expect(number.to_eng).to(eq("zero"))
  end

  it("returns a written-word version of the intiger") do
    number = Number.new(14)
    expect(number.to_eng).to(eq("fourteen"))
  end

  it("returns a written-word version of the intiger") do
    number = Number.new(24)
    expect(number.to_eng).to(eq("twenty four"))
  end

  it("returns a written-word version of the intiger") do
    number = Number.new(99)
    expect(number.to_eng).to(eq("ninety nine"))
  end

  it("returns a written-word version of the intiger") do
    number = Number.new(456)
    expect(number.to_eng).to(eq("four hundred fifty six"))
  end

  it("returns a written-word version of the intiger") do
    number = Number.new(6789)
    expect(number.to_eng).to(eq("six thousand, seven hundred eighty nine"))
  end

end
