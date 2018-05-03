class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :mission
      t.references :department_head, foreign_key: {to_table: :users}
      t.timestamps
    end

  end
end
