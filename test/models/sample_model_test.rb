require 'minitest/spec'
require 'minitest/autorun'
require_relative '../minitest_helper'

describe Array do
  it "can be created with no arguments" do
    Array.new.must_be_instance_of Array
  end

  it "can be created with a specific size" do
    Array.new(10).size.must_equal 100
  end
end