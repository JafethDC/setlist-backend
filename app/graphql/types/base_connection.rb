module Types
  class BaseConnection < GraphQL::Types::Relay::BaseConnection
    field :total_count, Integer, null: false do
      description 'Total # of objects returned from this Plural Query'
    end

    field :total_page_count, Integer, null: false do
      description 'Total # of pages, based on total count and pagesize'
    end

    def total_count
      object.nodes&.count
    end

    def total_page_count
      return 1 unless object.nodes&.count&.positive?

      my_total_count = object.nodes&.count
      possible_page_sizes = [my_total_count]

      possible_page_sizes.push(object.arguments[:first]) if object.arguments[:first]
      possible_page_sizes.push(object.arguments[:last]) if object.arguments[:last]

      actual_page_size = possible_page_sizes.min

      (my_total_count / actual_page_size.to_f).ceil
    end
  end
end
