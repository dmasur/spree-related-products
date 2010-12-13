class SpreeRelatedProductsHooks < Spree::ThemeSupport::HookListener
  insert_after :product_properties, 'products/cross_sell'
end