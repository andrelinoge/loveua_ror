ActiveAdmin.register Zodiak do

  permit_params :name, :css_class
  filter :name
  filter :css_class

  index do
    column :id 
    column :name
    column :css_class
    actions
  end
end