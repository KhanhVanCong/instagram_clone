class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :follower, index: true, foreign_key: { to_table: :users }
      t.references :followed, index: true, foreign_key: { to_table: :users }
      t.boolean :accepted, default: false

      t.timestamps
    end
    add_index :follows, [:follower_id, :followed_id], unique: true
  end
end
