class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :body
      t.string :page_type

      t.timestamps null: false
    end
  end
end
