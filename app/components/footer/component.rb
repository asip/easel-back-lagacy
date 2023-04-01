# frozen_string_literal: true

# Footer
module Footer
  # Component
  class Component < ViewComponent::Base
    def initialize(day:)
      super
      @day = day
    end
  end
end
