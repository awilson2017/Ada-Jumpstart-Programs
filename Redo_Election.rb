# Greet user and ask for votes
# add votes to tally
# present results
# account for ties
# declare a winner


number_votes = 10

candidates = Hash.new
candidates = {
  "Donald Duck" => 0,
  "Minnie Mouse" => 0,
  "Goofy" => 0
}
# Greet user and ask for votes
puts "Welcome to my election voting program.

Election candidates are: Donald Duck, Minnie Mouse, Goofy

Please enter your vote."

# add votes to tally
(1..number_votes).each do |x|
  # Capitolize all words from user input (http://stackoverflow.com/questions/13520162/ruby-capitalize-every-word-first-letter)
  user_vote = gets.chomp.split.map { |x| x.capitalize }.join(' ')
  puts "Voter ##{x}: #{user_vote}"
    # Boolean condition for check user input is already a key in hash (https://docs.ruby-lang.org/en/2.0.0/Hash.html#method-i-has_key-3F)
    if candidates.has_key?(user_vote)
      candidates[user_vote] += 1
    else
      candidates[user_vote] = 1
    end
end



# present results
puts "ELECTION RESULTS....

Vote Summary:"

candidates.each do |k, v| 
  puts "#{k} - #{v} #{(v == 1 ? "vote" : "votes")}" #https://books.google.com/books?id=jcUbTcr5XWwC&pg=PA127&lpg=PA127&dq=handle+grammar+singular+plural+ruby&source=bl&ots=fJIhAe9uiF&sig=yFDiaPEw2xKlvClFOKelnpU92v0&hl=en&sa=X&ved=0ahUKEwjg3vG80frQAhXByVQKHajJDowQ6AEINjAE#v=onepage&q=handle%20grammar%20singular%20plural%20ruby&f=false
end

# account for ties
max_value = candidates.values.max
winners = candidates.select{|k, v| v == max_value}.keys

if winners.length > 1
  puts "\nWe have a tie!"
end

# declare a winner
winner_speech = "Winner: "
winners.each do |x|
  winner_speech = winner_speech + "#{x} & "
end
puts winner_speech[0...-3] + "!"
