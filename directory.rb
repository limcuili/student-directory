# List students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Preddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

puts "The students of Villains Academy"
puts " ----------------"
students.each do |student|
  puts student
end
#print total number of students in one line.
print "Overall, we have #{students.count} great students"
