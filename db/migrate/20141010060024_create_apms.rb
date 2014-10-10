class CreateApms < ActiveRecord::Migration
  def change
    create_table :apms do |t|
      t.integer :user_id
      t.references :admin
      t.timestamps
    end
  end
end
