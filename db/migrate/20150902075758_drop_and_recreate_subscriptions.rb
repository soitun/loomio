class DropAndRecreateSubscriptions < ActiveRecord::Migration
  def change
    drop_table :subscriptions
    create_table :subscriptions do |t|
      t.integer :group_id
      t.string :kind
      t.date :expires_on
      t.jsonb :chargify_response
    end

    add_index :subscriptions, :group_id
    add_index :subscriptions, :kind
  end
end
