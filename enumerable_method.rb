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
  end

  # my_select method

  def my_select
    return to_enum(:my_select) unless block_given?

    select = []
    if block_given?
      my_each do |x|
        element = yield(x)
        select << x if element == true
      end
    end
    select
  end

  # my_all method

  def my_all?(arg = nil)
    arr = self
    if block_given? && arg.nil?
      arr.my_each { |item| return false unless item == true }
    elsif arg
      arr.my_each { |item| return false unless clases(item, arg) }
    elsif !block_given? && arg.nil?
      return false
    end
    true
  end

  # my_any? method

  def my_any?(arg = nil)
    arr = self
    if block_given? && arg.nil?
      arr.my_each { |item| return true if yield(item) == true }
    elsif !block_given? && arg
      arr.my_each { |item| return true if clases(item, arg) }
    end
    false
  end

  # my_none? method

  def my_none?(arg = nil)
    arr = self
    if block_given? && arg.nil?
      arr.my_each { |item| return false if yield(item) }
    elsif !block_given? && input
      arr.my_each { |item| return false if clases(item, arg) }
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

  def my_inject(*args)
    arr = self
    if !args.empty?
      result = args
    else
      result = arr[0]
      arr.shift
    end
    arr.length.times { |i| result = yield(result, arr[i]) }
    result
  end

  # Matching classes in input

  def clases(item, arg)
    if arg.class == Regexp
      return true if item.to_s.match(arg)
    elsif arg.class == Class
      return true if item.instance_of? arg
    elsif arg.class == String || arg.class == Integer || arg.class == Symbol
      return true if item == arg
    end
  end
end

# multiply_els for testing my_map method

def multiply_els
  arr = self
  result = 0
  arr.my_inject do |x, y|
    result = yield(x, y)
  end
  result
end
