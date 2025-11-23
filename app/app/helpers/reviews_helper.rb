module ReviewsHelper
  # スコアに応じたCSSクラスを返す
  # @param score [Integer, nil] スコア値
  # @return [String] スコアに応じたTailwind CSSクラス
  def score_class(score)
    return "" if score.nil?
    
    if score < 50
      "bg-gradient-to-br from-red-500 to-red-600"
    elsif score < 80
      "bg-gradient-to-br from-yellow-400 to-yellow-500"
    else
      "bg-gradient-to-br from-green-500 to-green-600"
    end
  end
end
