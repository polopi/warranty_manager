ActiveAdmin.register Product do
  permit_params :name, :description, :category_id, warranty_attributes: [:id, :purchase_date, :duration, :lifetime, :details, :document, :product_id]

  form do |f|
    f.inputs 'Details' do
      f.input :category
      f.input :name
      f.input :description
    end
    f.inputs "Warranty", for: [:warranty, f.object.warranty || Warranty.new] do |w|
      w.input :purchase_date, as: :datepicker, datepicker_options: { min_date: 3.years.ago.to_date, max_date: DateTime.now.to_date }
      w.input :duration, :label => "Duration (months)"
      w.input :lifetime
      w.input :details
      w.input :document, :as => :file, :hint => w.object.document.url
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :category
    column :name
    column :description
    column :warranty
    default_actions
  end

  show do
    attributes_table do
      row :category
      row :name
      row :description
    end
    panel "Warranty" do
      if product.warranty
        table_for product.warranty do
          column :purchase_date
          column :duration
          column :lifetime
          column :end_date
          column :document
        end
      else
        link_to "New warranty", new_admin_warranty_path
      end
    end
  end

  active_admin_import :validate => false,
                            :timestamps => true,
                            :csv_options => {:col_sep => ";" },
                            :before_import => proc{ Product.delete_all}

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
