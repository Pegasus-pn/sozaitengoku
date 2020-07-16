class Like < ApplicationRecord
    belongs_to :user
    belongs_to :material

    validates_uniqueness_of :material_id, scope: :user_id
    validates :material_id,{presence: true}
    validates :user_id,{presence: true}
end
