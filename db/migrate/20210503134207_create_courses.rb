class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string     :course_title,   null: false
      t.string     :description,    null: false
      t.string     :price,          null: false
      t.datetime   :start_datetime, null: false
      t.datetime   :end_datetime,   null: false
      t.references :chef,       null: false,foreign_key: true
      t.timestamps
    end
  end
end
