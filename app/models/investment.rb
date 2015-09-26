class Investment < ActiveRecord::Base
  belongs_to :user
  has_many :favs
  accepts_nested_attributes_for :favs, allow_destroy: true


end
