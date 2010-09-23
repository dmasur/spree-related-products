# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class RelatedProductsExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/related_products"

  # Please use related_products/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    Product.send(:include, Spree::RelatedProducts::Product)
  end
end
