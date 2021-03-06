# frozen_string_literal: true

class Task < ApplicationRecord
  enum status: %i[to_do in_progress done]
end
