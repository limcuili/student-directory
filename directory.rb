# COMMENT Q5 Just adding some input methods for the input_students method.
# def input_hobby
	# puts "What is this student's hobby?"
	# @hobby = gets.chomp
# end
# def input_country
	# puts "What is this student's country of birth?"
	# @country = gets.chomp
# end
# def input_height
	# puts "What is this stuent's height?"
	# @height = gets.chomp
# end

@students = [] # an empty array accessible to all methods

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def process(selection)
		case selection
			when "1"
				@students = input_student_name_cohort
			when "2"
				display
			when "3"
				save_students
			when "4"
				load_students
			when "9"
				exit # this will cause the program to terminate
			else
				puts "I don't know what you meant, try again"
		end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
			@students << {name: name, cohort: cohort.to_sym}
	end
	file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist"
		exit # quit the program
	end
end

# Q6 Make everything that prints beauftifully aligned by using .center(n).
def input_student_name_cohort
	#Q7 let go of the hard-coded cohort. Take cohort input, include default cohort if nil.
 	puts "Please spell out the names of the students and their cohort in the form 'Name,Month'."
	puts "To finish, just hit return twice"
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
    @students << {name: @name, cohort: @cohort} # hobby: @hobbby, country: @ country, height: @height}
    # Q9 correcting grammar to allow singular student
    if @students.count < 2
    	puts "Now we have #{@students.count} student"
    else
    	puts "Now we have #{@students.count} students"
    end
    input = gets.chomp.split(",")
  end
  @students
end

# Q8 check for typos in input_student_name_cohort; allow changes.
def check
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
			@students[number - 1] = {name: @correct_name, cohort: @correct_cohort}
		elsif boolean == "N"
			puts "great, no further changes needed."
			break
		end
	end
	@students
end

# Q8 arrange the students by cohort.
def print_by_cohort
	cohort_array = []
	@students.each do |student_hash|
		cohort_array.push(student_hash[:cohort]).uniq!
	end
	cohort_array.each do |month|
		puts month
		@students.each_with_index do |student, index|
			if student[:cohort] == month
				puts "#{index + 1}. " + " #{@students[index][:name]} (#{@students[index][:cohort]} cohort)".center(60)
			end
		end
	end
end

def print_header
  puts "The students of Villains Academy".center(60)
  puts " ----------------".center(60)
end



# COMMENT Q1 Add index to list of students
def print_students_list
	@students.each_with_index do |student,index|
  	# COMMENT Q2 print students whose names start w/ a specific letter; here, letter D.
  	# if student[:name].start_with?('d','D')

  	# COMMENT Q3 print student whose name is < 12 characters.
  	# max_length = 12
  	# if student[:name].length < max_length
    puts "#{index + 1}." + " #{student[:name]} (#{student[:cohort]} cohort)".center(60)
    # end
  end
end

# Q4 As above, use while or until control flow method to print all students
def prints_while_method
	i = 0
	while i < @students.length do
		puts "#{i + 1}. " + " #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(60)
		i = i + 1
	end
end

# Q12 include a puts for if there are no students.
# Also in Step 10.
def display
	if @students.count == 0
		puts "We have no students"
	else
		print_header
		print_students_list
		print_footer
	end
end

def print_footer
	# Q9 correcting grammar to allow singular student
	if @students.count < 2
  	puts "Overall, we have #{@students.count} great student"
  else
  	puts "Overall, we have #{@students.count} great students"
  end
end

interactive_menu

# COMMENT Gets student names and cohort and displays them.
# students = input_student_name_cohort
# display(students)
# COMMENT Checks that everything is typed in correctly and allow changes.
# check(students)
# print_footer(students)
# COMMENT Displays the corrected list of students' names and cohort.
# display(students)
# COMMENT Displays by cohort
# print_by_cohort(students)
