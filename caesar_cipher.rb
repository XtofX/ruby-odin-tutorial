#!/usr/bin/env ruby
# frozen_string_literal: true

# In cryptography is one of the simplest and most widely known encryption techniques.
# It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet.
# For example, with a left shift of 3, D would be replaced by A, E would become B, and so on.

# Implement a Caesar cipher that takes in a string and the shift factor and then outputs the modified string using a right shift:
#   > caesar_cipher("What a string!", 5)
#   => "Bmfy f xywnsl!"


# Quick Tips:
# You will need to remember how to convert a string into a number.
# Don’t forget to wrap from z to a.
# Don’t forget to keep the same case.
# The Wikipedia quote discusses a Caesar cipher using a left shift.

def encrypt_char(c, delta, base)
  (base.ord + (c[0].ord - base.ord + delta) % 26).chr
end

def cipher(str, delta)
  # establish the appropriate translation for any alphabetical characters
  ref = {}
  ('a'..'z').each_with_object(ref) { |c, h| h[c] = encrypt_char(c, delta, 'a') }
  ('A'..'Z').each_with_object(ref) { |c, h| h[c] = encrypt_char(c, delta, 'A') }

  # encrypt the string
  str.chars.map { |c| ref.fetch(c, c) }.join
end

def verify(id, str, delta, expected)
  puts "Test #{id}: #{cipher(str, delta) == expected ? 'PASS' : 'FAIL'} cipher('#{str}', #{delta}) == '#{expected}'"
end

t = 0
verify(t += 1, 'abc', 1, 'bcd');
verify(t += 1, 'abc1', 1, 'bcd1');
verify(t += 1, 'wxYz', 3, 'zaBc');
verify(t += 1, 'wx Yz!', 3, 'za Bc!');
verify(t += 1, 'What a string!', 5, 'Bmfy f xywnsl!');
