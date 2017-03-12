class Questionmaster
	def initialize(questions)
		@questions = questions
		@answers = []
	end

	attr_accessor :questions

	# ask questions method
	def askQuestions(progress)
		@questions.each do |question|
			system "clear"
			# Display question counter
			puts "Question #{progress.counter}"
			puts question
			response = gets.chomp.to_i
			# append answers in @answers array
			@answers << response
			progress.increment
		end
		# Return answers
		@answers
	end
end

class Progress
	def initialize(title)
		@title = title
		@counter = 1
	end

	attr_accessor :title, :counter

	def increment
		@counter += 1
	end
end
