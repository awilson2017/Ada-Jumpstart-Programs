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
  user_vote = gets.chomp.split.map { |x| x.capitalize }.join(' ')
  puts "Voter ##{x}: #{user_vote}"
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
  puts "#{k} - #{v} #{(v == 1 ? "vote" : "votes")}"
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
