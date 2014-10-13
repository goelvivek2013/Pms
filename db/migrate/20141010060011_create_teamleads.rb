class CreateTeamleads < ActiveRecord::Migration
  def change
    create_table :teamleads do |t|
      t.references :user
      t.references :apm
      t.timestamps
    end
  end
end
