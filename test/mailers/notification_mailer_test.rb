require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  tests NotificationMailer

  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'

  test "sender_address" do
    NotificationMailer.webistrano_sender_address = "FooBar"

    stage = FactoryGirl.create(:stage)
    role = FactoryGirl.create(:role, :stage => stage, :name => 'app')
    assert stage.deployment_possible?, stage.deployment_problems.inspect
    deployment = FactoryGirl.create(:deployment, :stage => stage, :task => 'deploy')

    email = NotificationMailer.deployment(deployment, 'foo@bar.com').deliver_now
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal ['foo@bar.com'], email.to
    assert_equal ["FooBar"], email.from
    assert_equal "Deployment of #{stage.project.name}/#{stage.name} finished: running", email.subject
    # assert_match /<h1>Welcome to example.com, #{user.name}<\/h1>/, email.encoded
    # assert_match /Welcome to example.com, #{user.name}/, email.encoded
  end

end
