class School < ActiveHash::Base
  self.data = [
    { id: 1, name: '小学校'},
    { id: 2, name: '中学校'},
    { id: 3, name: '高校'},
  ]
end
