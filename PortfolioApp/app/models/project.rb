class Project < ApplicationRecord
	#mount_uploader :image, ImageUploader
	#validates_presence_of :title, presence: true

	attr_accessor :image


	after_save :save_image, if: :image

	def save_image
		filename = image.original_filename
		folder = "public/books/#{id}/image"

		FileUtils::mkdir_p folder

		f = File.open File.join(folder, filename), "wb"
		f.write image.read()
		f.close

		self.image = nil
		update image_filename: filename
	end


end
