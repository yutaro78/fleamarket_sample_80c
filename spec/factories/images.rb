FactoryBot.define do
  
  factory :image do
    url  { Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/test_image.jpg'), 'image/jpg') }
    association :item
  end
end