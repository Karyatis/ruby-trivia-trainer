require 'json'

data = File.read("data.json")

questions_array = JSON.parse(data)

round_questions = []

round_questions << questions_array.sample(10)

round_questions = round_questions.flatten
  
round = round_questions.map  {|question| [question["question"], question["incorrect"], question["correct"]]}

p round.class
