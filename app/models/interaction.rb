class Interaction
  belongs_to :user, required: true
  belongs_to :film, required: true

  enum interaction_type: {review: 1, seen: 2}
end