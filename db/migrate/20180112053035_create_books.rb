class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books, id: false do |t|
      t.string :uuid,  null: false
      t.string :title
      t.string :author
      t.datetime :published_date
      t.boolean :is_active
      t.integer :count

      t.timestamps
    end

    add_index :books, :uuid, unique: true
  end
end
