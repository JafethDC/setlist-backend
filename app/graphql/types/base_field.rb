module Types
  class BaseField < GraphQL::Schema::Field
    attr_reader :private

    def initialize(private: false, **kwargs, &block)
      @private = private
      super(**kwargs, &block)
    end

    def accessible?(context)
      if @private && context[:current_user].nil?
        false
      else
        super
      end
    end
  end
end
