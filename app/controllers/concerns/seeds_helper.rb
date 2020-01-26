module SeedsHelper
  def width
    Faker::Number.within(range: 1280..2560)
  end
  def height
    Faker::Number.within(range: 720..1440)
  end
end
