class Article < ApplicationRecord
  acts_as_taggable
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :text, presence: true
  validates :summary, presence: true

  scope :desc, -> { order("created_at desc") }
end
