class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def friends
    friends = Message.where(sender: self)(:&receiver) + Message.where(receiver: self)(:&sender)
    friends.uniqexit
  end

  def conversation_with(friend_id)
    # return array of messages with one personne
    friend       = User.find(friend_id)
    conversation = Message.where(sender: self, receiver: friend) + Message.where(sender: friend, receiver: self)
    conversation.order_by(:created_at)
  end

  has_many :flats,    dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages_as_receiver, foreign_key: 'receiver_id', class_name: 'Message'
  has_many :messages_as_sender,   foreign_key: 'sender_id',   class_name: 'Message'
end
