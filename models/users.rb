require "sinatra/activerecord"
require 'omniauth'

class User < ActiveRecord::Base
    serialize :spotify_hash
end

# {
#     "birthdate"=>nil,
#     "country"=>nil,
#     "display_name"=>"Andrew Nicholas",
#     "email"=>"andrew.d.nicholas@gmail.com",
#     "followers"=> #<OmniAuth::AuthHash 
#         href=nil 
#         total=5,
#     # "images"=>[
#     #     #<OmniAuth::AuthHash height=nil url="https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/40748508_10156053980948640_3286216543460917248_n.jpg?_nc_cat=109&_nc_ht=scontent.xx&oh=16af99aabb1f21a9bd6744d5b130cb15&oe=5C8362CC" width=nil>
#     # ],
#     "product"=>nil,
#     "external_urls"=> #<OmniAuth::AuthHash 
#         spotify="https://open.spotify.com/user/1232409408">,
#     "href"=>"https://api.spotify.com/v1/users/1232409408",
#     "id"=>"1232409408",
#     "type"=>"user",
#     "uri"=>"spotify:user:1232409408",
#     "credentials"=> 
#         expires=true
#         expires_at=1541189223
#         refresh_token="AQA3TJaKysSkoLlOk2xLiU4RgZiY_uuk7IJcQcudVvyfE-4yrFaHTyfRn5VLKfeVK3PuOfb1qM8ghAbL0SMKRsExcTXi_m6XCvART1-u8Ttczhmbhow2e5pziGfnrV3eZPDtUA"
#         token="BQCPt3PM25RWxh-gsKGCtizvw-V9y7bhwvJtTiOo0H8ogdpVtMYDDkMbyK2a15r0Lz7IVIPtXcc3Fh9Rpco-amuMeFQUOmZbulW4FEcF_3H1iGvMYdIR1nE1w5w5mujOndocJ9Foq55G0_u6ToHEt6Z65UefyIhRVFE5cHbisEs0XjB3dZP7DVqM9oLvTQRZKB5yDfmE"
# }