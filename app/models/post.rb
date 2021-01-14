class Post < ApplicationRecord
    belongs_to :user
    validates :title, :content, :user_id, presence: true
    default_scope { order('updated_at DESC')}
end
