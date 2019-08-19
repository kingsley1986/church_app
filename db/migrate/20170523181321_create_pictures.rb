class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :picturable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
