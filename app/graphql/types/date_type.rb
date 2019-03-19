module Types
  class DateType < Types::BaseScalar
    description 'An ISO 8601-encoded date'

    def self.coerce_result(value, _ctx)
      value.iso8601
    end

    def self.coerce_input(value, _ctx)
      Time.zone.parse(value).to_date
    end
  end
end
