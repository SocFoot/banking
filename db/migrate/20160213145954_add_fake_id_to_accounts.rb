class AddFakeIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :fake_id, :integer
    add_index :accounts, :fake_id
  end
end
