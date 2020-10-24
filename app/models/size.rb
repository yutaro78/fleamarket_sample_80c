class Size < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  self.data = [
    {id: 1, name: 'XXS以下'}, {id: 2, name: 'XS(SS)'}, {id: 3, name: 'S'},
    {id: 4, name: 'M'}, {id: 5, name: 'L'}, {id: 6, name: 'XL(LL)'},
    {id: 7, name: '2XL(3L)'}, {id: 8, name: '3XL(4L)'}, {id: 9, name: '4XL(5L)'},
    {id: 10, name: 'FREE_SIZE'}, {id: 11, name: '20cm以下'}, {id: 12, name: '22.5cm'},
    {id: 13, name: '23cm'}, {id: 14, name: '23.5cm'}, {id: 15, name: '24cm'},
    {id: 16, name: '24.5cm'}, {id: 17, name: '25cm'}, {id: 18, name: '25.5cm'},
    {id: 19, name: '26cm'}, {id: 20, name: '26.5cm'}, {id: 21, name: '27cm'},
    {id: 22, name: '27.5cm'}, {id: 23, name: '28cm'}, {id: 24, name: '28.5cm'},
    {id: 25, name: '29cm'}, {id: 26, name: '29.5cm'}, {id: 27, name: '30cm以上'},
    {id: 28, name: '60cm'}, {id: 29, name: '70cm'}, {id: 30, name: '80cm'},
    {id: 31, name: '90cm'}, {id: 32, name: '95cm'}, {id: 33, name: '100cm'},
    {id: 34, name: '110cm'}, {id: 35, name: '120cm'}, {id: 36, name: '130cm'},
    {id: 37, name: '140cm'}, {id: 38, name: '150cm'}, {id: 39, name: '160cm'},
    {id: 40, name: '12インチ'}, {id: 41, name: '13インチ'}, {id: 42, name: '14インチ'},
    {id: 43, name: '15インチ'}, {id: 44, name: '16インチ'}, {id: 45, name: '17インチ'},
    {id: 46, name: '18インチ'}, {id: 47, name: '19インチ'}, {id: 48, name: '20インチ'},
    {id: 49, name: '21インチ'}, {id: 50, name: '22インチ'}, {id: 51, name: '23インチ'}
]
end

end