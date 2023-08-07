class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '会議' },
    { id: 3, name: '面談' },
    { id: 4, name: '外出' },
    { id: 5, name: '対応' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks
  end