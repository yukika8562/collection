class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :content
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
