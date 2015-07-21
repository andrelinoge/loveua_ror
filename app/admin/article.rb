ActiveAdmin.register Article do

	permit_params :title, :cover, :content, :cover_cache
	filter :title, as: :string

	index do
		column :id
		column :title
		column :content do |article|
			truncate(article.content, length: 200, escape: false)
		end
		column :created_at

		actions
	end

	show do |model|
		attributes_table do
			row :cover do
				image_tag(model.cover.url)
			end
			row :title
			row :content
		end
	end

	form html: { multipart: true } do |f|
		f.semantic_errors

		f.inputs do 
			f.input :cover, as: :file
			f.input :cover_cache, as: :hidden
			f.input :title
			f.input :content
		end

		f.actions
	end

end