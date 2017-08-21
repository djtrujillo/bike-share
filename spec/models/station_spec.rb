RSpec.describe Station do
  describe "Validations" do
    before(:each) do
      @date = DateTime.now
    end

    it "validations city, name, dock_count, and installation date" do
      valid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: @date)

      expect(valid_station).to be_valid

    end

    it "invalid station cannot be created with no date" do
      invalid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without name' do
      invalid_station = Station.create(city_id: 1, dock_count: 10, installation_date: @date)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without city_id' do
      invalid_station = Station.create(name: "StationOne", dock_count: 10, installation_date: @date)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without dock_count' do
      invalid_station = Station.create(name: "StationOne", city_id: 1, installation_date: @date)

      expect(invalid_station).to_not be_valid
    end
  end

  describe 'dashboard methods' do
    before(:each) do
      @date = DateTime.now
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: @date)
    end

    it 'counts the total number of stations' do
      expect(Station.count).to be(1)

      Station.create(name: "StationTwo", city_id: 1, dock_count: 10, installation_date: @date)

      expect(Station.count).to be(2)
    end

    it 'finds average dock_count' do
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: @date)

      expect(Station.average_count).to be(10)
    end

    it 'finds station with most bikes' do
      max = Station.create(name: "StationOne", city_id: 1, dock_count: 1000, installation_date: @date)
      Station.create(name: "StationOne", city_id: 1, dock_count: 2, installation_date: @date)


      expect(Station.max_station).to eq(max)
    end
  end
end
