class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :owner_id
      t.integer :other_id

      t.timestamps null: false
    end
	add_index :logs, :owner_id
	add_index :logs, :other_id    
  end
end
