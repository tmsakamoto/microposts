class AddPrefectureToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :prefecture, index: true, foreign_key: true
  end
end
