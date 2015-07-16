module LocationHelper
  def collestion_of_cities_for_region(region)
    region.present? ? City.for_region(region.id).select([:id, :name]).all : []
  end
end