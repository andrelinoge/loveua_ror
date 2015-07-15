ActiveAdmin.register User do
  decorate_with UserDecorator

  permit_params :id, :name, :email, :is_email_confirm, :role, :gender,
                profile_attributes: [:mood_id, :zodiak_id, :interesting, :about, :id],
                questionary_attributes: [:city_id, :region_id, :age, :weight, :height, :seek_gender]

  #filter :name
  #filter :region_id, as: :select, collection: Region.all

  index do
    column :id
    column :name
    column :email
    column :role do |user|
      user.is_admin? ? 'Admin' : 'User'
    end
    column :is_email_confirm

    column :region do |user|
      (user.questionary.present? && user.questionary.region.present?) ? user.questionary.region.name : 'Not set'
    end

    column :city do |user|
      (user.questionary.present? && user.questionary.city.present?) ? user.questionary.city.name : 'Not set'
    end

    column :age do |user|
      user.questionary.present? ? user.questionary.age : 'Not set'
    end

    column 'Registered At', :created_at

    actions
  end

  form do |f|
    f.semantic_errors

    f.inputs 'User details' do
      f.input :name, required: true
      f.input :email, required: true
      f.input :role, as: :select, collection: { 'User' => User::ROLE_USER, 'Admin' => User::ROLE_ADMIN}, prompt: 'Role', required: true
      f.input :is_email_confirm
      f.input :gender, as: :select, collection: { 'Male' => User::MALE, 'Female' => User::FEMALE}, prompt: 'Gender', required: true
    end

    f.inputs 'User profile' do
      has_many :profile, new_record: false, allow_destroy: false, heading: false do |p|
        p.input :mood, prompt: 'Mood'
        p.input :zodiak, prompt: 'Zodiak'
        p.input :interesting
        p.input :about
      end
    end

    f.inputs 'User questionary' do
      has_many :questionary, new_record: false, allow_destroy: false, heading: false do |p|
        p.input :height
        p.input :weight
        p.input :age
        p.input :seek_gender, as: :radio, collection: {'Male' => User::MALE, 'Female' => User::FEMALE}
        p.input :region
        p.input :city
      end
    end

    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :is_email_confirm
      row :role 
      row :avatar do
        user.avatar.present? ? (image_tag user.avatar.url) : 'Not set'
      end
    end

    panel "Profile" do
      attributes_table_for user.profile do 
        row :mood
        row :zodiak
        row :about
        row :interesting
      end
    end

    panel "Questionary" do
      attributes_table_for user.questionary.decorate do 
        row :city 
        row :region
        row :age
        row :seek_gender
        row :height
        row :weight
      end
    end

    active_admin_comments
  end

end