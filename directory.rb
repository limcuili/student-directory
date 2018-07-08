# List students in an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts " ----------------"
end

# Q1 Add index to list of students
def prints(students)
  students.each_with_index do |student,index|
  	# Q2 print students whose names start w/ a specific letter; here, letter D.
  	# if student[:name].start_with?('d','D')

  	# Q3 print student whose name is < 12 characters.
  	max_length = 12
  	if student[:name].length < max_length
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# Q4 use while or until control flow method to print all students
def prints_while_method(students)
	i = 0
	while i < students.length do
		puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
		i = i + 1
	end
end


def print_footer(students)
  print "Overall, we have #{students.count} great students"
end

students = input_students
print_header
prints_while_method(students)
print_footer(students)
