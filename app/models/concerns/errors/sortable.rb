# frozen_string_literal: true

# Errors Module
module Errors
  # Sortable Module
  module Sortable
    extend ActiveSupport::Concern

    protected

    def full_error_messages_for(columns)
      full_error_messages = []
      columns.each do |column|
        errors.full_messages_for(column).each do |message|
          full_error_messages << message
        end
      end
      full_error_messages
    end
  end
end
