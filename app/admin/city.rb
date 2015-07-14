ActiveAdmin.register City do

  permit_params :name, :region_id

  filter :name
  filter :region_id, as: :select, collection: Region.all

  index do
    column :id
    column :name
    column :region_id do |city|
      city.region.present? ? city.region.name : 'Not specified'
    end

    actions
  end

  form do |f|
    semantic_errors

    inputs do
      input :name, required: true, placeholder: 'enter city`s name'
      input :region, required: true, prompt: 'select region'
    end

    actions
  end

end