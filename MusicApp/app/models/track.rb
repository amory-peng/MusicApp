# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  lyrics     :string
#  bonus      :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  has_many :notes, dependent: :destroy
  belongs_to :album

end
