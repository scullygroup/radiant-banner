class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :banner_images do |t|
      t.integer   :banner_id
      t.integer   :position
      t.string    :placement
      t.string    :ad_file_name
      t.string    :ad_content_type
      t.integer   :ad_file_size
      t.datetime  :ad_updated_at

      t.timestamps
    end
    
    create_table :banners do |t|
      t.string  :title
      t.string  :company
      t.string  :url
      t.integer :active

      t.timestamps
    end

  end

  def self.down
    drop_table :banner_images
    drop_table :banners
  end
end