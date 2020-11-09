class AddColumnToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :author_id, :integer, index: true, foreign_key: true
  end
end
