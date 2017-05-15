class AddConfirmedToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :confirmed, :boolean
  end
end
