class Fav < ActiveRecord::Base
  belongs_to :investment
  belongs_to :project, foreign_key: "code"
end