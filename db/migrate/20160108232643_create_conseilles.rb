class CreateConseilles < ActiveRecord::Migration
  def change
    create_table :conseilles do |t|
      t.string :nom
      t.string :prenom
      t.references :user, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true
      t.references :transaction, index: true, foreign_key: true
      t.references :litige, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
