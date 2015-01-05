ActiveAdmin.register Club do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

    form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :url
        f.input :active
        f.fields_for :address do |info|
          info.input :street
          info.input :city
          info.input :postal_code
          info.input :house_number
          #info.input :country
        end
      end
     f.actions
    end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
