namespace :spree do
  namespace :extensions do
    namespace :related_products do
      desc "Finds Related Products."
      task :find_relations => :environment do
        orders = {}
        LineItem.all.each do |line_item|
          line_item.quantity.times do
            orders[line_item.order_id] ||= []
            orders[line_item.order_id] << line_item.variant.product
          end
        end
        products = {}
        orders.each do |_, product_ids|
          product_ids.each do |product_id|
            products[product_id] ||= []
            products[product_id] += product_ids - [product_id]
          end
        end
        products.delete_if{|product| product.empty?}
        products.each do |product, coss_sell_products|
          product.related_products = coss_sell_products
          product.save
        end
      end
      desc "Copies public assets of the Related Products to the instance public/ directory."
      task :update => :environment do
        is_svn_git_or_dir = proc {|path| path =~ /\.svn/ || path =~ /\.git/ || File.directory?(path) }
        Dir[RelatedProductsExtension.root + "/public/**/*"].reject(&is_svn_git_or_dir).each do |file|
          path = file.sub(RelatedProductsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end
    end
  end
end
