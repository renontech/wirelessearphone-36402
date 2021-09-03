class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,    null: false, unique: true
      t.integer :price,   null: false
      t.string  :maker,   null: false
      t.string  :driver
      t.string  :anc
      t.string  :ambient
      t.string  :bluetooth
      t.string  :weight
      t.string  :codec
      t.date    :date

      t.timestamps
    end
  end
end
