class Talk < ApplicationRecord
    validates :content, presence: true, length: {minimum: 1, maximum: 140}
end
