class FixColName < ActiveRecord::Migration
  def change
    rename_column :litiges, :transaction_id_id, :transaction_id
  end
end
