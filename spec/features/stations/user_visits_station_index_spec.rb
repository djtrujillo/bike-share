RSpec.describe "User visits '/stations'" do
  before :all do
    start_date = DateTime.new(2001,2,3,4,5)
    end_date = DateTime.new(2001,3,3,4,5)
    installation_date = DateTime.new(2001,1,1,1,1)
    City.create(name: "Redwood City")
    City.create(name: "San Francisco")
    City.create(name: "Palo Alto")
    City.create(name: "Mountain View")
    City.create(name: "San Jose")
    Trip.create(duration: 10, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 94103, subscription_type: "Subscriber", start_date: start_date, end_date: end_date)
    Trip.create(duration: 15, start_station_id: 2, end_station_id: 2, bike_id: 318, zip_code: 97214, subscription_type: "Subscriber", start_date: start_date, end_date: end_date)
    Trip.create(duration: 20, start_station_id: 3, end_station_id: 3, bike_id: 348, zip_code: 95138, subscription_type: "Subscriber", start_date: start_date, end_date: end_date)
    Trip.create(duration: 25, start_station_id: 1, end_station_id: 1, bike_id: 348, zip_code: 94103, subscription_type: "Customer", start_date: start_date, end_date: end_date)
    Trip.create(duration: 30, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 32453, subscription_type: "Customer", start_date: start_date, end_date: end_date)
    Station.create(name: "1st station", dock_count: 30, city_id: 1, installation_date: installation_date)
    Station.create(name: "2nd station", dock_count: 50, city_id: 2, installation_date: installation_date)
    Station.create(name: "3rd station", dock_count: 15, city_id: 3, installation_date: installation_date)
    Station.create(name: "4th station", dock_count: 15, city_id: 4, installation_date: installation_date)
    Station.create(name: "5th station", dock_count: 15, city_id: 5, installation_date: installation_date)
 end

  it "sees header message" do
    visit '/stations'
    expect(page).to have_content("Station Index")
  end

  # it "redirects to 'stations/id' if city is clicked on" do
  #   click_link("Station with the thing")
  #   expect(current_path).to eq('/stations/1')
  # end

end
