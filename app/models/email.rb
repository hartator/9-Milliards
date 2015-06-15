class Email
  include Mongoid::Document

  field :email

  scope :not_blank, -> { where(:email.nin => ["", nil]) }
end
