class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user,  foreign_key: true
      t.references :micropost, foreign_key: true

      t.timestamps null: false
      t.index [:user_id, :micropost_id], unique: true
    end
  end
end
