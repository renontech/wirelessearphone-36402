class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,    null: false
      t.integer :price,   null: false
      t.string  :maker,   null: false
      t.string  :sound
      t.string  :anc
      t.string  :ambient
      t.string  :type
      t.string  :size
      t.string  :codec

      t.timestamps
    end
  end
end
