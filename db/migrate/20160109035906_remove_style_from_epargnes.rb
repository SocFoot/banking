class RemoveStyleFromEpargnes < ActiveRecord::Migration
  def change
    remove_column :epargnes, :style, :string
  end
end
