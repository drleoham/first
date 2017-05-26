class Post < ActiveRecord::Base

    has_many :comments
    belongs_to :user

    validates :title, presence: { message: 'A title is required.' }
end
