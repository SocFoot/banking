class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :in
      t.integer :out
      t.string :libelle
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
