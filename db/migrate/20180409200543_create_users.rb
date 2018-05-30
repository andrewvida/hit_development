class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :title
      t.references :department, foreign_key: true
      t.boolean :department_head, default: false
      t.text :bio, default: ''
      t.string :photo_url, default: 'https://robohash.org/hendrick'
      t.string :slack_username
      t.timestamps
    end
  end
end
