class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :content
      t.string :picture
      t.string :string

      t.timestamps null: false
    end
	add_index :talks, :from_id
	add_index :talks, :to_id
  end
end
