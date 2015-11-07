class CreateWordanswers < ActiveRecord::Migration
  def change
    create_table :wordanswers do |t|
      t.string :content
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
