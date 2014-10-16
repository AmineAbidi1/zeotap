#encoding:utf-8
module Mappers
  class Computer
    # IMPORTANT: The algorithms here are case incenstitive !

    # Converting S1 into an Array of strings, and Sorting S2 in alphabetical order THEN applying the Binary Search algorithm.
    # Worst Case complexity is O(nLogn) = n * Logn ; n is the length of S1, Logn is the complexity of the Binary Search I used to find each element of S1 in S2
    # We need to iterate through S1 (n times), and then for each element of S1 Binary Search it in S2 (Logn) ==> an overall complexity of O(nlogn)
    def self.seek(string1, string2)
      @res = ''
      string1.downcase.split("").each do |c|
        @res += binary_search(string2.downcase.chars.sort.join, c).to_s #usting the .sort method, which by default uses the Quicksort algorithm => O(nLogn) on average case.
      end
      @res.empty? ? 'No matches' : @res
    end

    # Using the Binary search algorithm to search for each element from S1 in S2
    def self.binary_search(string, element)
      high = string.length - 1
      low = 0
      while low <= high do
        current_index = (high + low) / 2
        if element == string[current_index]
          return element
        elsif element < string[current_index]
          high = current_index - 1
        else
          low = current_index + 1
        end
      end
    end

  end
end