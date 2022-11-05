class RemoveEventTypeToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :event_type
  end
end
