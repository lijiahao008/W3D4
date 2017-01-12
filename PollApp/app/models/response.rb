# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#
require 'byebug'

class Response < ActiveRecord::Base
  validates :answer_choice_id, presence: true
  validates :user_id, presence: true
  validate :respondent_already_answered?
  validate :author_cant_respond?

  belongs_to(:answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: "AnswerChoice"
  )

  belongs_to(:respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )

  has_one(:question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    question.responses.where.not(id: id)
  end

  def check_for_respondent
    self.sibling_responses.all? do |response|
      response.respondent.id != respondent.id
    end
  end




  private
  def respondent_already_answered?

    unless check_for_respondent
      errors[:base] << "You already answered this poll!"
    end

  end

  def author_cant_respond?
    if self.question.poll.author.id == respondent.id
      errors[:base] << "You can't respond to your own poll!"
    end
  end
end
