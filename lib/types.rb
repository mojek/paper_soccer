require 'dry-types'

module Types
  include Dry::Types()

  UUID = Types::Strict::String.constrained(uuid_v4: true)
  FIELD_SIZE = Types::Coercible::Integer.constrained(gt: 6, lt: 100, even: true)
  DIRECTIONS = Types::String.enum('N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW')

end
