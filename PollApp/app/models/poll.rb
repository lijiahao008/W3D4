# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer          not null
#

class Poll < ActiveRecord::Base
  validates :title, presence: true
  validates :author_id, presence: true

  belongs_to(:author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: "User"
  )

  has_many(:questions,
    primary_key: :id,
    class_name: "Question"
  )
end
