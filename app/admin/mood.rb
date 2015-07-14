ActiveAdmin.register Mood do

  permit_params :name
  filter :name

  form do |f|
    semantic_errors

    inputs do 
      input :name, required: true, placeholder: 'enter mood`s name'
    end

    actions
  end

  index do
    column :id
    column :name
    actions
  end

end