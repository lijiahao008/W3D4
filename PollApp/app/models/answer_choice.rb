# == Schema Information
#
# Table name: answerchoices
#
#  id          :integer          not null, primary key
#  body        :text             not null
#  question_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class AnswerChoice < ActiveRecord::Base
  validates :body, presence: true
  validates :question_id, presence: true

  belongs_to(:question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: "Question"
  )

  has_many(:responses,
    primary_key: :id,
    class_name: "Response"
  )
end
