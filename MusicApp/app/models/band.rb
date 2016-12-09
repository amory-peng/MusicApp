# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ApplicationRecord
  validates :name, uniqueness: true
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums, dependent: :destroy
end
