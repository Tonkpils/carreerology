class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
