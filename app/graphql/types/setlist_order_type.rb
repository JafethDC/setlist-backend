module Types
  class SetlistOrderType < Types::BaseInputObject
    description 'Ordering options for setlists'

    argument :field, SetlistOrderFieldEnum, required: true
    argument :direction, OrderDirectionEnum, required: true
  end
end
