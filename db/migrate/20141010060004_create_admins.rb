class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.references :user
      t.timestamps
    end
  end
end
