class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.string :amount
      t.text :descrition

      t.timestamps
    end
  end
end
