class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '対応前' },
    { id: 3, name: '対応中' },
    { id: 4, name: '対応済み' }
  ]

  include ActiveHash::Associations
  has_many :tasks
  end