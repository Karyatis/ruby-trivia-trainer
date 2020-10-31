require 'json'

module Round


  data = File.read("data.json")

  questions_array = JSON.parse(data)


	#Pick 10 random questions
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

	p round_data
end