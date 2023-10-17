# frozen_string_literal: true

%i[Программирование Ruby Веб-разработка].each do |category|
  Category.create(name: category)
end
