# write a prohram that lists the new students and also their hobbies and countries of origin
# each response must have the first letter capitalized
# list 

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create and empty array
  students = []
  #get the first name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat the following code
  
  while !name.empty? do 
    puts "Please enter their favourite hobby"
    hobby = gets.chomp.capitalize
  
    puts "Please enter their country of birth"
    country = gets.chomp.capitalize
    
    #add all three hashes to the array
    students << {name: name, hobby: hobby, country_of_birth: country, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Please enter the names of the students, if you have no more to add press return"
    
    name = gets.chomp.capitalize
  end
  #return the array of students 
  students
end
    
def print_header 
  puts "The students of Villain's Academy"
  puts "-------------"
end 

def print(students)
  students.each do |student|
    puts "\nName: #{student[:name]}\nCohort: #{student[:cohort]}\nFavourite Hobby: #{student[:hobby]}\nCountry of Birth: #{student[:country_of_birth]}"
  end
end

def print_footer(names)
  puts "\nOverall, we have #{names.count} great students"
end

#nothing happens until we call these methods
students = input_students
print_header 
print(students)
print_footer(students)


