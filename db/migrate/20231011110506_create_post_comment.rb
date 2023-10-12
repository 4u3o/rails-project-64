class CreatePostComment < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.text :content, null: false
      t.references :post, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: {to_table: :users}

      if Rails.env.production?
        t.string :ancestry, collation: 'C', null: false
      else
        t.string :ancestry, null: false
      end

      t.timestamps
    end
    add_index :post_comments, :ancestry
  end
end
