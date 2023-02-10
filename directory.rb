
# let's put all students into an array
# students = [
#     {name: "Dr Hannibal Lecter", cohort: :november}, 
#     {name: "Darth Vader", cohort: :november}, 
#     {name: "Nurse Ratched", cohort: :november}, 
#     {name: "Michael Corleone", cohort: :november}, 
#     {name: "Alex DeLarge", cohort: :november}, 
#     {name: "The Wicked Witch of the West", cohort: :november}, 
#     {name: "Terminator", cohort: :november}, 
#     {name: "Freddy Kreuger", cohort: :november}, 
#     {name: "The Joker", cohort: :november},
#     {name: "Joffrey Baratheon", cohort: :november},
#     {name: "Norman Bates", cohort: :november},
#     ]

@students = []
def input_students
  
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create and empty array
  
  #get the first name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code
  while !name.empty? do 
    puts "What cohort are they in?"
    cohort = gets.chomp.downcase.to_sym
    #add the student hash to the array
    
    if cohort.empty?
      cohort = :unknown
    end
    
    cohort_months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, :unknown]
    
    until cohort_months.include?(cohort)
      puts "please repeat that"
      cohort = gets.chomp.downcase.to_sym
    end
    
      @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students"
      #get another name from the user
      puts "Please enter the name of the next student or to finish press return"
      name = gets.chomp.capitalize
  end
  #return the array of students 
   
end
    
def print_header 
  puts "The students of Villain's Academy".center(60)
  puts "-------------".center(60)
end 

def print
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end

def print_footer
  puts ""
  puts "Overall, we have #{@students.count} great students".center(60)
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header 
  print
  print_footer
end 



def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students 
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def interactive_ruby

  loop do 
    print_menu
    process(gets.chomp)
  end
  
end


#nothing happens until we call these methods
interactive_ruby

