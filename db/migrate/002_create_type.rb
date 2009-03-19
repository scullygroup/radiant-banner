class CreateType < ActiveRecord::Migration
  def self.up
    add_column :images, :placement, :string
  end

  def self.down
    remove_column :images, :placement
  end
end
