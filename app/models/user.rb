class User < ActiveRecord::Base
  validates :session_id, presence: true
  validates :name, presence: true
  has_many :interactions, inverse_of: :user

  before_validation :ensure_name

  def ensure_name
    [User.adjectives.sample, User.animal_names.sample].join(" ")
  end

  cattr_accessor :adjectives do
    File.readlines("app/files/adjectives.txt").map(&:chomp)
  end

  cattr_accessor :animal_names do
    File.readlines("app/files/names.txt").map(&:chomp)
  end
end