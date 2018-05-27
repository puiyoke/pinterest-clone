class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.timestamps null: false
      t.belongs_to :tag, index: true
      t.belongs_to :pin, index: true
    end
  end
end
