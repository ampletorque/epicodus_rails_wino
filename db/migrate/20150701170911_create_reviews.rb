class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.column :description, :string
      t.column :rating, :integer
      t.column :user, :string
      t.column :wine_id, :integer

      t.timestamps
    end
  end
end
