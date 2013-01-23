class AddIsDescriptionToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :is_description, :boolean
  end
end
