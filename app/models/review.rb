class Review < ApplicationRecord
  AUTHORIZED_CONTENT = ["Hote Excellent", "Hote très charmant", "Hote moyen", "L'hote peut s'améliorer"]
  validates  :content, inclusion: { in: AUTHORIZED_CONTENT }
  belongs_to :user
  belongs_to :booking
end
