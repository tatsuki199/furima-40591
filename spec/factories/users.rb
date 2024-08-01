FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {'1a1111'}
    password_confirmation {password}
    last_name {'山田'}
    first_name {'陸田'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'リクタ'}
    # last_name {CustomFaker.random_kanji(2)}
    # first_name {CustomFaker.random_kanji(2)}
    # last_name_kana {CustomFaker.random_katakana(3)}
    # first_name_kana {CustomFaker.random_katakana(3)}
    date_of_birth {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
  # lib/custom_password_generator.rb
# module CustomPasswordGenerator
#   def self.generate_password(min_length = 6)
#     characters = '1a' + Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
#     (0...length).map { characters.sample }.join
#   end
# end
end