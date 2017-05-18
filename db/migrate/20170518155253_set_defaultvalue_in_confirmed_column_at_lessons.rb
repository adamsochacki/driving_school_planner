class SetDefaultvalueInConfirmedColumnAtLessons < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:lessons, :confirmed, false)
  end
end
