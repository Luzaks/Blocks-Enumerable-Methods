require_relative '../enumerable_method'

RSpec.describe Enumerable do
  describe "#my_all?" do
    it "return true when all the numbers are greater than 6" do
      expect([10, 20, 20, 40, 50].my_all? { |x| x > 6 }).to be_truthy
    end

    it "return false when not all the numbers are greater than 6" do
      expect([10, 20, 20, 40, 4].my_all? { |x| x > 6 }).to be_falsy
    end

    it "return true if its equal as all? method" do
      expect([10, 20, 20, 40, 50].my_all? { |x| x > 6 }).to eql([10, 20, 20, 40, 50].all? { |x| x > 6 })
    end

    it "return false if at least one of the elements in an array are not true" do
      expect([nil, true, true].my_all?).to be_falsy
    end

    it "return true if all the elements of the array are true" do
      expect([true, true, true].my_all?).to be_truthy
    end

    it "return true if its equal as all? method" do
      expect([nil, true, true].my_all?).to eql([nil, true, true].all?)
    end

    it "return true if all the elements has the same class" do
      expect(["hey", "hola", "jadas"].my_all?(String)).to be_truthy
    end

    it "return true if all the elements has the same class" do
      expect([13123, 434123, 431321].my_all?(Integer)).to be_truthy
    end

    it "return false if not all the elements has the same class" do
      expect([13123, nil, 431321].my_all?(Integer)).to be_falsy
    end

    it "return true if is equal to all? method" do
      expect([13123, nil, 431321].my_all?(Integer)).to eql([13123, nil, 431321].all?(Integer))
    end

    it "return true if  all the elements contains the same letter" do
      expect(%w[ant bear cat].my_all?(/a/)).to be_truthy
    end

    it "return false if not all the elements contains the same letter" do
      expect(%w[ant bear cat].my_all?(/b/)).to be_falsy
    end

    it "return true if is equal to all? method" do
      expect(%w[ant bear cat].my_all?(/m/)).to eql(%w[ant bear cat].all?(/m/))
    end
  end
end
