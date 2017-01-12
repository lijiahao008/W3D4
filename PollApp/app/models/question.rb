# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :poll_id, presence: true

  has_many(:answer_choices,
    primary_key: :id,
    class_name: "AnswerChoice"
  )

  belongs_to(:poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: "Poll"
  )

  has_many(:responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    result_count = Hash.new(0)
    choices = answer_choices.includes(:responses)

    choices.each do |choice|
      result_count[choice.body] = choice.responses.length
    end

    result_count
  end

  SELECT
    answer_choices.body, COUNT(responses.*)
  FROM
    answer_choices
  LEFT OUTER JOIN
    responses
    ON answer_choices.id = responses.answer_choice_id
  GROUP BY
    answer_choices.id
  HAVING
    COUNT(responses.*) > 0

end
