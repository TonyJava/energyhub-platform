class SiteProject < ApplicationRecord
  belongs_to :site
  belongs_to :project
end
