=begin

Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

=end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  hash = {}
  i = lt = 0
  max = 0
  (0...s.length).each { |i|
    c = s[i]
    lt = hash[c] + 1 if hash[c] && hash[c] + 1 > lt
    hash[c] = i
    max = i - lt + 1 if i - lt + 1 > max
    i += 1
  }
  max
end