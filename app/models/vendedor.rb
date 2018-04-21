class Vendedor < ApplicationRecord

  belongs_to :personas, dependent :destroy 

  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :foto, :content_type => /\Aimage\/.*\Z/

  validates :numero, presence: true
  validates :fecha_alta, presence: true
end
