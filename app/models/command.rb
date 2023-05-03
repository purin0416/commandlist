class Command < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :language, presence: true, length: { maximum: 255 }
end
