class CreateErpElectricalBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_electrical_blogs do |t|
      t.string :image
      t.string :name
      t.string :title
      t.text :content
      t.string :short_description
      t.string :meta_keywords
      t.string :meta_description
      t.string :tags
      t.string :alias
      t.text :cache_search
      t.integer :custom_order
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end