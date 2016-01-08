class CreateLitiges < ActiveRecord::Migration
  def change
    create_table :litiges do |t|
      t.string :identifiant
      t.string :status
      t.string :motif
      t.references :transaction_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
