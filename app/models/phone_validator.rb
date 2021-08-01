class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A\(\+[0-9]{2}\) [0-9]{3}[ -][0-9]{3}[ -][0-9]{2}[ -][0-9]{2}\z/i
      record.errors.add attribute, (options[:message] || "is not a valid phone")
    end
  end
end
