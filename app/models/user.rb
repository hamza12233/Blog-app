# frozen_string_literal: true

class User < ActiveRecord::Base
  ATTRIBUTES_WHITELIST = [
    :id,
    :email,
    :password,
    :new_password,
    :password_confirmation,
    :name,
    :nickname,
    :image
  ].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  before_validation :downcase_email
  before_validation :name_senitize

  has_many :blogs, dependent: :destroy
  has_one :account_info, dependent: :destroy

  def as_json(options = {})
    super(only: %i[id name nickname email image])
  end

  private

  def downcase_email
    return if email.blank?

    self.email = email.strip.downcase
    self.uid = email
  end

  def name_senitize
    self.name = name.to_s.strip
  end

end
