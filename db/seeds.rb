# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(email: 'cerickbrower@gmail.com')

exam = Exam.create(title: "Awesome test exam", user: user)

question1 = Question.create(text: "What is your favorite color?", exam: exam)
question2 = Question.create(text: "What is the square root of 4?", exam: exam)
question3 = Question.create(text: "Who is the president of the US?", exam: exam)

answer11 = Answer.create(text: "blue", question: question1)
answer12 = Answer.create(text: "green", question: question1)
answer13 = Answer.create(text: "black", question: question1, correct: true)
answer14 = Answer.create(text: "red", question: question1)

answer21 = Answer.create(text: "1", question: question2)
answer22 = Answer.create(text: "5", question: question2)
answer23 = Answer.create(text: "4", question: question2)
answer24 = Answer.create(text: "2", question: question2, correct: true)

answer31 = Answer.create(text: "Tyler Durden", question: question3)
answer32 = Answer.create(text: "Hillary Clinton", question: question3)
answer33 = Answer.create(text: "Tom Bombadil", question: question3)
answer34 = Answer.create(text: "Donald Trump", question: question3, correct: true)
