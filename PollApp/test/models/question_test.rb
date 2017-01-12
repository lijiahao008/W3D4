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

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
