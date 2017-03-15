class Activity < ApplicationRecord
  belongs_to :user

  enum action: {admin_alert: 1}
end
