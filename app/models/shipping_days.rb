class ShippingDays < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  self.data = [
      {id: 1, name: '1〜2日で発送'}, {id: 2, name: '2〜3日で発送'}, {id: 3, name: '4〜7日で発送'},
      {id: 4, name: '1〜2週間で発送'},{id: 5, name: '3〜4週間で発送'}, {id: 6, name: '1〜2ヶ月で発送'}
]
end