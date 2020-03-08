class UserStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '生徒'},
    { id: 2, name: '保護者'},
    { id: 3, name: '講師'},
  ]
end
