def sub_strings(string, dictionary)
  result = Hash.new
  dictionary.each do |word1|
    count = 1
    string.split().each do |word2|
      if word2.downcase.include?(word1.downcase)
        result[word1] = count
        count += 1
      end
    end
  end
  result
end
string = "Howdy parter, sit down! How's it goings?"
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i",
              "low", "own", "part", "partner", "sit"]
p sub_strings(string, dictionary)
#Split main string into array and lower case it
#Iterate through array with each dictionary word to see if it exists in the string
#Return a hash listing each substring and how many times it was found