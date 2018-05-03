class CreateEditPermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :edit_permissions do |t|
      t.references :user, foreign_key: true
      t.references :department, foreign_key: true
      t.references :post_type, foreign_key: true
      t.timestamps
    end
  end
end
