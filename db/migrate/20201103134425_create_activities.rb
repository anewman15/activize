class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name, null: false, default: ""
      t.string :amount, null: false, default: ""
      t.references :author, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
