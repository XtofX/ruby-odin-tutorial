#!/usr/bin/env ruby
# frozen_string_literal: true

# Implement a method #stock_picker that takes in an array of stock prices,
# one for each hypothetical day. It should return a pair of days representing
# the best day to buy and the best day to sell. Days start at 0.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
#
# Quick Tips:
# - You need to buy before you can sell
# - Pay attention to edge cases like when the lowest day is the last day or
#   the highest day is the first day.
#

def stock_picker(prices)
  buy = prices[0]
  buy_index = 0
  max = 0
  max_index = [0, 0]

  prices.each_with_index do |p, i|
    if p <= buy
      buy = p
      buy_index = i
      next
    end

    profit = p - buy
    if profit > max
      max = profit
      max_index = [buy_index, i]
    end
  end

  p max_index
end

def verify(id, prices, expected)
  puts "Test #{id}: #{stock_picker(prices) == expected ? 'PASS' : 'FAIL'} stock_picker('#{prices}') == '#{expected}'"
end

t = 0
verify(t += 1, [0, 1, 2, 4, 2, 8, 7], [0, 5])
verify(t += 1, [10, 3, 2, 4, 2, 8, 7], [4, 5])
verify(t += 1, [0, 1, 2, 4, 2, 8, 7, 10], [0, 7])
verify(t += 1, [17, 3, 6, 9, 15, 8, 6, 1, 10], [1, 4])

verify(t + 1, [1], [0, 0])
