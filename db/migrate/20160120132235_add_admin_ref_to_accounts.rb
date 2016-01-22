class AddAdminRefToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :admin, index: true, foreign_key: true
  end
end
