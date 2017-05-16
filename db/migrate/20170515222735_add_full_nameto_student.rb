class AddFullNametoStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :full_name, :string
  end
end
