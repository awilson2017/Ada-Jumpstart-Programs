# making a virtual vending Machine
# introduce the greeting to customer
# Ask customer how much money
# display all candy selections
# customer makes selection, is it valid
# upper and lower case selection
# decide if customer has enough money
# if yes give candy and change
# if no tell them

candy_options = Hash.new
candy_options = {
  "A" => 0.65,
  "B" => 0.50,
  "C" => 0.75,
  "D" => 0.65,
  "E" => 0.55
}

# introduce the greeting to customer
# Ask customer how much money

puts "Welcome to Ada's Computer Candy Machine!
(All candy provided is virtual.)

How much money do ya got?"
# ask user for money 
# validate input is number (http://stackoverflow.com/questions/31410694/how-to-check-if-user-input-is-a-number)
begin
  user_money = Float(gets)
rescue ArgumentError
  puts "Enter a number i.e. 1, 0.6"
retry
end

# display all user money and candy selections
puts "$#{user_money}, that's all?
Well, lemme tell ya what we got here.

A $0.65 Twix
B $0.50 Chips
C $0.75 Nutter Butter
D $0.65 Peanut Butter Cup
E $0.55 Juicy Fruit Gum

So, What'll ya have?"
# customer makes selection, is it valid
# upper and lower case selection
user_selection = gets.chomp.upcase

until candy_options.has_key?(user_selection) do
  puts "enter a letter"
  user_selection = gets.chomp.upcase
end

# decide if customer has enough money
# if yes give candy and change
# if no tell them
candy_price = candy_options[user_selection]
if user_money < candy_price
  puts "Not enough money. take a hike"
else
  user_change = user_money - candy_options[user_selection]
  puts "\nThanks for purchasing candy through us. \nPlease take your candy, and your $#{user_change} change!"
end
