module Api
  module V1
    class BlogsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_blog, only: %i[update show destroy]

      def index
        @blogs = params[:search].present? ? Blog.search(params[:search]) : Blog.all
        render json: { blogs: @blogs.as_json, success: true }, status: :ok
      end

      def create
        @blog = current_user.blogs.create(blog_params)
        if @blog.save
          render json: { blog: @blog.as_json, success: true }, status: :ok
        else
          render json: { blog: @blog.errors.full_messages, success: false }, status: 422
        end
      end

      def update
        if @blog.update(blog_params)
          render json: @blog.as_json, status: 201
        else
          render json: { errors: @blog.errors.full_messages }, status: 422
        end
      end

      def show
        render json: { blog: @blog.as_json }, status: :ok
      end

      def destroy
        @blog.destroy
        render json: { message: 'Blog deleted successfully.' }, status: :ok
      end


      private

      def blog_params
        params.require(:blog).permit(*Blog::ATTRIBUTES_WHITELIST)
      end

      def find_blog
        @blog = Blog.find(params[:id])
      end
    end
  end
end
