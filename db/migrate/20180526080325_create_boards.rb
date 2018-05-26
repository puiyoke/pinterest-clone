class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.timestamps null: false
      t.belongs_to :user, index: true
      t.string :title
      t.string :description
    end
  end
end
