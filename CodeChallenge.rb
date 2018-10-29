#Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present

def spinWords(string)
  #TODO
  ans = ""
  arr = string.split(', ')
  arr.each do |x|
  if x.length >= 5
    ans << x.to_s.reverse
  elsif x.length < 5
    ans << x.to_s
  end
  new = ans.split
  b = []
  new.each do |s|
    if s.length < 5
      b.unshift(s.reverse)
    else
      b.unshift(s)
    end
  end
  b = b.join(' ')
  return b
  end
end


#Given an array, find the int that appears an odd number of times.
#There will always be only one integer that appears an odd number of times.

def find_it(seq)
  #your code here
  seq = seq.sort
  ans = []
  seq.each do |num|
    if seq.count(num) % 2 != 0
      return num
    end

  end
end
