class CreateLessions < ActiveRecord::Migration
  def change
    create_table :lessions do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :result

      t.timestamps null: false
    end
  end
end
