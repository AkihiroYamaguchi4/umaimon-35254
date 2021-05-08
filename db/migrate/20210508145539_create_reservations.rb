class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :user_phone_number, null: false
      t.string :allergies,         null: false
      t.string :place,             null: false
      t.string :guests,             null: false
      t.string :request
      t.references :user,          null: false,foreign_key: true
      t.references :course,        null: false,foreign_key: true
      t.timestamps
    end
  end
end
