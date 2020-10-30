require 'json'

data = File.read("data.json")

questions_array = JSON.parse(data)

round_questions = []

round_questions << questions_array.sample(10)

round_questions = round_questions.flatten
  
round_data = round_questions.map {|question| [question["question"], question["incorrect"], question["correct"]]}

questions = []

round_data.each do |q|
	questions << q[0]
end

potential_answers = []

round_data.each do |q|
	new_question = q[1] << q[2] 
	potential_answers << new_question.shuffle
end

correct_answers = []

round_data.each do |q|
	correct_answers << q.last.downcase
end

puts "Let's get started!"
sleep(0.8)

score = 0

i = 0
until i == 10

	puts questions[i]
  puts potential_answers[i]
  answer = gets.chomp.downcase
  
  if correct_answers.include?(answer)
  	score += 1
  	puts "\u{1f600}"
  else
  	puts "\u{1F629}"
  end
  i += 1

end

puts "Your score is #{score}"