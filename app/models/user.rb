class User < ActiveRecord::Base
  validates :session_id, presence: true
  validates :name, presence: true
  has_many :interactions, inverse_of: :user

  before_validation :ensure_name
  before_validation :ensure_session_id

  def ensure_name
    self.name = [User.adjectives.sample, User.animal_names.sample].join(" ") if name.blank?
  end

  def ensure_session_id
    self.session_id = SecureRandom.hex(24) if session_id.blank?
  end

  cattr_accessor :adjectives do
    File.readlines("app/files/adjectives.txt").map(&:chomp)
  end

  cattr_accessor :animal_names do
    File.readlines("app/files/names.txt").map(&:chomp)
  end
end