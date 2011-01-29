class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :preference_attributes

  belongs_to :group
  has_many :rides

  has_one :preference
  accepts_nested_attributes_for :preference, :allow_destroy => :true

  after_create :create_preferences

  def create_preferences
    self.preference = Preference.new
  end

  def cummulative_distance
    rides.sum('distance')
  end

  def cummulative_duration
    rides.sum('duration')
  end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end
end
