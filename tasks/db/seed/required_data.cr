require "../../../spec/support/factories/**"

# Add seeds here that are *required* for your app to work.
# For example, you might need at least one admin user or you might need at least
# one category for your blog posts for the app to work.
#
# Use `Db::Seed::SampleData` if your only want to add sample data helpful for
# development.
class Db::Seed::RequiredData < LuckyTask::Task
  summary "Add database records required for the app to work"

  def call
    unless UserQuery.new.email("hi@wout.codes").first?
      SignUpUser.create!(
        email: "hi@wout.codes",
        password: "Lustiness-Answering1-Dash",
        password_confirmation: "Lustiness-Answering1-Dash"
      )
    end

    puts "Done adding required data"
  end
end
