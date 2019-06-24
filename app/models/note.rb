class Note < ApplicationRecord
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(usernames)
    users = usernames.delete(" ").split(",")
    users.each do |user|
      readers << User.create(name: user)
    end
  end

  def visible_to
    readers
  end
end
