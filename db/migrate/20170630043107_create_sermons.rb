class CreateSermons < ActiveRecord::Migration[5.2]
  def change
    create_table :sermons do |t|
      t.string :title
      t.text :body
      t.string :preacher

      t.timestamps null: false
    end
  end
end
