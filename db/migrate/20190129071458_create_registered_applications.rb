class CreateRegisteredApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
