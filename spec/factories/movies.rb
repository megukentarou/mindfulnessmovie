FactoryBot.define do

  factory :movie do
    title            {"動画のタイトル"}
    text             {"動画の説明文"}
    url              {"abcdefghijk"}
    time             {"1"}
    created_at       {"20201010"} 
    updated_at       {"20201010"}
    user_id          {"1"}
  end
  
end