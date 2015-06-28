class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :link
      t.text :description

      t.timestamps null: false
    end
  end
end
