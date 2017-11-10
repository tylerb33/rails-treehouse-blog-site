class PagesController < ApplicationController
	# When running the 'show', 'edit', 'update' & 'destroy' methods, we will always need to run the ".find(:id)" in order to find the appropriate page to manipulate. The below before_action runs that method before each of these methods.
	before_action :set_page, only: [:show, :edit, :update, :destroy]

	def index
		@pages = Page.all
	end

	def show
	end

	def new
		@page = Page.new
	end

	def create
		@page = Page.new(page_params)
		@page.save
		redirect_to @page
	end

	def edit
	end

	def update
		@page.update(page_params)
		redirect_to @page
	end

	def destroy
		@page.destroy
		redirect_to pages_path
	end

	private

		def page_params
			params.require(:page).permit(:title, :body, :slug)
		end

		def set_page
			@page = Page.find(params[:id])
		end
end
