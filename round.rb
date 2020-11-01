module Round

	def round_data(questions_array)
		round_questions = []
		round_questions << questions_array.sample(10)
		round_questions = round_questions.flatten
		round_data = round_questions.map {|question| [question["question"], question["incorrect"], question["correct"]]}
	end

	def questions(round_data)
		questions = []
		round_data.each do |q|
			questions << q[0]
		end
		questions
	end
  
	def potential_answers(round_data)
		potential_answers = []
		round_data.each do |q|
			new_question = q[1] << q[2] 
			potential_answers << new_question.shuffle
		end
		potential_answers
	end

	def correct_answers(round_data)
		correct_answers = []
		round_data.each do |q|
			correct_answers << q.last.downcase
		end
		correct_answers
	end

	def score_text(score)
	 if score >= 8
	    puts "Good job!"
	    puts "Your score is #{score}"
	  else
	    puts "Better luck next time!"
	    puts "Your score is #{score}"
	  end
	end 
end