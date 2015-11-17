class AddWordIdToWordanswers < ActiveRecord::Migration
  def change
  	add_column :wordanswers, :word_id, :integer 
  end
end
