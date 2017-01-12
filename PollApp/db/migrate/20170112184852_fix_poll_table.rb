class FixPollTable < ActiveRecord::Migration
  def change
    remove_column :polls, :author
  
  end
end
