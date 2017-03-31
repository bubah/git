class User < ApplicationRecord
	has_secure_password
	#VALID_EMAIL_REGEX = /\A[\W+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 30}, uniqueness: true
				#format: {with: VALID_EMAIL_REGEX}
	validates :password, presence: true, length: {minimum: 7}
	before_create :confirmation_token

	def editor?
		self.role == 'editor'
	end

	def admin?
		self.role == 'admin'
	end

	def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  	end

	private
	def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
