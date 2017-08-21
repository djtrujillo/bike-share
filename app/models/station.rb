class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true

  belongs_to :city

# This method is not needed, shorte to just use #count
  # def self.total
  #   Station.all.count
  # end

  def self.average_count
    Station.average(:dock_count).round
  end

  def self.max_station
    Station.where(:dock_count => Station.maximum('dock_count')).first
  end
end