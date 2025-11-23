module GamesHelper
  def platform_options_for_select(game_platforms)
    game_platforms.map { |gp| [gp.platform&.name || "不明", gp.id] }
  end
end
