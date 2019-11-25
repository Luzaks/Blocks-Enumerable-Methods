# frozen_string_literal: true

module Enumerable #:nodoc:
  # my_each method

  def my_each
    return to_enum unless block_given?

    i = 0
    while i <= length - 1
      yield(self[i])
      i += 1
    end
    self
  end

  # each_with_index method

  def each_with_index
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
    my_each do |x|
      element = yield(x)
      select << x if element == true
    end
    select
  end

  # my_all method

  def my_all?
    arr = self
    arr.my_each do |x|
      return true unless block_given?

      item = yield(x)
      return false unless item
    end
    true
  end

  # my_any? method

  def my_any?
    p arr = self
    arr.my_each do |x|
      return true unless block_given?

      item = yield(x)
      return true if item
    end
    false
  end

  # my_none? method

  def my_none?
    p arr = self
    arr.my_each do |x|
      return true unless block_given?

      item = yield(x)
      return false if item
    end
    true
  end

  # my_count method
  def my_count
    p arr = self
    elements = 0
    elements += 1 while elements < arr.length
    elements
  end

  # my_map method

  def my_map(&my_proc)
    return to_enum(:my_map) unless block_given?

    arr = self
    map_arr = []
    if block_given?
      arr.my_each { |x| map_arr.push(yield(arr[x])) }
    else
      arr.my_each { |x| map_arr << my_proc.call(arr[x]) }
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

  # multiply_els

  def multiply_els
    arr = self
    result = 0
    arr.my_inject do |x, y|
      result = yield(x, y)
    end
    result
  end
end
