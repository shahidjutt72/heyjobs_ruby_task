# frozen_string_literal: true

class Campaign < ApplicationRecord
  STATUSES = {
    enabled: 0,
    disabled: 1,
    deleted: 2
  }.freeze

  enum status: STATUSES

end
