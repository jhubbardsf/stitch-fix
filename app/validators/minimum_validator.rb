class MinimumValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    def is_number?(object)
      true if Float(object) rescue false
    end

    if record.name == "Pants" || record.name == "Dress"
      if value < 5 || !is_number?(value)
        record.errors[attribute] << 'is below the minimum ($5) clearance value or invalid.'
      end
    else
      if value < 2
        record.errors[attribute] << 'is below the minimum ($2) clearance value or invalid.'
      end
    end
  end
end

