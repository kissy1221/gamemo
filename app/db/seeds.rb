# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# ジャンルマスタの作成
genres_data = [
  { name: "アクション", slug: "action" },
  { name: "RPG", slug: "rpg" },
  { name: "アドベンチャー", slug: "adventure" },
  { name: "シューティング", slug: "shooting" },
  { name: "パズル", slug: "puzzle" },
  { name: "レース", slug: "racing" },
  { name: "スポーツ", slug: "sports" },
  { name: "シミュレーション", slug: "simulation" },
  { name: "ストラテジー", slug: "strategy" },
  { name: "格闘", slug: "fighting" },
  { name: "音楽", slug: "music" },
  { name: "ホラー", slug: "horror" },
  { name: "インディー", slug: "indie" },
  { name: "オープンワールド", slug: "open-world" },
  { name: "サンドボックス", slug: "sandbox" }
]

genres_data.each do |genre_data|
  Genre.find_or_create_by!(slug: genre_data[:slug]) do |genre|
    genre.name = genre_data[:name]
  end
end

# プラットフォームマスタの作成
platforms_data = [
  { name: "PlayStation 5", slug: "ps5" },
  { name: "PlayStation 4", slug: "ps4" },
  { name: "Nintendo Switch", slug: "switch" },
  { name: "Xbox Series X|S", slug: "xbox-series" },
  { name: "Xbox One", slug: "xbox-one" },
  { name: "PC (Steam)", slug: "pc-steam" },
  { name: "PC (Epic Games)", slug: "pc-epic" },
  { name: "iOS", slug: "ios" },
  { name: "Android", slug: "android" },
  { name: "PlayStation 3", slug: "ps3" },
  { name: "Xbox 360", slug: "xbox-360" },
  { name: "Nintendo 3DS", slug: "3ds" },
  { name: "PlayStation Vita", slug: "psvita" }
]

platforms_data.each do |platform_data|
  Platform.find_or_create_by!(slug: platform_data[:slug]) do |platform|
    platform.name = platform_data[:name]
  end
end

# ゲームダミーデータの作成（100個）
game_titles = [
  "エターナル・レジェンド",
  "サイバー・ストーム",
  "ドラゴンクエスト 新章",
  "ファイナルファンタジー リメイク",
  "ゼルダの伝説 時のオカリナ HD",
  "スーパーマリオ ワンダーランド",
  "モンスターハンター ワールド",
  "エルデンリング",
  "ホグワーツ・レガシー",
  "スパイダーマン マイルズ・モラレス",
  "ゴッド・オブ・ウォー ラグナロク",
  "ホライゾン ゼロ・ドーン",
  "アサシンズクリード ヴァルハラ",
  "ウォッチドッグス レギオン",
  "サイバーパンク2077",
  "レッド・デッド・リデンプション2",
  "グランド・セフト・オートV",
  "フォートナイト",
  "エーペックスレジェンズ",
  "コール・オブ・デューティ モダン・ウォーフェア",
  "バトルフィールド2042",
  "オーバーウォッチ2",
  "ヴァロラント",
  "リーグ・オブ・レジェンド",
  "ドーター2",
  "カウンターストライク2",
  "レインボーシックス シージ",
  "デスティニー2",
  "ウォーフレーム",
  "パス・オブ・エグザイル",
  "ディアブロIV",
  "パスファインダー キングメーカー",
  "バルダーズ・ゲート3",
  "ディビニティ オリジナル・シン2",
  "ポケモン スカーレット・バイオレット",
  "スプラトゥーン3",
  "マリオカート8 デラックス",
  "大乱闘スマッシュブラザーズ SPECIAL",
  "ゼノブレイド3",
  "ファイアーエムブレム エンゲージ",
  "ペルソナ5 ロイヤル",
  "ペルソナ3 リロード",
  "ドラゴンクエストXI",
  "ファイナルファンタジーXVI",
  "ファイナルファンタジーVII リメイク",
  "キングダムハーツIII",
  "ニーア オートマタ",
  "デモンズソウル",
  "ブラッドボーン",
  "ダークソウルIII",
  "セキロ",
  "ゴースト・オブ・ツシマ",
  "デイズゴーン",
  "アンチャーテッド4",
  "ラスト・オブ・アス Part I",
  "ラスト・オブ・アス Part II",
  "デトロイト ビカム・ヒューマン",
  "ヘビー・レイン",
  "ビヨンド トゥー・ソウルズ",
  "ライフ・イズ・ストレンジ",
  "テル・ミー・ホワイ",
  "ファイアーウォッチ",
  "エブリシング",
  "グリス",
  "セレスティア",
  "ホロウ・ナイト",
  "オリとくらやみの森",
  "テラリア",
  "マインクラフト",
  "ドンキーコング トロピカルフリーズ",
  "スーパーマリオ オデッセイ",
  "ルイージマンション3",
  "ペーパーマリオ オリガミキング",
  "マリオパーティ スーパースターズ",
  "スーパーマリオ メーカー2",
  "リングフィット アドベンチャー",
  "あつまれ どうぶつの森",
  "スプラトゥーン2",
  "ゼルダの伝説 ブレス オブ ザ ワイルド",
  "ゼルダの伝説 ティアーズ オブ ザ キングダム",
  "ゼノブレイド ディフィニティブ・エディション",
  "ゼノブレイド2",
  "ファイアーエムブレム 風花雪月",
  "オクトパストラベラー",
  "トライアングルストラテジー",
  "ライブ・ア・ライブ",
  "ドラゴンクエスト トレジャーズ",
  "ドラゴンクエスト モンスターズ3",
  "モンスターハンターライズ",
  "モンスターハンター ワールド アイスボーン",
  "ストリートファイター6",
  "鉄拳8",
  "ギルティギア -STRIVE-",
  "グランブルーファンタジー ヴァーサス",
  "原神",
  "崩壊：スターレイル",
  "Fate/Grand Order",
  "パズル&ドラゴンズ",
  "モンスターストライク",
  "ポケモンGO",
  "スーパーカービィ ディスカバリー",
  "カービィのグルメフェス",
  "星のカービィ Wii デラックス",
  "メトロイド ドレッド",
  "ベヨネッタ3",
  "アストラルチェイン",
  "ブレイブリーデフォルト2",
  "トワイライトプリンセス HD",
  "スカイウォードソード HD",
  "マリオ+ラビッツ キングダムバトル",
  "スーパーマリオ RPG",
  "パーフェクトダーク",
  "バンジョーとカズーイの大冒険",
  "ゴールデンアイ007",
  "マリオゴルフ スーパーラッシュ"
]

developers = [
  "スクウェア・エニックス",
  "任天堂",
  "ソニー・インタラクティブエンタテインメント",
  "フロム・ソフトウェア",
  "カプコン",
  "バンダイナムコエンターテインメント",
  "コーエーテクモゲームス",
  "セガ",
  "アトラス",
  "レベルファイブ",
  "インディーゲームスタジオ",
  "CDプロジェクトRED",
  "ロックスターゲームズ",
  "ユービーアイソフト",
  "エレクトロニック・アーツ",
  "アクティビジョン・ブリザード",
  "ベセスダ・ソフトワークス",
  "2K Games",
  "ワーナー・ブラザース・インタラクティブエンターテインメント",
  "ミホヨゲームズ"
]

publishers = [
  "スクウェア・エニックス",
  "任天堂",
  "ソニー・インタラクティブエンタテインメント",
  "フロム・ソフトウェア",
  "カプコン",
  "バンダイナムコエンターテインメント",
  "コーエーテクモゲームス",
  "セガ",
  "アトラス",
  "レベルファイブ",
  "インディーゲームスタジオ",
  "CDプロジェクトRED",
  "ロックスターゲームズ",
  "ユービーアイソフト",
  "エレクトロニック・アーツ",
  "アクティビジョン・ブリザード",
  "ベセスダ・ソフトワークス",
  "2K Games",
  "ワーナー・ブラザース・インタラクティブエンターテインメント",
  "ミホヨゲームズ"
]

descriptions = [
  "壮大な冒険が待ち受けるオープンワールドRPG。美しいグラフィックと深いストーリーが魅力。",
  "高速アクションと戦略性を兼ね備えた最新作。マルチプレイヤー対応で友達と楽しめます。",
  "クラシックなRPGの魅力を現代的なグラフィックで再現。初心者にもおすすめ。",
  "没入感のある世界観と緻密なゲームデザインが特徴。長時間プレイしても飽きません。",
  "爽快感あふれるアクションゲーム。多彩な武器とスキルで敵を倒していく。",
  "パズル要素とアクションが融合した新感覚ゲーム。頭と反射神経の両方が試されます。",
  "美しいグラフィックと感動的なストーリーが魅力のアドベンチャーゲーム。",
  "戦略性の高いシミュレーションゲーム。資源管理と戦略立案が重要。",
  "迫力満点のレースゲーム。リアルな物理演算と美しいグラフィックが特徴。",
  "スポーツゲームの決定版。最新の選手データとリアルなプレイ感を実現。",
  "ホラー要素満載のサバイバルゲーム。緊張感と恐怖が味わえます。",
  "音楽に合わせてリズムを取るリズムゲーム。多彩な楽曲が楽しめます。",
  "格闘ゲームの最新作。バランス調整と新キャラクターが追加されました。",
  "インディーゲームの傑作。独特の世界観とクリエイティブなゲームプレイ。",
  "自由度の高いサンドボックスゲーム。創造性を存分に発揮できます。"
]

genres = Genre.all
platforms = Platform.all

game_titles.each_with_index do |title, index|
  game = Game.find_or_create_by!(name: title) do |g|
    g.description = descriptions.sample
    g.release_date = Date.today - rand(365 * 5).days
    g.developer = developers.sample
    g.publisher = publishers.sample
    g.official_site_url = "https://example.com/games/#{title.parameterize}"
  end

  # ゲームにジャンルを関連付け（1-3個のランダムなジャンル）
  game_genres_count = rand(1..3)
  selected_genres = genres.sample(game_genres_count)
  selected_genres.each do |genre|
    GameGenre.find_or_create_by!(game: game, genre: genre)
  end

  # ゲームにプラットフォームを関連付け（1-4個のランダムなプラットフォーム）
  game_platforms_count = rand(1..4)
  selected_platforms = platforms.sample(game_platforms_count)
  selected_platforms.each do |platform|
    GamePlatform.find_or_create_by!(game: game, platform: platform) do |gp|
      gp.average_score = rand(3.0..5.0).round(1)
      gp.review_count = rand(0..1000)
    end
  end
end

puts "Seeds completed: #{Genre.count} genres, #{Platform.count} platforms, #{Game.count} games created."
