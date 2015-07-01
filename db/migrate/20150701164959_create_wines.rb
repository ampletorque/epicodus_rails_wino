class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.column :name, :string
      t.column :year, :integer
      t.column :grapes, :string
      t.column :label, :string
      t.column :winery, :string
      
    end
  end
end
