class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 8, less_than_or_equal_to: 18 }


    def plus_activites
        {
            id: self.id,
            name: self.id,
            age: self.age,
            activities: self.activities.map do |activity|
                {
                    id: self.id,
                    name: name.id,
                    difficulty: self.difficulty
                }
            end
        }
    end


end
