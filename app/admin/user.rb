ActiveAdmin.register User do
  decorate_with UserDecorator

  permit_params :id, :first_name, :last_name, :avatar, :email, :is_email_confirm, :role, :gender,
                profile_attributes: [:mood_id, :zodiak_id, :interesting, :about, :id],
                questionary_attributes: [:city_id, :region_id, :age, :weight, :height, :seek_gender]

  filter :id, as: :numeric
  filter :first_name, as: :string
  filter :last_name, as: :string
  filter :role, as: :select, collection: User.roles.except(:guest)
  filter :gender, as: :select, collection: User.genders
  #filter :region_id, as: :select, collection: Region.all

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :gender
    column :role

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

  form html: { multipart: true } do |f|
    f.semantic_errors

    f.inputs 'User details' do
      f.input :avatar, as: :file, hint: f.object.avatar.present? ? image_tag(f.object.avatar.small_thumb.url) : 'no avatar yet'
      f.input :first_name, required: true
      f.input :last_name, required: true
      f.input :email, required: true
      f.input :role, as: :select, collection: User.roles.except(:guest).keys, prompt: 'Role', required: true
      f.input :gender, as: :select, collection: User.genders.keys, prompt: 'Gender', required: true
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
        p.input :seek_gender, as: :radio, collection: {'Male' => User::GENDER_MALE, 'Female' => User::GENDER_FEMALE}
        p.input :region
        p.input :city
      end
    end

    actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :role 
      row :gender
      row :avatar do
        user.avatar.present? ? (image_tag user.avatar.small_thumb.url) : 'Not set'
      end
      row :last_sign_in_at
      row 'Registered' do
        resource.created_at
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