# Q5 Just adding some input methods for the input_students method.
def input_hobby
	puts "What is this student's hobby?"
	@hobby = gets.chomp
end

def input_country
	puts "What is this student's country of birth?"
	@country = gets.chomp
end

def input_height
	puts "What is this stuent's height?"
	@height = gets.chomp
end

# Q6 Make everything that prints beauftifully aligned by using .center(n).
def input_student_name_cohort
	#Q7 let go of the hard-coded cohort. Take cohort input, include default cohort if nil.
 	puts "Please spell out the names of the students and their cohort in the form 'Name, Month'."
	puts "To finish, just hit return twice"
  students = []
  default_cohort = "november"
  input = gets.chomp.split(",")
  # while the name is not empty, repeat this code
  while !input.empty? do
  	@name = input[0]
  	if input[1] != nil
  		@cohort = input[1]
  	else
  		@cohort = default_cohort
  	end
    # add the student hash to the array
    students << {name: @name, cohort: @cohort} # hobby: @hobbby, country: @ country, height: @height}
    puts "Now we have #{students.count} students"
    input = gets.chomp.split(",")
  end
  students
end

# Q8 check for typos in input_student_name_cohort; allow changes.
def check(students)
	boolean = nil
	while true do
	puts "In the printed list of students, are there any students that has a typo? Y/N."
	boolean = gets.chomp
		if boolean == "Y"
			puts "Give me a number of a student that has an info typo, hit enter, then type the correct words."
			number = gets.chomp.to_i
			correct_input = gets.chomp.split(",")
			@correct_name = correct_input[0]
			@correct_cohort = correct_input[1]
			students[number - 1] = {name: @correct_name, cohort: @correct_cohort}
		elsif boolean == "N"
			puts "great, no further changes needed."
			break
		end
	end
	students
end




def print_header
  puts "The students of Villains Academy".center(60)
  puts " ----------------".center(60)
end



# Q1 Add index to list of students
def prints(students)
  students.each_with_index do |student,index|
  	# Q2 print students whose names start w/ a specific letter; here, letter D.
  	# if student[:name].start_with?('d','D')

  	# Q3 print student whose name is < 12 characters.
  	max_length = 12
  	if student[:name].length < max_length
      puts "#{index + 1}." + " #{student[:name]} (#{student[:cohort]} cohort)".center(60)
    end
  end
end

# Q4 As above, use while or until control flow method to print all students
def prints_while_method(students)
	i = 0
	while i < students.length do
		puts "#{i + 1}. " + " #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(60)
		i = i + 1
	end
end


def print_footer(students)
  print "Overall, we have #{students.count} great students"
end

# THIS IS THE IMPORTANT BIT. What methods do we run and in what order?
students = input_student_name_cohort
print_header
prints_while_method(students)
check(students)
print_footer(students)

print_header
prints_while_method(students)
print_footer(students)
