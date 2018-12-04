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

#Write a function called that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.
def valid_parentheses(string)
  #your code here
  count = 0
  string.each_char {|x| count += 1 if x == ")" || x == "("}
  return true if count == 0

  for i in 0..(string.length-1)
    if string[-1] == "("
      return false
    elsif string[i] == "(" && string[-1] == ")"
      return true
    elsif string[i] == "(" && string[-1] != ")"
      lastind = string.length - 2
      while lastind >= 1
        return true if string[i] == "(" && string[lastind] == ")"
        last -= 1
      end
    else
      return false
    end
  end
end

#You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.
def find_outlier(integers)
  evens, odds = [], []
  integers.each do |x|
    x % 2 == 0 ? evens << x : odds << x
  end
  evens.length > odds.length ? odds[0] : evens[0]
end


#Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
def scramble(s1,s2)
  arr1 = s1.split('')
  arr2 = s2.split('')
  arr3 = []
  arr2.each { |c| arr3 << c if arr1.include?(c)}
  arr3.sort! {|x, y| x <=> y}
  arr2.sort! {|x, y| x <=> y}
  arr3 == arr2 ? true : false
end


def  first_non_repeating_letter(s)
  # Code go here
  return "" if s == ""
  counter = []
  arr = s.split("")
  arr.each do |x|
    return x if arr.count(x) == 1
      #return x
    #elsif
      #return ""
    #end
  end


#Write a function named firstNonRepeatingLetter† that takes a string input, and returns the first character that is not repeated anywhere in the string.

#For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.
def  first_non_repeating_letter(s)
  return "" if s == ""
  counter = 0
  arr = s.split("")
  arr.each do |x|
    if arr.count(x) == 1
      counter += 1
      return x
    end
  end
  return "" if counter == 0
end

#In this kata, you must create a digital root function.

#A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has two digits, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.
def digital_root(n)
  arr = n.to_s.split("")
  total = []
  val, answer = 0, 0
  arr.each {|x| val += x.to_i}
  if val <= 9
    return val
  elsif val > 9
    total = val.to_s.split("")
    total.each {|s| answer += s.to_i }
    return answer
  end
end

#Example:
#"56 65 74 100 99 68 86 180 90" ordered by numbers weights becomes: "100 180 90 56 65 74 68 86 99"
def order_weight(strng)
    #split to array, split nested array, map totals to_i, assign hash key and values(reduce)
    #sort hash by value, push into solution and join to a string with a space
    arr = strng.split(' ')
    sol, totals = [], []
    key = {}
    arr.each {|x| totals << x.split('')}
    totals.map do |brr|
      crr = brr.map {|y|  y.to_i}
      key[crr] = crr.reduce(:+)
    end
    key = key.sort_by {|k, v| v}
    key.each {|b,d| sol << b.join}

    return sol.join(' ')
end

#Given a list lst and a number N, create a new list that contains each number of lst at most N times without reordering. For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].

def delete_nth(order,max_e)
  #your code here
  counter = Hash.new(0)
  solution = []
  order.each {|x| counter[x] += 1}
  counter.each do |k, v|
    solution.push(k)
    v = max_e if v > max_e
    if v > 1
      v -= 1
      v.times do
        solution.push(k)
      end
    end
  end
  return solution
end

#In this kata you have to write a method that folds a given array of integers by the middle x-times.
def fold_array(array, runs)
  solution = []


  if runs ==1 and array.length == 1
    solution.push(array[0])
    return solution
####################
  elsif runs == 1
    if array.length.even?
      mid = array.length / 2
      midpoint = array[mid]
      0.upto(mid-2) do |x|
        solution[x] = array[x] + array[array.length - (x+1)]
      end
      solution.push(array[mid] + array[mid - 1])
    else
      mid = array.length / 2
      midpoint = array[mid]
      0.upto(mid-1) do |x|
        solution[x] = array[x] + array[array.length - (x+1)]
        solution[mid] = midpoint
      end
    end
   return solution
#######################
   elsif runs == 2
    if array.length.even?
      mid = array.length / 2
      midpoint = array[mid]
      0.upto(mid-2) do |x|
        solution[x] = array[x] + array[array.length - (x+1)]
      end
      solution.push(array[mid] + array[mid - 1])
    else
      mid = array.length / 2
      midpoint = array[mid]
      0.upto(mid-1) do |x|
        solution[x] = array[x] + array[array.length - (x+1)]
        solution[mid] = midpoint
      end
    end
    nextrun = solution
    if nextrun.length.even?
      mid = nextrun.length / 2
      midpoint = nextrun[mid]
      0.upto(mid-2) do |x|
        solution[x] = nextrun[x] + nextrun[array.length - (x+1)]
      end
      solution.push(nextrun[mid] + nextrun[mid - 1])
    else
      mid = nextrun.length / 2
      midpoint = nextrun[mid]
      0.upto(mid-1) do |x|
        solution[x] = nextrun[x] + nextrun[nextrun.length - (x+1)]
        solution[mid] = midpoint
        nextrun.pop
      end
    end
    return nextrun
########################
    elsif runs == 3
      if array.length.even?
      mid = array.length / 2
      midpoint = array[mid]
      0.upto(mid-2) do |x|
        solution[x] = array[x] + array[array.length - (x+1)]
      end
      solution.push(array[mid] + array[mid - 1])
    else
      mid = array.length / 2
      midpoint = array[mid]
      0.upto(mid-1) do |x|
        solution[x] = array[x] + array[array.length - (x+1)]
        solution[mid] = midpoint
      end
    end
    nextrun = solution
    if nextrun.length.even?
      mid = nextrun.length / 2
      midpoint = nextrun[mid]
      0.upto(mid-2) do |x|
        solution[x] = nextrun[x] + nextrun[array.length - (x+1)]
      end
      solution.push(nextrun[mid] + nextrun[mid - 1])
    else
      mid = nextrun.length / 2
      midpoint = nextrun[mid]
      0.upto(mid-1) do |x|
        solution[x] = nextrun[x] + nextrun[nextrun.length - (x+1)]
        solution[mid] = midpoint
        nextrun.pop
      end
    end
    ######
    mid = nextrun.length / 2
      midpoint = nextrun[mid]
      0.upto(mid-1) do |x|
        solution[x] = nextrun[x] + nextrun[nextrun.length - (x+1)]
        solution[mid] = midpoint
        nextrun.pop
      end
      return nextrun
    #return [nextrun[0] + nextrun[1]] if nextrun.length == 2


  end



end

#
#ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.
def rot13(string)
  # Put your code here!
  ans = ""
  alph = "abcdefghijklmnopqrstuvwxyz"
  calph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  string.each_char do |x|
    if alph.include?(x)
      ind = alph.index(x)
      newi = ind + 13
      pos = newi % 26
      ans << alph[pos]
    elsif calph.include?(x)
      ind = calph.index(x)
      newi = ind + 13
      pos = newi % 26
      ans << calph[pos]
    else
      ans << x
    end
  end
  return ans

end
