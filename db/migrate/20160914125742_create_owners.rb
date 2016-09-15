class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
    	t.column :name, :string, :limit => 255
    	t.timestamps
    end
  end
end
