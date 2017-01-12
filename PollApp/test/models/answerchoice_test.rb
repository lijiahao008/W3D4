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

require 'test_helper'

class AnswerchoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
