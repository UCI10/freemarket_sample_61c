# module Common
#   extend ActiveSupport::Concern

#   def set_categories
#     @categories = Category.where(params[:id])
#     @category_children1 = Category.where(parent_id: 1)
#     @category_children2 = Category.where(parent_id: 2)
#        #中略
#     @category_children12 = Category.where(parent_id: 12)
#     @category_children13 = Category.where(parent_id: 13)
#   end

    # @parents = Category.where(:ancestory: nil)

#  end