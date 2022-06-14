module Constants
    TYPES = {
      'Admin' => '0',
      'User' => '1'
    }.freeze
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    POST_CSV_HEADER = %w[title body]
    POST_CSV_FORMAT_HEADER = %w[title body]
    VALID_DATE_FORMAT = /\d{4}-\d{2}-\d{2}/
end
module Constants
EMPLOYMENTTYPES = {
    'Full Time' => 'Full Time',
    'Part Time' => 'Part Time'
}.freeze
end
module Constants
DEPARTMENTS = {
    'IT' => 'IT',
    'Office Operation' => 'Office Operation',
    'Network' => 'Network'
}.freeze
end