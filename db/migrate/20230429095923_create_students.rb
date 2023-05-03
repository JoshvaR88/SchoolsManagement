class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :unique
      t.string :phone_number
      t.references :batch, null: false, foreign_key: true
      t.string :enrolment_status, default: 'pending'

      t.timestamps
    end
  end
end
