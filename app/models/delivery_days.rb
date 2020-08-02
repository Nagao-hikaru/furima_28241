class Delivery_days < ActiveHash::Base
  self.date = [
    {id: 1, name: '__' },
    {id: 2, name: '1~2日で配送' },
    {id: 3, name: '2~3日で配送' },
    {id: 4, name: '4~7日で配送' }
  ]
end