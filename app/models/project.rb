class Project < ActiveRecord::Base
  has_many :favs, foreign_key: "project_id"
end
