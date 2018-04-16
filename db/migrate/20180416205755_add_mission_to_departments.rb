class AddMissionToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :mission, :text
  end
end
