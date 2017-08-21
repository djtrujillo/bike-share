class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true

  belongs_to :city

  # def self.count
  #   count
  # end
end