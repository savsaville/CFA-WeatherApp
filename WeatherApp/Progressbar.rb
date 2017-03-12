require 'paint'
require 'terminal-table'
require_relative 'questionmaster.rb'

# Questions
questions = [
	"What was the temperature on Monday?",
	"What was the temperature on Tuesday?",
	"What was the temperature on Wednesday?",
	"What was the temperature on Thursday?",
	"What was the temperature on Friday?",
	"What was the temperature on Saturday?",
	"What was the temperature on Sunday?",
]
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

# Convert each answer to far and append
# in new array
def convertFar(answers)
	faren = []
	answers.each do |answer|
		faren << answer * 1.8 + 32
	end
	faren
end

# Append colour to new
# colours array
def get_colour(temps)
	colours = []
	temps.each do |temp|
		if temp <= 15
			colours << :blue
		elsif temp <= 28
			colours << :green
		elsif temp >= 29
			colours << :red
		end
	end
	colours
end

# Create new questionnaire and progress bar
tempQuiz = Questionmaster.new(questions)
prog1 = Progress.new('Quiz')

# Store celcius, far and colour in array
celcius = tempQuiz.askQuestions(prog1)
fahren = convertFar(celcius)
colour = get_colour(celcius)

#clear terminal before outputting table
system "clear"

# Assign variables in table
table = Terminal::Table.new :title => "Weekly weather", :headings => ['Day', 'Celcius', 'Fahrenheit'] do |t|
	# Loop through
		# Add days of week, celcius with colour and fahrenheit
	i = 0
	until i == 7 do
		t.add_row [days[i], Paint[celcius[i], colour[i], :bright], fahren[i]]
		if i <= 5
			t.add_separator
		end
		i += 1
	end
end

# Output table
puts table
