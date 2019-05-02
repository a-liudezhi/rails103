class Post < ApplicationRecord
belongs_to :user
belongs_to :group
scope :recent, -> { order("created_at DESC")}

end
