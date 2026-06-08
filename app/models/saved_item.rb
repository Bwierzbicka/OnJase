class SavedItem < ApplicationRecord
  belongs_to :saveable, polymorphic: true
  belong_to :user
end
