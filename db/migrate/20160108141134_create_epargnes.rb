class CreateEpargnes < ActiveRecord::Migration
  def change
    create_table :epargnes do |t|
      t.string :style
      t.string :libelle
      t.decimal :rate, precision: 4, scale: 2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
