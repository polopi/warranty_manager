ActiveAdmin.register Category do
  permit_params :title

  sidebar "Products", only: [:show, :edit] do
    unless category.products.empty?
      ul do
        category.products.each do |p|
          li link_to p.name, admin_product_path(p)
        end
      end
    end
    link_to "New product", new_admin_product_path
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
