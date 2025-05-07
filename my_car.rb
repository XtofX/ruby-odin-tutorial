#!/usr/bin/env ruby
# frozen_string_literal: true

# from https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#exercises
class MyCar
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
    puts "Test #{@id}: #{result == expected ? 'PASS' : 'FAIL'} #{car} -> #{action}(#{param}) == #{expected}"
  end

  def verify_color(car, expected)
    result = car.color == expected
    update_counters(result)
    puts "Test #{id}: #{result ? 'PASS' : 'FAIL'} #{car} is #{expected}"
  end

  def to_s
    "\nTest Summary: #{@passed}/#{@id} passed, #{@failed}/#{@id} failed"
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

puts test  # print summary
