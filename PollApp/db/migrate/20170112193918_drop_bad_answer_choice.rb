class DropBadAnswerChoice < ActiveRecord::Migration
  def change
    drop_table :answerchoices
  end
end
