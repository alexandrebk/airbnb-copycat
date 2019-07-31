class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats,    dependent: :destroy
  has_many :bookings, dependent: :destroy

  def friends
    friends = Message.where(sender: self).map { |message| message.receiver} + Message.where(receiver: self).map { |message| message.sender}
    friends.uniq
  end

  def conversation_with(friend_id)
    friend       = User.find(friend_id)
    conversation = Message.where(sender: self, receiver: friend) + Message.where(sender: friend, receiver: self)
    conversation.sort_by { |message| message.created_at }
  end
end
