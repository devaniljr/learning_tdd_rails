require "rspec/autorun"

class Calculator
  def add(n1, n2)
    n1 + n2
  end

  def sub(n1, n2)
    n1 - n2
  end

  def multiply(n1, n2)
    n1 * n2
  end

  def divide(n1, n2)
    n1 / n2
  end

  def factorial(n)
    if n == 0
      1
    else
      (1..n).reduce(:*)
    end
  end
end

describe Calculator do
  describe "#add" do
    it "returns the sum of its two arguments" do
      calc = Calculator.new

      expect(calc.add(10, 10)).to eq(20)
    end
  end

  describe "#sub" do
    it "returns the substraction of its two arguments" do
      calc = Calculator.new

      expect(calc.sub(20, 10)).to eq(10)
    end
  end

  describe "#multiply" do
    it "returns the substraction of its two arguments" do
      calc = Calculator.new

      expect(calc.multiply(2, 4)).to eq(8)
    end
  end

  describe "#divide" do
    it "returns the division of its two arguments" do
      calc = Calculator.new

      expect(calc.divide(20, 2)).to eq(10)
    end
  end

  describe "#factorial" do
    it "returns 1 when given 0" do
      calc = Calculator.new

      expect(calc.factorial(0)).to eq(1)
    end

    it "returns 120 whe given 5" do
      calc = Calculator.new

      expect(calc.factorial(5)).to eq(120)
    end
  end
end
