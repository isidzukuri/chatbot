class User < ActiveRecord::Base
  has_many :messages
  has_one :info

  # def name
  #   @user ? @user.name : ''
  # end

  def contact_type
    info.contact_type.to_s
  end

  def contact
    if info.contact_type.present?
      info[info.contact_type.downcase]
    else
      ''
    end
  end
end
