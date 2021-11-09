class SignupSerializer < ActiveModel::Serializer
  belongs_to :activity
  belongs_to :camper
end
