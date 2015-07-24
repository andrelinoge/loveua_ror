class ImagesController < ApplicationController
	def index
	end

	def create
		@image = current_user.build_image(params[:upload])

    respond_to do |format|
      if @imagesave
        format.html {
          render :json => [@image.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@image.to_jq_upload]}, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
	end

end