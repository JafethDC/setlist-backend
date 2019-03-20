module Types
  class SetlistWhereUniqueType < Types::BaseInputObject
    description 'Identifying options for artists'

    argument :id, Integer, required: false
  end
end
