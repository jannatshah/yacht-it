class YachtsChangeDescriptionType < ActiveRecord::Migration[5.2]
  def change
    change_column(:yachts, :description, :text)
  end
end
