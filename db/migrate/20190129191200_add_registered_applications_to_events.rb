class AddRegisteredApplicationsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :registered_application_id, :integer
    add_index :events, :registered_application_id
  end
end
