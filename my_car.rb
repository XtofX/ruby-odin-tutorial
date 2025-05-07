#!/usr/bin/env ruby
# frozen_string_literal: true

# From https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#exercises
# 1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define
# some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set
# to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that
# allow the car to speed up, brake, and shut the car off.

# 2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method
# that allows you to view, but not modify, the year of your car.

# 3. You want to create a nice interface that allows you to accurately describe the action you want your program to
# perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

# From https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2#exercises#
# 1. Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.

# 2. Override the to_s method to create a user friendly print out of your object.
class MyCar

  def self.gas_mileage(gallons, miles)
    gm = miles.to_f / gallons
    puts "#{gm} miles per gallon of gas"
    gm
  end

  attr_reader :model, :year, :speed
  attr_accessor :color

  def initialize(model, year, color)
    @speed = 0
    @model = model
    @year = year
    @color = color
  end

  def current_speed
    puts "Your current speed is #{@current_speed} mph."
  end

  def speed_up(incremental_speed)
    puts "You are accelerating by #{incremental_speed} mph."
    @speed += incremental_speed
  end

  def brake(decremental_speed)
    puts "You are decelerating by #{decremental_speed} mph."
    @speed -= decremental_speed
  end

  def shut_off
    puts 'You are stopped'
    @speed = 0
  end

  def spray_paint(color)
    @color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "#{@model}/#{@year}/#{@color}"
  end
end

# MyCarTest is a class designed to performed test over MyCar
class MyCarTest
  attr_reader :id, :passed, :failed

  def initialize
    @id = 0
    @passed = 0
    @failed = 0
  end

  def verify_speed(car, action, param, expected)
    result = (param ? car.send(action, param) : car.send(action)) == expected
    update_counters(result)
    puts "Test #{@id}: #{result ? 'PASS' : 'FAIL'} #{car} -> #{action}(#{param}) == #{expected}"
  end

  def verify_color(car, expected)
    result = car.color == expected
    update_counters(result)
    puts "Test #{id}: #{result ? 'PASS' : 'FAIL'} #{car} is #{expected}"
  end

  def to_s
    "\nTest Summary: #{@passed}/#{@id} passed, #{@failed}/#{@id} failed"
  end

  def verify_gas_mileage(gallons, miles, expected)
    result = MyCar.gas_mileage(gallons, miles)
    update_counters(result == expected)
    puts "Test #{id}: #{result == expected ? 'PASS' : 'FAIL'} Gas Mileage(#{gallons}, #{miles}) is #{expected} miles per gallon"
  end

  private

  def update_counters(test_status)
    @id += 1
    if test_status
      @passed += 1
    else
      @failed += 1
    end
  end
end

f150 = MyCar.new("F150", "2025", "yellow")
test = MyCarTest.new

test.verify_speed(f150, "shut_off", nil, 0)
test.verify_speed(f150, "speed_up", 10, 10)
test.verify_speed(f150, "speed_up", 10, 20)
test.verify_speed(f150, "speed_up", 100, 120)
test.verify_speed(f150, "brake", 50, 70)
test.verify_color(f150, "yellow")
f150.color = "blue"
test.verify_color(f150, "blue")
f150.spray_paint("red")
test.verify_color(f150, "red")

test.verify_gas_mileage(8, 100, 100.0 / 8.0)
puts test # print summary
