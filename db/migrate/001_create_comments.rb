class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :created_utc
      t.string :author
      t.timestamps
    end
  end
end
