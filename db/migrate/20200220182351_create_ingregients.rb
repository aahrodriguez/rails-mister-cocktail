class CreateIngregients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingregients do |t|
      t.string :name

      t.timestamps
    end
  end
end
