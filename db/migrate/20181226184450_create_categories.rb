class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
