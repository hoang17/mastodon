class MoreFasterIndexOnNotifications < ActiveRecord::Migration[5.1]
  def change
    commit_db_transaction
    add_index :notifications, [:account_id, :id], order: { id: :desc }, algorithm: :concurrently
    remove_index :notifications, name: :index_notifications_on_id_and_account_id_and_activity_type
  end
end
