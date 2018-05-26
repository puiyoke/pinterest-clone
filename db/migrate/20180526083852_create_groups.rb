class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
    t.timestamps null: false
    t.belongs_to :board, index: true
    t.belongs_to :pin, index: true
    end
  end
end
