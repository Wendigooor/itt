class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.inet :ip
      t.references :user
      t.float :average_ratio, precision: 2, scale: 2

      t.timestamps
    end
  end
end
