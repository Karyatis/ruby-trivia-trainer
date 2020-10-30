require 'json'
include Parser
include Round

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