# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

#   > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#   => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#   > substrings("below", dictionary)
#   => { "below" => 1, "low" => 1 }
# Next, make sure your method can handle multiple words:

#   > substrings("Howdy partner, sit down! How's it going?", dictionary)
#   => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

# Quick Tips:
# - Recall how to turn strings into arrays and arrays into strings.
# 

def sub_strings(str, dictionary)
  str = "|#{str.downcase}|"   # use delimiter | to balance split when lookup word is at begining or end
  dictionary.each_with_object({}) do |word, h|
    count = str.split(word).length - 1
    h[word] = count if count > 0
  end
end

def test(id, str, dictionary, expected)
  puts "Test #{id}: #{sub_strings(str, dictionary) == expected ? "PASS" : "FAIL"} sub_strings('#{str}', #{dictionary}) == '#{expected}'"  
end

t = 0
test(t += 1, "xtof", ["abc", "def"], {});
test(t += 1, "xtof", ["abc", "def", "xtof"], {"xtof" => 1});
test(t += 1, "xtof xtof", ["abc", "def", "xtof"], {"xtof" => 2});
test(t += 1, "xtOf Xtof", ["abc", "def", "xtof"], {"xtof" => 2});
test(t += 1, "below", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"], {"below" => 1, "low" => 1});
test(t += 1, "Howdy partner, sit down! How's it going?", 
  ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"],
  {"howdy" => 1, "how" => 2, "down" => 1, "going" => 1, "partner" => 1, "it" => 2, "i" => 3, "part" => 1, "go" => 1, "sit" => 1, own => 1});
