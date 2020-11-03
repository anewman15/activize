class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :amount
      t.integer :author_id, index: true, foreign_key: true
      t.integer :group_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
