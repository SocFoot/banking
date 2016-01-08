class CreateEpargneTypes < ActiveRecord::Migration
  def change
    create_table :epargne_types do |t|
      t.string :nom
      t.references :epargne, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
