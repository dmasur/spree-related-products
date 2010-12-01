module Spree::RelatedProducts::Product
  def self.included(target)
    target.class_eval do
      has_many :product_relations
      has_many :related_products, :through => :product_relations, :class_name => "Product"
    end
  end
end
