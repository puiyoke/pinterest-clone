class AddTagListPins < ActiveRecord::Migration[5.2]
  def change
    add_column :pins, :tag_list, :string
  end
end
