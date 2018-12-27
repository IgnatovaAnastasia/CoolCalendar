class CreatePeopleEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :people_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :category_id
    end
  end
end
