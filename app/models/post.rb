class Post
  include Mongoid::Document
  field :link_url, type: String
  field :title, type: String
  field :points, type: Integer, default: 1
  belongs_to :user

  validates :link_url, presence: true, allow_blank: false, uniqueness: true
  validates :title, presence: true, allow_blank: false
end
