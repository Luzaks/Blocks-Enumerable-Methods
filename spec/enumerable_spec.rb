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

  describe "#my_any?" do
    it "return true when any of the numbers are greater than 6" do
      expect([10, 5, 20, 40, 1].my_any? { |x| x > 6 }).to be_truthy
    end

    it "return false when none of all the numbers are greater than 6" do
      expect([2, 3, 1, 5, 4].my_all? { |x| x > 6 }).to be_falsy
    end

    it "return true if its equal as any? method" do
      expect([10, 20, 20, 40, 50].my_any? { |x| x > 6 }).to eql([10, 20, 20, 40, 50].any? { |x| x > 6 })
    end

    it "return true if at least one of the elements in an array are true" do
      expect([nil, true, true].my_any?).to be_truthy
    end

    it "return false if none of the elements of the array are true" do
      expect([false, false, false].my_any?).to be_falsy
    end

    it "return true if its equal as any? method" do
      expect([nil, true, true].my_any?).to eql([nil, true, true].any?)
    end

    it "return true if any the elements has the same class" do
      expect(["hey", "hola", 1].my_any?(String)).to be_truthy
    end

    it "return true if any the elements has the same class" do
      expect([13123, "434123", "431321"].my_any?(Integer)).to be_truthy
    end

    it "return true if is equal to any? method" do
      expect([13123, nil, 431321].my_any?(Integer)).to eql([13123, nil, 431321].any?(Integer))
    end

    it "return true if any of the elements contains the same letter" do
      expect(%w[ant bear cat].my_any?(/n/)).to be_truthy
    end

    it "return true if is equal to any? method" do
      expect(%w[ant bear cat].my_any?(/n/)).to eql(%w[ant bear cat].any?(/n/))
    end
  end

  describe "#my_none?" do
    it "return true when none of the numbers are greater than 6" do
      expect([1, 2, 5, 3, 1].my_none? { |x| x > 6 }).to be_truthy
    end

    it "return false when some of the numbers are greater than 6" do
      expect([10, 50, 2, 40, 4].my_none? { |x| x > 6 }).to be_falsy
    end

    it "return true if its equal as none? method" do
      expect([10, 20, 20, 40, 50].my_none? { |x| x > 6 }).to eql([10, 20, 20, 40, 50].none? { |x| x > 6 })
    end

    it "return false if at some one of the elements in an array are true" do
      expect([nil, false, true].my_none?).to be_falsy
    end

    it "return true if all the elements of the array are false" do
      expect([false, false, false].my_none?).to be_truthy
    end

    it "return true if its equal as none? method" do
      expect([nil, true, true].my_none?).to eql([nil, true, true].none?)
    end

    it "return true if none the elements has the same class" do
      expect([1245, nil, [1, 2]].my_none?(String)).to be_truthy
    end

    it "return false if some of the elements has the same class" do
      expect([13123, false, "431321"].my_none?(Integer)).to be_falsy
    end

    it "return true if is equal to none? method" do
      expect([13123, nil, 431321].my_none?(Integer)).to eql([13123, nil, 431321].none?(Integer))
    end

    it "return true if  none the elements contains the  letter" do
      expect(%w[ant bear cat].my_none?(/z/)).to be_truthy
    end

    it "return false if some of the elements contains the  letter" do
      expect(%w[ant bear cat].my_all?(/b/)).to be_falsy
    end

    it "return true if is equal to none? method" do
      expect(%w[ant bear cat].my_none?(/m/)).to eql(%w[ant bear cat].none?(/m/))
    end
  end
end
