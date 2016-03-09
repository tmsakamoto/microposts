class AddPrefectureIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :prefcture_id, index: true, foreign_key: true
  end
end
