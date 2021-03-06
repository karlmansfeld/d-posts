class Micropost < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size


  private
  def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should bu less than 5MB")
      end
  end

  has_many :favorites, foreign_key: 'micropost_id', dependent: :destroy
  has_many :users, through: :favorites

end
