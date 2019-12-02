# frozen_string_literal: true

module Enumerable #:nodoc:
  # my_each method

  def my_each
    return to_enum unless block_given?

    i = 0
    while i < size
      yield(to_a[i])
      i += 1
    end
    self
  end

  # each_with_index method

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i <= length - 1
      yield(self[i], i)
      i += 1
    end
    self
  end

  # my_select method

  def my_select
    return to_enum(:my_select) unless block_given?

    select = []
    if block_given?
      my_each do |x|
        element = yield(x)
        select << x if element
      end
    end
    select
  end

  # my_all method

  def my_all?(arg = nil)
    arr = self
    if block_given? && arg.nil?
      arr.my_each { |item| return false unless yield(item) }
    elsif arg.nil?
      arr.my_each { |item| return false unless item }
    elsif arg
      arr.my_each { |item| return false unless clases(item, arg) }
    elsif !block_given? && arg.nil?
      arr.my_each { |item| return false unless item }
    else
      arr.my_each { |item| return false unless arg == item }
    end
    true
  end

  # my_any? method

  def my_any?(arg = nil)
    arr = self
    if block_given? && arg.nil?
      arr.my_each { |item| return true if yield(item) }
    elsif arg.nil?
      arr.my_each { |item| return true if item }
    elsif arg
      arr.my_each { |item| return true if clases(item, arg) }
    elsif !block_given? && arg.nil?
      arr.my_each { |item| return true if item }
    else
      arr.my_each { |item| return true if arg == item }
    end
    false
  end

  # my_none? method

  def my_none?(arg = nil)
    arr = self
    if block_given? && arg.nil?
      arr.my_each { |item| return false if yield(item) }
    elsif arg.nil?
      arr.my_each { |item| return false if item }
    elsif arg
      arr.my_each { |item| return false if clases(item, arg) }
    elsif !block_given? && arg.nil?
      arr.my_each { |item| return false if item }
    else
      arr.my_each { |item| return false if arg == item }
    end
    true
  end

  # my_count method

  def my_count(arg = nil)
    counter = 0
    my_each do |item|
      if block_given? && arg.nil?
        counter += 1 if yield(item)
      elsif item && arg.nil?
        counter += 1
      elsif clases(item, arg) && arg.is_a?(Integer)
        counter += 1
      end
    end
    counter
  end

  # my_map method

  def my_map
    return to_enum(:my_map) unless block_given?

    map_arr = []
    my_each do |x|
      map_arr << yield(x) || map_arr << proc.call(x) if block_given?
    end
    map_arr
  end

  # my_inject

  def my_inject(xhi = nil, phi = nil)
    arr = self
    arr = to_a unless arr.is_a?(Array)

    symbol = xhi

    if block_given? && xhi.nil?
      symbol = arr[0]
      my_each_with_index do |x, y|
        next if y.zero?

        symbol = yield(symbol, x)
      end
    end
    my_each { |x| symbol = yield(symbol, x) } if block_given? && xhi && phi.nil?

    if (xhi.is_a? Symbol) && phi.nil?
      symbol = arr[0]
      my_each_with_index do |x, y|
        next if y.zero?

        symbol = symbol.send(xhi, x)
      end
    end
    my_each { |i| symbol = symbol.send(phi, i) } if xhi && phi
    symbol
  end

  # Matching classes in input

  def clases(alpha, arg)
    if arg.is_a?(Regexp)
      return true if alpha.to_s.match(arg)
    elsif arg.is_a?(String) || arg.is_a?(Integer) || arg.is_a?(Symbol)
      return true if alpha == arg
    elsif arg.is_a?(Class)
      return true if alpha.instance_of? arg
    end
  end
end

# multiply_els for testing my_inject method

def multiply_els(arr)
  multiplied_arr = arr
  multiplied_arr.my_inject do |x, y|
    x * y
  end
end
