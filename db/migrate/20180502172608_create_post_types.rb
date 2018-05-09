class CreatePostTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_types do |t|
      t.string :name
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
