class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      # t.belongs_to :word_comment
      t.timestamps
    end
  end
end
