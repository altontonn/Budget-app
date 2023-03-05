class CreateGroupTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :group_transactions do |t|

      t.timestamps
    end
  end
end
