class AddPrimaryKey < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :string
    remove_column :categories, :timestamps
  end
end
