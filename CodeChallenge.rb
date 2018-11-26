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


#In this kata you will create a function that takes a list of non-negative integers and strings and returns a new list with the strings filtered out.
def filter_list(l)
  answer = []
  l.each {|x| answer << x if x.is_a? Integer}
  return answer
end

def sort_array(source_array)
  #your code here
  answer = []
  key ={}
  source_array.each do |x|
    key[x]=source_array.find_index(x)
  end
  source_array.each {|d| answer << d if d.odd?}
  sortedodd = answer.sort!
  key.each do |k, val|
    sortedodd.insert(val, k) if val.even?
  end
  return sortedodd


end

#Input:
#The function will be given two parameters. Each parameter will be a string separated by a single space. Each string will contain the count of each race on the side of good and evil.
#The first parameter will contain the count of each race on the side of good in the following order:
#Hobbits, Men, Elves, Dwarves, Eagles, Wizards.
#The second parameter will contain the count of each race on the side of evil in the following order:
#Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.
#All values are non-negative integers. The resulting sum of the worth for each side will not exceed the limit of a 32-bit integer.
#Output:
#Return "Battle Result: Good triumphs over Evil" if good wins, "Battle Result: Evil eradicates all trace of Good" if evil wins, or "Battle Result: No victor on this battle field" if it ends in a tie.

def goodVsEvil(good, evil)
garr = good.split(" ")
barr = evil.split(" ")
garr = garr.map {|x| x.to_i}
barr = barr.map {|x| x.to_i}
gscore = [1, 2, 3, 3, 4, 10]
bscore = [1, 2, 2, 2, 3, 5, 10]
gfin, bfin = [], []
gtotal, btotal = 0, 0
for i in 0..(garr.length-1)
  gfin.push(garr[i] * gscore[i])
  gtotal += (garr[i] + gscore[i])
end
for i in 0..(barr.length-1)
  bfin.push(barr[i] * bscore[i])
  btotal += (barr[i] + bscore[i])
end
if gtotal > btotal
  return "Battle Result: Good triumphs over Evil"
elsif btotal > gtotal
  return "Battle Result: Evil eradicates all trace of Good"
elsif btotal == gtotal
  return "Battle Result: No victor on this battle field"
end

end
