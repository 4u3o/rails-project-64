# frozen_string_literal: true

%i[кино музыка].each do |category|
  Category.create(name: category)
end
