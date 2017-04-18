class CreateWordComments < ActiveRecord::Migration
  def change
    # create_join_table :word_comments do |t|
    #   t.index :word_id
    #   t.index :comment_id
    #   t.timestamps
    # end
    create_table :word_comments do |t|
      t.integer :word_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
