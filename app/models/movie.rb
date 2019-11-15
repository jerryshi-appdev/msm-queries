# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#

class Movie < ApplicationRecord
    def Movie.last_decade
        return Movie.where("year > ?", 10.years.ago.year)
    end
    def Movie.short
        return Movie.where("duration < ?", 90)
    end
    def Movie.long
        return Movie.where("duration > ?", 180)
    end
    def director
        return Director.where({ :id => self.director_id})
    end
    def characters
        return Character.where({ :movie_id => self.id })
    end
    def cast
        cast_ids = Character.where({ :movie_id => self.id}).pluck(:actor_id)
        return Actor.where({ :id => cast_ids})
    end
end
