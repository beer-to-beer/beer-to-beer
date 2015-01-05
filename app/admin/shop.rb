ActiveAdmin.register Shop do

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.fields_for :address do |info|
        info.input :street
        info.input :city
        info.input :postal_code
        info.input :house_number
        into.input :country
      end
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
