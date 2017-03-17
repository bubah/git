class Project < ApplicationRecord
	#mount_uploader :image, ImageUploader
	#validates_presence_of :title, presence: true

	mount_uploader :image, ImageUploader


end
