class Picture < ApplicationRecord
  belongs_to :album
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  paginates_per 10
  acts_as_taggable_on :tags
  has_many :comments
  
end
