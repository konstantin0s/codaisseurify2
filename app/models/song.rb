class Song < ApplicationRecord

  belongs_to :artist

 validates :name, presence: true
 validates :artist, presence: true



 scope :order_by_name, -> { order(:name) }

end
