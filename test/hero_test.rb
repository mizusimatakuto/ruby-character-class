# テストフレームワーク minitest を利用する
require 'minitest/autorun'

# テスト結果の見た目を派手にする
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

# テスト対象のRubyソースコードを読み込む
require_relative '../lib/hero.rb'

# テストを実行するためのクラス
class HeroTest < Minitest::Test
  #　テストを実行する前の準備
  def setup
    @hero = Hero.new('ゆうしゃ',50)
  end

  def test_name
   assert_equal(@hero.name,'ゆうしゃ')
  end
  
  def test_hp
    assert_equal(@hero.hp, 50)
  end
  
  def test_dead
    hero_hp1 = Hero.new('ゆうしゃ', 1)
    hero_hp0 = Hero.new('ゆうしゃ', 0)
    hero_hpminus = Hero.new('ゆうしゃ', -1)

    assert_equal(hero_hp1.dead?, false)
    assert_equal(hero_hp0.dead?, true)
    assert_equal(hero_hpminus.dead?, true)
  end
end