class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :mark
      t.references :post

      t.timestamps
    end
  end
end
