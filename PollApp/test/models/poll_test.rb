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

require 'test_helper'

class PollTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
