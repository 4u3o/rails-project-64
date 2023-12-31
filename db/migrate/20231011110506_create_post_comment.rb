class CreatePostComment < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.text :content, null: false
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      if Rails.env.production?
        t.string :ancestry, collation: 'C'
      else
        t.string :ancestry
      end

      t.timestamps
    end
    add_index :post_comments, :ancestry
  end
end
