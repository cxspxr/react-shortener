class Base62Validator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid Base62") unless base62_valid?(value)
  end

  def base62_valid?(string)
    /^[0-9A-Za-z]+$/.match?(string)
  end
end
