class CreateWordComments < ActiveRecord::Migration
  def change
    create_table :word_comments do |t|
      t.integer :word_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
