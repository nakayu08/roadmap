class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string     :title        , null: false
      t.text       :explanation  , null: false
      t.time   :start_time   , null: false
      t.time   :end_time     , null: false
      t.integer    :category_id  , null: false
      t.integer    :condition_id , null: false
      t.timestamps
    end
  end
end
