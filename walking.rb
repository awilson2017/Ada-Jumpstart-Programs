# Create a walk-a-thon program that accepts the following input from the user:
# Earning goal for the walk-a-thon
# Amount earned per lap completed (per person)
# Number of laps completed for 5 people
# Have the walk-a-thon program calculate and output the following:
# Who earned the most money
# Total amount earned in the walk-a-thon
# Whether or not the earning goal was met

walker_num = 5

walker_earnings = Hash.new
walker_earnings = {}

# Program greeting
puts "\nWelcome to Darth's Walk-A-Thon Tracker

Our goal is to raise money!"

# Earning goal for the walk-a-thon
puts "\nEnter the earning goal for this event:"
earning_goal = gets.chomp.to_f


# Amount earned per lap completed (per person)
puts "\nEnter the amount earned per lap (per person):"
lap_amount = gets.chomp.to_f

# Number of laps completed for 5 people
puts "Please enter the number of laps completed by each person."
(1..walker_num).each do |x|
  puts "\nWalker ##{x}: #{laps_walked = gets.chomp.to_i}"
  amount_earned = lap_amount * laps_walked
  puts "Walker ##{x} Earned: $" + "%.2f" %amount_earned.to_s
  walker_earnings[x] = amount_earned
end

# Total amount earned in the walk-a-thon
total_earned = walker_earnings.values.inject{|sum, x| sum + x}
puts "Total amount earned: $#{"%.2f" %total_earned}"

# Whether or not the earning goal was met
total_minus_earning = total_earned - earning_goal
if total_minus_earning > 0
  puts "We met our goal by $#{"%.2f" %(total_minus_earning)} Whoot!"
else
  puts "We missed our goal by $#{"%.2f" %(0-total_minus_earning)} Boo"
end

