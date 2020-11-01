require_relative 'round'  
require 'json'
include Round

  data = File.read("data.json")

  data_array = JSON.parse(data)

  question_selection = round_data(data_array)

  questions = questions(question_selection)
  potential_answers = potential_answers(question_selection)
  correct_answers = correct_answers(question_selection)

  puts "Let's get started!"
  puts "For each question, type your answer"
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

  puts "Ready for your score?"
  sleep(0.8)
  
  score_text(score)
