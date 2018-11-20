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


#Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.
#Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
#If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

def order(words)
  # your code...
  warr = words.split(' ')
  length = (warr.length) - 1
  nums = (0..9).to_a
  ans = (0..length).to_a
  warr.each do |x|
    x.each_char do |y|
     ans[(y.to_i) - 1] = x  if nums.include?(y.to_i)
    end
  end
  ans = ans.join(' ')
  return ans
end


#Bob is preparing to pass IQ test. The most frequent task in this test is to find out which one of the given numbers differs from the others. Bob observed that one number usually differs from the others in evenness. Help Bob — to check his answers, he needs a program that among the given numbers finds one that is different in evenness, and return a position of this number.
#! Keep in mind that your task is to help Bob solve a real IQ test, which means indexes of the elements start from 1 (not 0)

def iq_test(numbers)
  ecounter, ocounter = 0, 0
  arr = numbers.split(' ').map(&:to_i)
  arr.each {|x| x.even? ? ecounter += 1 : ocounter += 1  }
  item = []
  ecounter > ocounter ? arr.each {|y|  item << y if y.odd?} : arr.each {|y| item << y if y.even?}
  return answer = arr.find_index(item[0]) + 1
end
