# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  name       :string
#  studio     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  before_save :default_values

  has_many :tracks, dependent: :destroy
  belongs_to :band

  def default_values
    self.studio ||= false
  end


end
