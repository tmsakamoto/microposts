class RemovePrefectureIdToUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :prefecture_id, index: true, foreign_key: true
  end
end
