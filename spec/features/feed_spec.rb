require 'spec_helper'
require 'rake'

describe 'home' do
  let(:hash_tag) { ENV['HASHTAG'] }
  let(:twitter_profile_image) {"http://a0.twimg.com/profile_images/447958234/Lichtenstein_normal.jpg"}
  let(:twitter_media_image) {"https://pbs.twimg.com/media/BoqqU1wIMAAr_zO.jpg"}
  let(:instagram_profile_image) {"http://images.ak.instagram.com/profiles/profile_33110152_75sq_1380185157.jpg"}
  let(:instagram_media_image) {"http://scontent-a.cdninstagram.com/hphotos-xfa1/t51.2885-15/10684067_323739034474097_279647979_n.jpg"}

  xit 'should display single tweets details', js: true do
    sleep ENV["API_Rate"].to_i + 0.5
    visit '/'

    expect(page).to have_content("Thee Namaste Nerdz. ##{hash_tag}")
    expect(page).to have_content('bullcityrecords')
    expect(page).to have_image(twitter_media_image)

    expect(page).to have_content("#elevator #kiss #love #budapest #basilica #tired")
    expect(page).to have_content('pollywoah')
    expect(page).to have_image(instagram_media_image)
  end

  xit 'should add a tweet via automatic update', js: true do
    visit '/'

    expect(page).to have_content("Thee Namaste Nerdz. ##{hash_tag}")
    expect(page).to have_content('@bullcityrecords')
    expect(page).to have_content('Fri Sep 21 11:30 PM')

    update_tweets_in_db

    sleep(30.seconds)

    expect(page).to have_content("Thee Namaste Nerdz. ##{hash_tag}")
    expect(page).to have_content('@bullcityrecords')
    expect(page).to have_content('Fri Sep 21 11:30 PM')
  end

  it 'should not have several swear words' do
    Capybara.use_default_driver
    sleep ENV["API_Rate"].to_i + 0.5
    stub_request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=%23#{hash_tag}").
      with(headers: {"Authorization"=>/Bearer .+/}).
      to_return( {:status => 200, :body => SampleTweetResponses.tweets_with_censored_words.to_json, :headers => {'content-type' => 'application/json'} })
    visit '/'

    ENV["CENSORED_WORDS"].split("|").each do |word|
      expect(page).to_not have_content(word)
    end
  end

  def update_tweets_in_db
    Rails.application.load_tasks
    Rake::Task["update_feed"].invoke
  end
end

module Capybara
  class Session
    def has_image?(src)
      has_xpath?("//img[contains(@src,\"#{src}\")]")
    end
  end
end

