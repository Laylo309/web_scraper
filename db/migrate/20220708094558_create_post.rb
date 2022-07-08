class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.date :created_time

      t.timestamps
    end
  end
end
