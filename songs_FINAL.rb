# Primary Requirements of prgram
  # Create a song time calculator program that accepts the following input from the user for four different songs:
      # Name of the song
      # Length in seconds
      # Number of times the song has been played
  # Have the song time calculator output the following:
      # Listening time for each song
      # Total listening time for all songs
      # Which song has been listened to the longest total amount of time
  # Respond to the following prompts about the code you have written:
      # Describe something that you tried that didn't work and how you eventually fixed it
      # Describe a situation where your code may not perform as you would like

# ====================================== My work is below ================================

# The format of this section is a comment explaning the intention of my code, program code, and then a comment with what happened (control flow) for each major section of my program.

# Array creation to store linked song information for each song that can be used throughout my program.
songs = Array.new
songs = []
# An array was created



# Assign the desired number of songs to a variable for multiple uses in my program.
# It also allows for easily changing the designed number of songs upwards or downwards from 4.
number_song = 2
# The desired number of songs was assigned to number_song



# Greet the user and explain the purpose of the program.
puts "\n\nWelcome to Angela's Song Time Calculator\n\n"
# Output to the terminal were two hard returns, the above greeting, and then two hard returns.



# Provide user with an overview of the program.
puts "You will be asked to enter song information for #{number_song} different songs."
# Output to the terminal was the above message except that #{number_song} was replaced with the value assigned to number_song.



# Use of an each loop to loop through the block of code specified by the inclusive range (1..number_song).
# Using a variable for the upper limit of the range makes changing the number of loops easy.
# Using an iterator variable to help the user keep track of how many songs they have already input.
(1..number_song).each do |x|
  # Ask user for the song name.
  # Name of the song is a string and could contain letters, numbers, and special characters so no validation of user input is needed.
  puts "\nPlease enter song #{x}'s name."
  # Output to terminal was a hard return followed by the above message with #{x} interpolated as the loop number for the inclusive range (1..number_song).



  # Capitalize each word the user inputs despite knowing some songs have all lowercase titals.
  # The code below is from http://stackoverflow.com/questions/13520162/ruby-capitalize-every-word-first-letter
  song_name = gets.chomp.split.map(&:capitalize ).join(' ')
  # The user inputs the song name. At the each character ' ' the string is split into parts, stored into an array based of the code block, joined at each character ' ', and then assigned to song_name.



  # Not many people think of song lengths in strictly seconds. So to make the program user friendly,
  # I asked the user to input the lenth of the song in two segments: minutes and seconds
  puts "Song length: Please separatly enter minutes and seconds of your song length."
  puts "First enter minutes."
  # Terminal output the two above messages on two separate lines.



  # I wanted to validate user input for minutes was only a number.
  # While writing the Candy Machine program I found code to validate the user input was a only number.
  # http://stackoverflow.com/questions/31410694/how-to-check-if-user-input-is-a-number
  # I modified it to suite my needs.
    begin
      song_length_mins = Integer(gets)
    rescue ArgumentError
      puts "Enter a number i.e. 1"
    retry
    end
  # If the user input is an integer then the program moves to the next piece of code.
  # However, if the user inputs a letter, special character, or a float then the terminal will output the message "Enter a number i.e. 1".
  # The code will again ask the user for a number until an integer is input.
  # Once the user inputs a valid number, this value is assigned to song_length_mins.



  # I wanted to validate user input for seconds was only a number.
  # For my intention and output for this section of code, please refer to the above minutes input intention and outcome.
  # The one difference between this section and the above section is the user input is assigned to song_length_seconds.
  puts "Now enter seconds"
    begin
      song_length_seconds = Integer(gets)
    rescue ArgumentError
      puts "Enter a number i.e. 1"
    retry
    end



  # I wanted the total song duration in seconds.
  total_length_secs = (song_length_mins * 60) + song_length_seconds
  # the value stored in song_length_mins is multiplied by 60 and then the value of song_length_seconds is added.
  # the resulting value is assigned to total_length_secs.



  # Number of times the song was played. This code was originally structured
  # like the minutes and seconds; however, I started thinking about Youtube and
  # how they monetize their video views based on how long the viewer watches a video.
  # So I changed the Integer(gets) to Float(gets) to account for partilly listened to songs.
  puts "Enter # times played"
    begin
      times_played = Float(gets)
    rescue ArgumentError
      puts "Enter a number i.e. 0.5, 1"
    retry
    end
  # Terminal output "Enter # times played."
  # If the user input is a float or integer then the program moves to the next piece of code.
  # However, if the user inputs a letter or special character then the terminal will output the message "Enter a number i.e. 0.5, 1".
  # The code will again ask the user for a number until an float or integer is input.
  # Once the user inputs a valid number, this value is assigned to times_played.



  # I wanted the total listening time for the song.
  total_time = (total_length_secs * times_played)
  # The result of the values of total_length_secs multipied by the value of times_played is stored in total_time.



  # Store linked song info in a temporary hash and then store the hash in the global array songs. Hashes are fantastic for storing linked information so I used one.
  # I used symbols over strings for the hash keys for efficiency.
  songs << hash = {
    song_name: song_name,
    song_length: total_length_secs,
    times_played: times_played,
    total_time: total_time
  }
  # A temporary hash was created with the linked song information with symbols as keys.
  # Then the temporary hash was stored in the global array songs.

# End of loop
end
# Once the all the loops of code are completed, dictated by the inclusive range, the user exits the loop.



# Song summaries
puts "\nHere are your songs!\n"
# Terminal outputs a hard return, "Here are your songs!," and a hard return.



# Times loop based on the value assigned to number_song with an iterator variable allows for robust code.
  number_song.times do |x|
    puts "Song ##{x + 1}'s name: " + songs[x][:song_name]
    puts "Song length ##{x + 1}: " + songs[x][:song_length].to_s + " seconds"
    puts "Number of times played ##{x + 1}: " + songs[x][:times_played].to_s
    puts "\n\n"
  end
# Terminal outputs a summary of each song's name, length in seconds, and number of times played as string messages.
# The interpolated "x + 1" outputs 1 on the first loop and increases by 1 with each loop.
# Regarding the Total time output, the "%.0f" % notation displays the float as a whole number.
# Terminal output two hard returns.



# Summarize to user their songs' total listening time.
puts "Now for your songs' total listening time."
# The above string message is output to terminal.



# Times loop based on the value assigned to number_song with an iterator variable allows for robust code.
number_song.times do |x|
  puts "#{songs[x][:song_name]}: " + "%.0f" %songs[x][:total_time] + " seconds"
end
# Regarding the Total time output, the "%.0f" % notation displays the float as a whole number.



# Total listening time for all songs. I knew that I wanted to use the method inject to add all the song lengths
# but was unsure how to access them. So I tried the below code and recieved a error: "in `[]': no implicit conversion of Hash into Integer (TypeError)"
    # songs.each do |x|
    #   total_time_all_songs = songs[x][:total_time]
    #     puts "The total listening time for all songs is #{total_time_all_songs}"
    # end
# The above did not work so I puzzled about my wanted and Googled "retrieve
# the hash values in an array." Stack Overflow had the answer: array.map{|x| x[:price]}
# (http://stackoverflow.com/questions/18899868/collect-values-from-an-array-of-hashes).
# I refreshed my memory on map's fuction and then used inject.
total_time_per_song = songs.map { |x| x[:total_time] }
total_time_all_songs = "%.0f" %total_time_per_song.inject{|sum, x| sum + x }
# An array of all the song lengths in seconds is created and then assigned to total_time_per_song.
# The values within array total_time_per_song are added together and then assignes the whole number result to total_time_all_songs.



# Declare to the user the total listening time for all songs.
puts "\n\nYour total listening time for all songs is #{total_time_all_songs} seconds."
# Termminal output the above string message while interpolating the total_time_all_songs and outputting its value.



# Which song(s) were listened to the longest total amount of time. Please see the "What didn't work" section
# of Phase 2 for what code I tried.
length_of_longest = songs.map { |h| h[:song_length] }.max
name_longest_listening_time = songs.select { |h| h[:song_length] == length_of_longest }.map { |h| h[:song_name] }
# An array is created and filled with all the hightest total listening lengths and then assigned to length_of_longest.
# An array is created and filled with all the song names of the hightest total listening lengths and then assigned to name_longest_listening_time.



# If there is a tie for song with longest listening time, tell the user. If not skip this section of code.
# I based the below code on my experiecne with the Election Machine program.
if name_longest_listening_time.length > 1
  puts "\nYou have a tie between #{name_longest_listening_time.length} songs at #{length_of_longest} seconds!"
end
# If name_longest_listening_time contains more than 1 object, then the terminal outputs the message above.
# Two interpolations occured. First the number of objects in name_longest_listening_time and second the value of the longest listening length.
# However, if name_longest_listening_time is 1, the program flows to the next section of code.



# Declare the song name(s) that had the highest listenting length.
# Assigned the first part of speech to max variable outside each loop to use globally.
# Used both each loop on name_longest_listening_time array with an iterator variable to iterate over each song name in the array.
# Concatonate song name(s) and address fence-post issue later in program.
max_listen_time_song_name_speech = "with maximun listenting time: "
name_longest_listening_time.each do |x|
  max_listen_time_song_name_speech = max_listen_time_song_name_speech + "#{x} & "
end
# With each loop of the block one song name and " & " is added to the message "with maximun listenting time: ."
# Once the block loops over each song name in array name_longest_listening_time, the loop is exited.



# Output to user the song name(s) with the longest listenting length.
# I interpolated two bits of code: Boolean conditional and concatonated song speech
# I used short-hand Boolean conditional found at https://books.google.com/books?id=jcUbTcr5XWwC&pg=PA127&lpg=PA127&dq=handle+grammar+singular+plural+ruby&source=bl&ots=fJIhAe9uiF&sig=yFDiaPEw2xKlvClFOKelnpU92v0&hl=en&sa=X&ved=0ahUKEwjg3vG80frQAhXByVQKHajJDowQ6AEINjAE#v=onepage&q=handle%20grammar%20singular%20plural%20ruby&f=false
# for syntax. This addressed grammar of songs versus song.
# Regarding the song speeach, I addressed the fence-post issue by using an exclusion range to output song speech without the last " & ."
puts "#{(name_longest_listening_time.length > 1 ? "Songs" : "Song")} #{max_listen_time_song_name_speech[0...-3]}!!"#{(name_longest_listening_time.length > 1 ? "Songs" : "Song")} #{max_listen_time_song_name_speech} #{(length_longest_listening_time.length > 1 ? "at #{length_longest_listening_time[1]}"  : "with" + length_longest_listening_time[1])}"
# Terminal outputs either song speech with all song name(s) with the highest listening length and proper grammar is used for one or more song names.



# Thank the user
puts "\nThank you for using Angela's Song Calculator!\n\n"
# The above message was output on terminal.
