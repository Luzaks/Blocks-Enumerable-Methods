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

  describe "#my_count" do
    it 'Compare if it\'s equal to count method' do
      expect([6, 7, 8, 9, 1].my_count { |x| x > 3 }).to eql([6, 7, 8, 9, 1].count { |x| x > 3 })
    end

    it 'Compare if it\'s equal to count method' do
      expect((1...6).my_count(3)).to eql((1...6).count(3))
    end

    it 'Compare if it\'s equal to count method' do
      expect((1...5).my_count).to eql((1...5).count)
    end

    it 'Compare if it\'s equal to zero' do
      expect([].my_count).to eql(0)
    end
  end

  describe "#my_inject" do
    it 'Add the sum of an array plus 2' do
      expect([1, 3, 3, 4, 5].my_inject(2) { |m, e| m + e }).to eql(18)
    end

    it 'Compare if its equal to inject' do
      expect([1, 3, 3, 4, 5].my_inject(2) { |m, e| m + e }).to eql([1, 3, 3, 4, 5].inject(2) { |m, e| m + e })
    end

    it 'Multiplies the elements of an array times 2' do
      expect([1, 3, 3, 4, 5].my_inject(2, :*)).to eql(360)
    end

    it 'Compare if its equal to inject' do
      expect([1, 3, 3, 4, 5].my_inject(2, :*)).to eql([1, 3, 3, 4, 5].inject(2, :*))
    end

    it 'Add the sum of an array using a symbol' do
      expect([1, 3, 3, 4, 5].my_inject(:+)).to eql(16)
    end

    it 'Compare if its equal to inject' do
      expect([1, 3, 3, 4, 5].my_inject(:+)).to eql([1, 3, 3, 4, 5].inject(:+))
    end

    it 'Look for the word with the biggest length' do
      expect(%w{cat sheep bear}.my_inject { |memo, word| memo.length > word.length ? memo : word }).to eql('sheep')
    end

    it 'Multiply by two everything in a range' do
      expect((1..5).my_inject(2) { |product, n| product * n }).to eql(240)
    end

    it 'Compare if its equal to inject' do
      expect((1..5).my_inject(2) { |product, n| product * n }).to eql((1..5).inject(2) { |product, n| product * n })
    end
  end

  describe '#my_select' do
    it 'Compares if it\'s equal to select method.' do
      expect([2, 3, 1, 9, 7].my_select { |x| x > 3 }).to eql([2, 3, 1, 9, 7].select { |x| x > 3 })
    end

    it 'Compares if the range it\'s equal to select method.' do
      expect((1..7).my_select { |x| x > 3 }).to eql((1..7).select { |x| x > 3 })
    end

    it 'Returns an enumerator if no block is given' do
      expect((1..7).my_select).to be_kind_of(Enumerator)
    end

    it 'Returns an enumerator if no block is given' do
      expect([2, 3, 1, 9, 7].my_select).to be_kind_of(Enumerator)
    end

    it "Returns the elements that pass the test of the block. " do
      expect([1, 2, 3, 7].my_select { |element| element > 2 }).to eql([3, 7])
    end

    it "Return the value that we asked for in the block." do
      expect({ 1 => "one", 2 => "two" }.my_select { |pair| pair[0] == 2 }).to eql([[2, "two"]])
    end
  end
end
