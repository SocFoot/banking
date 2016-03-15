class RemoveUserIdAndAccountdAndTransactionIdAnditigeIdFromConseille < ActiveRecord::Migration
  def change
    remove_column :conseilles, :user_id, :integer
    remove_column :conseilles, :account_id, :integer
    remove_column :conseilles, :transaction_id, :integer
    remove_column :conseilles, :litige_id, :integer
  end
end
