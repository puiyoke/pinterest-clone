class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.timestamps null: false
      t.string :name
    end
  end
end
