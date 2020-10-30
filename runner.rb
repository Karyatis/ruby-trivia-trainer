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

i = 0
until i == 10
	p questions[i]
  puts potential_answers[i]
  i += 1
end
