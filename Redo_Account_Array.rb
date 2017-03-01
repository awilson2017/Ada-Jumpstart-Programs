# make array containing first and last names upper case
# make array random numbers between 111111 and 999999
# make array for email addresses
# create email address Awilson123@ada.Com
# write code to print all columns.

first_names = []
last_names = []
student_ID_numbers = []
student_emails = []

number_students = 2

# account generator
number_students.times do
  puts "\nPlease enter your first name."
  student_first_name = gets.chomp.upcase
  first_names << student_first_name

  puts "Please enter your last name."
  student_last_name = gets.chomp.upcase
  last_names << student_last_name

  # unique student id number
  id_number = rand(111111..999999)
  while student_ID_numbers.include?(id_number)
    id_number = rand(111111..999999)
  end
  student_ID_numbers << id_number

  # create email like AWILSON123@ada.org
  firstNameinitials = ""
  student_first_name.split(" ").map do |temp_name|
    firstNameinitials = firstNameinitials + temp_name.slice(0)
  end
  puts firstNameinitials

  student_emails << firstNameinitials + student_last_name + id_number.to_s.slice(-3..-1) + "@ada.org"
end

# display user accounts
number_students.times do |x|
  puts first_names[x] + " " + last_names[x] + " - " + student_ID_numbers[x].to_s + " - " + student_emails[x]
end
