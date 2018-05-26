class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.timestamps null: false
      t.belongs_to :user, index: true
      t.string :image
      t.string :title
      t.string :description
    end
  end
end
