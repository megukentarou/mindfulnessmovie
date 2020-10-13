require 'rails_helper'

describe Movie do
  describe '#create' do

    # 1
    it "titleとtextとurlとtimeが揃っていれば登録できること" do
      movie = build(:movie)
      expect(movie).to be_valid
    end

    # 2
    it " titleがない場合は登録できないこと" do
      movie = build(:movie, title: nil)
      movie.valid?
      expect(movie.errors[:nickname]).to include()
    end

    # 3
    it "textがない場合は登録できないこと" do
      movie = build(:movie, text: nil)
      movie.valid?
      expect(movie.errors[:text]).to include("translation missing: ja.activerecord.errors.models.movie.attributes.text.blank")
    end

    # 4
    it "urlがない場合は登録できないこと" do
      movie = build(:movie, url: nil)
      movie.valid?
      expect(movie.errors[:url]).to include("translation missing: ja.activerecord.errors.models.movie.attributes.url.blank", "translation missing: ja.activerecord.errors.models.movie.attributes.url.wrong_length")
    end

     # 5
     it "urlは11文字でない場合は登録できないこと" do
      movie = build(:movie, url: nil)
      movie.valid?
      expect(movie.errors[:url]).to include("translation missing: ja.activerecord.errors.models.movie.attributes.url.blank", "translation missing: ja.activerecord.errors.models.movie.attributes.url.wrong_length")
    end

    # 6
    it "urlは11文字なら登録できること" do
      movie = build(:movie, url: "abcdefghijk")
      expect(movie).to be_valid
    end


    # 7
    it "timeの選択がない場合は登録できないこと" do
      movie = build(:movie, time: nil)
      movie.valid?
      expect(movie.errors[:time]).to include()
    end

  end
end