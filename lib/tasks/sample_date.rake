namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "exampl@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    1.times do |n|
      name  = "Roman Kaporin"
      email = "admin@weblab.org"
      password  = "password"
      admin = true
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   admin: true)
    end
  end
end