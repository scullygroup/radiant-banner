class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :location
      t.integer :banner_id
      t.integer :position

      t.timestamps
    end
    
    create_table :banners do |t|
      t.string :title
      t.string :company
      t.string :url
      t.text :body
      t.integer :order
      t.integer :active

      t.timestamps
    end

  end

  def self.down
    drop_table :images
    drop_table :banners
  end
end