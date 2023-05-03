class CreateEnrolmentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolment_requests do |t|
      t.references :student, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
