class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :summary
      t.text :body
      t.references :department, foreign_key: true
      t.references :post_type, foreign_key: true
      t.references :author, foreign_key: {to_table: :users}
      t.integer :post_type
      t.string :image_url
      t.string :action_url
      t.datetime :expiration_date, default: nil
      t.timestamps
    end
  end
end
