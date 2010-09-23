class AddProductRelations < ActiveRecord::Migration
  def self.up
    create_table :product_relations  do |t|
      t.references :product
      t.references :related_product
    end
  end

  def self.down
    drop_table :product_relations
  end
end