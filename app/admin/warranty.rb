ActiveAdmin.register Warranty do
  permit_params :product_id, :purchase_date, :duration, :lifetime, :details, :document

  index do
    selectable_column
    id_column
    column :product
    column :purchase_date
    column :duration
    column :lifetime
    column :end_date
    column :details
    column :document
    column :expired
    default_actions
  end

  show do
    attributes_table do
      row :product
      row :purchase_date
      row :duration
      row :lifetime
      row :end_date
      row :details
      row :document
    end
  end

  active_admin_import :validate => false,
                            :timestamps => true,
                            :csv_options => {:col_sep => ";" },
                            :before_import => proc{ Warranty.delete_all}

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
