class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :text
      t.text :url
      t.integer :time
      t.timestamps
    end
  end
end
