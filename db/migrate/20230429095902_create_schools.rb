class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
