# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  choice_body :text
#  question_id :integer
#

class AnswerChoice < ApplicationRecord
    has_many :responses,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :Response
    
    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question
end
