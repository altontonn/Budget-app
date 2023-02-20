class AddEntityToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :entity, null: false, foreign_key: true
  end
end
