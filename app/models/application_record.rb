class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def random(count = 1)
      result = order(Arel.sql('RANDOM()'))
      count == 1 ? result.first : result.limit(count)
    end
  end
end
