require 'json'

module JsonParser

  data = File.read("data.json")

  questions_array = JSON.parse(data)
end
