require 'machinist/active_record'
require 'sham'

User.blueprint do
  username 'Mattis'
  password '1234'
end