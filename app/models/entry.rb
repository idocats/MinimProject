class Entry < ApplicationRecord
    validates :activity_type, :distance, :time, :steps, presence: true

    def day
       self.created_at.strftime("%b %e, %Y")
    end
end
