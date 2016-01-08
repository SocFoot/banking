class AddReceiveToEpargne < ActiveRecord::Migration
  def change
    add_column :epargnes, :receive, :boolean
  end
end
