class RelatedProductsHooks < Spree::ThemeSupport::HookListener
  insert_after :product_description, 'products/cross_sell'
end
