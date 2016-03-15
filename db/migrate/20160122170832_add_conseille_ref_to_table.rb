class AddConseilleRefToTable < ActiveRecord::Migration
  def change
    add_reference :litiges, :conseille, index: true, foreign_key: true
    add_reference :transactions, :conseille, index: true, foreign_key: true
    add_reference :epargnes, :conseille, index: true, foreign_key: true
    add_reference :accounts, :conseille, index: true, foreign_key: true
    add_reference :users, :conseille, index: true, foreign_key: true
  end
end
