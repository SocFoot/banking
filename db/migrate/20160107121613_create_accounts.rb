class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :zip, limit:16
      t.string :libelle

      t.timestamps null: false
    end
  end
end
