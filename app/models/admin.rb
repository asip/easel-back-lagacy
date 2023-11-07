# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                         :bigint           not null, primary key
#  crypted_password           :string
#  email                      :string           not null
#  failed_logins_count        :integer          default(0)
#  last_activity_at           :datetime
#  last_login_at              :datetime
#  last_login_from_ip_address :string
#  last_logout_at             :datetime
#  lock_expires_at            :datetime
#  salt                       :string
#  unlock_token               :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_admins_on_email                                (email) UNIQUE
#  index_admins_on_last_logout_at_and_last_activity_at  (last_logout_at,last_activity_at)
#  index_admins_on_unlock_token                         (unlock_token)
#

# Admin
class Admin < ApplicationRecord
  include Errors::Sortable

  authenticates_with_sorcery!

  VALID_EMAIL_REGEX = /\A\z|\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: %i[create update]
  validates :password, length: { minimum: 3 }, confirmation: true,
                       if: -> { new_record? || changes[:crypted_password] },
                       on: %i[create update]
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] },
                                    on: %i[create update]

  validates :email, presence: true, on: :login
  validates :password, presence: true, on: :login

  def full_error_messages_on_login
    full_error_messages_for(%i[email password])
  end
end
