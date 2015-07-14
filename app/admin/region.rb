ActiveAdmin.register Region do
  permit_params :name
  filter :name

  form do |f|
    semantic_errors

    inputs do 
      input :name, required: true, placeholder: 'enter region`s name'
    end

    actions
  end

  index do
    column :id
    column :name
    actions
  end
end