# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 
#USER

User.destroy_all

User.create!(username: 'henry')
User.create!(username: 'ienrrry')
User.create!(username: 'jenrrrrry')
User.create!(username: 'kenrrrrrry')
User.create!(username: 'lenrrrrrrrry')
User.create!(username: 'menrrrrrrrrrrry')


#Polls
Poll.destroy_all

Poll.create!(title: 'Educations', author_id: 1)
Poll.create!(title: 'Property', author_id: 2)
Poll.create!(title: 'Career', author_id: 1)
Poll.create!(title: 'Family', author_id: 3)

 
#Questions

Question.destroy_all

Question.create!(body: 'education level?', poll_id: Poll.find_by(title: 'Educations').id )
Question.create!(body: 'What is your major', poll_id: Poll.find_by(title: 'Educations').id )
Question.create!(body: 'SAT score?', poll_id: Poll.find_by(title: 'Educations').id )
Question.create!(body: 'Do you own a car?', poll_id: Poll.find_by(title: 'Property').id )
Question.create!(body: 'Home ownership type?', poll_id: Poll.find_by(title: 'Property').id )
Question.create!(body: 'Are you engineer?', poll_id: Poll.find_by(title: 'Career').id )
Question.create!(body: 'What is your salary?', poll_id: Poll.find_by(title: 'Career').id )
Question.create!(body: 'Last promotion?', poll_id: Poll.find_by(title: 'Career').id )
Question.create!(body: 'Married?', poll_id: Poll.find_by(title: 'Family').id )
Question.create!(body: 'How many childeren?', poll_id: Poll.find_by(title: 'Family').id )
Question.create!(body: 'Do you live with your parents?', poll_id: Poll.find_by(title: 'Family').id )
Question.create!(body: 'How many siblings do you have?', poll_id: Poll.find_by(title: 'Family').id )

AnswerChoice.destroy_all

AnswerChoice.create!(choice_body: 'Ph.D', question_id: Question.find_by(body: 'education level?').id)
AnswerChoice.create!(choice_body: 'Master', question_id: Question.find_by(body: 'education level?').id)
AnswerChoice.create!(choice_body: 'Bachelor', question_id: Question.find_by(body: 'education level?').id)
AnswerChoice.create!(choice_body: 'High School', question_id: Question.find_by(body: 'education level?').id)
AnswerChoice.create!(choice_body: 'Others', question_id: Question.find_by(body: 'education level?').id)
AnswerChoice.create!(choice_body: 'Computer Science', question_id: Question.find_by(body: 'What is your major?').id)
AnswerChoice.create!(choice_body: 'Biology', question_id: Question.find_by(body: 'What is your major?').id)
AnswerChoice.create!(choice_body: 'Geology', question_id: Question.find_by(body: 'What is your major?').id)
AnswerChoice.create!(choice_body: 'Math', question_id: Question.find_by(body: 'What is your major?').id)
AnswerChoice.create!(choice_body: 'Physics', question_id: Question.find_by(body: 'What is your major?').id)
AnswerChoice.create!(choice_body: 'Chemistry', question_id: Question.find_by(body: 'What is your major?').id)
AnswerChoice.create!(choice_body: 'Others', question_id: Question.find_by(body: 'What is your major?').id)

AnswerChoice.create!(choice_body: '2400', question_id: Question.find_by(body: 'SAT score?').id)
AnswerChoice.create!(choice_body: 'over 2200', question_id: Question.find_by(body: 'SAT score?').id)
AnswerChoice.create!(choice_body: 'over 2000', question_id: Question.find_by(body: 'SAT score?').id)
AnswerChoice.create!(choice_body: 'over 1800', question_id: Question.find_by(body: 'SAT score?').id)
AnswerChoice.create!(choice_body: 'below 1800', question_id: Question.find_by(body: 'SAT score?').id)

AnswerChoice.create!(choice_body: 'Yes', question_id: Question.find_by(body: 'Do you own a car?').id)
AnswerChoice.create!(choice_body: 'No', question_id: Question.find_by(body: 'Do you own a car?').id)

AnswerChoice.create!(choice_body: 'Rent', question_id: Question.find_by(body: 'Home ownership type?').id)
AnswerChoice.create!(choice_body: 'Own', question_id: Question.find_by(body: 'Home ownership type?').id)
AnswerChoice.create!(choice_body: 'Homeless', question_id: Question.find_by(body: 'Home ownership type?').id)

AnswerChoice.create!(choice_body: 'Yes', question_id: Question.find_by(body: 'Are you engineer?').id)
AnswerChoice.create!(choice_body: 'No', question_id: Question.find_by(body: 'Are you engineer?').id)

AnswerChoice.create!(choice_body: 'over 200k', question_id: Question.find_by(body: 'What is your salary?').id)
AnswerChoice.create!(choice_body: 'over 150k', question_id: Question.find_by(body: 'What is your salary?').id)
AnswerChoice.create!(choice_body: 'over 100k', question_id: Question.find_by(body: 'What is your salary?').id)
AnswerChoice.create!(choice_body: 'over 80k', question_id: Question.find_by(body: 'What is your salary?').id)
AnswerChoice.create!(choice_body: 'over 50k', question_id: Question.find_by(body: 'What is your salary?').id)
AnswerChoice.create!(choice_body: 'below 50k', question_id: Question.find_by(body: 'What is your salary?').id)

AnswerChoice.create!(choice_body: 'Within a month', question_id: Question.find_by(body: 'Last promotion?').id)
AnswerChoice.create!(choice_body: 'Within two months', question_id: Question.find_by(body: 'Last promotion?').id)
AnswerChoice.create!(choice_body: 'Within six months', question_id: Question.find_by(body: 'Last promotion?').id)
AnswerChoice.create!(choice_body: 'Within a year', question_id: Question.find_by(body: 'Last promotion?').id)
AnswerChoice.create!(choice_body: 'Never', question_id: Question.find_by(body: 'Last promotion?').id)

AnswerChoice.create!(choice_body: 'Yes', question_id: Question.find_by(body: 'Married?').id)
AnswerChoice.create!(choice_body: 'No', question_id: Question.find_by(body: 'Married?').id)

AnswerChoice.create!(choice_body: '0', question_id: Question.find_by(body: 'How many childeren?').id)
AnswerChoice.create!(choice_body: '1', question_id: Question.find_by(body: 'How many childeren?').id)
AnswerChoice.create!(choice_body: '2', question_id: Question.find_by(body: 'How many childeren?').id)
AnswerChoice.create!(choice_body: '3', question_id: Question.find_by(body: 'How many childeren?').id)
AnswerChoice.create!(choice_body: '4', question_id: Question.find_by(body: 'How many childeren?').id)
AnswerChoice.create!(choice_body: 'over 4', question_id: Question.find_by(body: 'How many childeren?').id)

AnswerChoice.create!(choice_body: 'Yes', question_id: Question.find_by(body: 'Do you live with your parents?').id)
AnswerChoice.create!(choice_body: 'No', question_id: Question.find_by(body: 'Do you live with your parents?').id)
AnswerChoice.create!(choice_body: '0', question_id: Question.find_by(body: 'How many siblings do you have?').id)
AnswerChoice.create!(choice_body: '1', question_id: Question.find_by(body: 'How many siblings do you have?').id)
AnswerChoice.create!(choice_body: '2', question_id: Question.find_by(body: 'How many siblings do you have?').id)
AnswerChoice.create!(choice_body: '3', question_id: Question.find_by(body: 'How many siblings do you have?').id)
AnswerChoice.create!(choice_body: 'over 3', question_id: Question.find_by(body: 'How many siblings do you have?').id)

Response.destroy_all
Response.create!(user_id: User.find_by(username: 'henry'), answer_choice_id: 1)
Response.create!(user_id: User.find_by(username: 'ienrrry'), answer_choice_id: 2)
Response.create!(user_id: User.find_by(username: 'jenrrrrry'), answer_choice_id: 3)
Response.create!(user_id: User.find_by(username: 'kenrrrrrry'), answer_choice_id: 4)
Response.create!(user_id: User.find_by(username: 'lenrrrrrrrry'), answer_choice_id: 5)
Response.create!(user_id: User.find_by(username: 'menrrrrrrrrrrry'), answer_choice_id: 6)










