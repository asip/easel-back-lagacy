# frozen_string_literal: true

# Preview Component
module PreviewComponent
  # Component
  class Component < ViewComponent::Base
    def initialize(model:)
      super
      @model = model
    end
  end
end
