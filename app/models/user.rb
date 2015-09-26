class User < ActiveRecord::Base
  has_one :investment
end
