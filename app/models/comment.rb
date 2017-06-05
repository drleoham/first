class Comment < ActiveRecord::Base

    belongs_to :post
    belongs_to :user

    validates :content, presence: { message: 'Content is required.'}

end
