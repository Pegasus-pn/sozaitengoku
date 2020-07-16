class Material < ApplicationRecord
    belongs_to :user
    attachment :image
    mount_uploader :video, VideoUploader
    has_many :likes, dependent: :destroy

    with_options presence: true do
        validates :title
        validates :body
        validates :video
    end
end
