require 'fakeweb'

FACEBOOK_API_BASE = 'https://graph.facebook.com/'
FakeWeb.register_uri(:post, FACEBOOK_API_BASE + 'oauth/access_token',
                       :body => {
                       :access_token => "faketoken"
                       }.to_json)
FakeWeb.register_uri(:get, FACEBOOK_API_BASE + 'me?access_token=faketoken',
                       :body => {
                       :id => '12345',
                       :link => 'http://facebook.com/user_example',
                       :email => 'example@example.com',
                       :first_name => 'John',
                       :last_name => 'Doe',
                       :website => 'http://blog.plataformatec.com.br'
                       }.to_json)

FakeWeb.allow_net_connect = false