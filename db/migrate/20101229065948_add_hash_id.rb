class AddHashId < ActiveRecord::Migration
  def self.up
    add_column :list_items, :hash_item, :string
  end

  def self.down
    remove_column :list_items, :hash_item
  end
end
