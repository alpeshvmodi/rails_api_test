class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
    	t.column :owner_id, :integer
    	t.column :name, :string, :limit => 255
    	t.column :price, :float, :default => 0
    	t.column :description, :string, :limit => 1000
    	t.timestamps
    end
  end
end
