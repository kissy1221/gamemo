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
    # プレースホルダー画像URL（適当な画像を表示）
    g.cover_image_url = "https://picsum.photos/seed/#{title.parameterize}/800/600"
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

# ダミーユーザーの作成（レビュー投稿用）
puts "\nCreating dummy users..."
user_names = [
  "ゲーマー太郎", "プレイヤー花子", "ゲーム好き", "レビュアーA", "レビュアーB",
  "ゲームマスター", "プレイヤー123", "ゲームファン", "レビュアーC", "ゲーマーZ",
  "プレイヤーX", "ゲーム愛好家", "レビュアーD", "ゲーマーY", "プレイヤーW",
  "ゲーム評論家", "プレイヤーV", "ゲーマーU", "レビュアーE", "ゲームハンター",
  "プレイヤーT", "ゲーマーS", "レビュアーF", "ゲームエンジョイ", "プレイヤーR",
  "ゲーマーQ", "レビュアーG", "ゲームマニア", "プレイヤーP", "ゲーマーO",
  "レビュアーH", "ゲームコレクター", "プレイヤーN", "ゲーマーM", "レビュアーI",
  "ゲームファンタジー", "プレイヤーL", "ゲーマーK", "レビュアーJ", "ゲームアドベンチャー",
  "プレイヤーI", "ゲーマーH", "レビュアーK", "ゲームストーリー", "プレイヤーG",
  "ゲーマーF", "レビュアーL", "ゲームアクション", "プレイヤーE", "ゲーマーD",
  "レビュアーM", "ゲームRPG", "プレイヤーC", "ゲーマーB", "レビュアーN"
]

users = []
user_names.each_with_index do |name, index|
  user = User.find_or_create_by!(email: "user#{index + 1}@example.com") do |u|
    u.name = name
    u.password = "password123"
    u.password_confirmation = "password123"
  end
  users << user
end

puts "Created #{users.count} users."

# レビューのタイトルと本文のテンプレート
review_titles = [
  "最高のゲーム体験！",
  "期待を超える作品",
  "時間を忘れてしまう",
  "グラフィックが美しい",
  "ストーリーが素晴らしい",
  "ゲームプレイが面白い",
  "リプレイ価値あり",
  "おすすめです",
  "満足のいく内容",
  "期待していた以上",
  "少し物足りない",
  "改善の余地あり",
  "中々の良作",
  "プレイする価値あり",
  "時間がもったいない",
  "期待外れだった",
  "普通のゲーム",
  "悪くはない",
  "良い点と悪い点",
  "総合的に良い",
  "初心者にもおすすめ",
  "上級者向け",
  "マルチプレイが楽しい",
  "シングルプレイ重視",
  "バランスが良い",
  "難易度が適切",
  "やり込み要素あり",
  "カジュアル向け",
  "ハードコア向け",
  "幅広い層におすすめ"
]

# レビュー本文を50文字〜200文字で生成する関数
def generate_review_body(min_chars: 50, max_chars: 200)
  body_parts = [
    "このゲームは本当に素晴らしいです。",
    "期待していた以上に面白かったです。",
    "ゲームプレイが非常にスムーズで、操作性も良いです。",
    "ストーリーが感動的で、キャラクターも魅力的です。",
    "グラフィックが非常に美しく、世界観に没入できます。",
    "難易度が適切で、初心者でも楽しめる内容になっています。",
    "やり込み要素が多く、長く楽しめるゲームだと思います。",
    "マルチプレイが楽しく、友達と一緒にプレイするのがおすすめです。",
    "音楽も素晴らしく、全体的に完成度が高い作品です。",
    "少し物足りない部分もありますが、全体的には良いゲームです。",
    "期待していたほどではなかったですが、悪くはないです。",
    "改善の余地はありますが、プレイする価値はあると思います。",
    "中々の良作です。時間があればプレイしてみてください。",
    "普通のゲームですが、悪くはないです。",
    "良い点と悪い点がありますが、総合的には良いと思います。",
    "初心者にもおすすめできる内容になっています。",
    "上級者向けの難易度設定で、やりがいがあります。",
    "バランスが良く、幅広い層におすすめできるゲームです。",
    "カジュアルに楽しめる内容で、気軽にプレイできます。",
    "ハードコアなプレイヤーにも満足してもらえる内容です。",
    "時間を忘れてプレイしてしまいます。",
    "続編が楽しみです。",
    "リプレイ価値が高い作品だと思います。",
    "細かい部分までこだわりが感じられます。",
    "開発チームの情熱が伝わってきます。",
    "オンライン対戦が特に面白いです。",
    "ストーリーモードが充実しています。",
    "グラフィックの美しさに驚きました。",
    "サウンドトラックも素晴らしいです。",
    "コントローラーの操作感が良いです。",
    "UIが分かりやすくて使いやすいです。",
    "チュートリアルが丁寧で初心者にも優しいです。",
    "エンディングまで楽しめました。",
    "隠し要素が多くて探索が楽しいです。",
    "キャラクターの成長システムが面白いです。",
    "武器や装備の種類が豊富です。",
    "マップが広くて探索が楽しいです。",
    "ボス戦が迫力満点です。",
    "クエストが充実していて飽きません。",
    "カスタマイズ要素が豊富です。"
  ]
  
  target_length = rand(min_chars..max_chars)
  body = ""
  
  # 目標文字数に達するまでパーツを追加
  while body.length < target_length
    part = body_parts.sample
    # 既に十分な長さの場合は終了
    if body.length + part.length > max_chars
      break
    end
    body += part
    # 次のパーツを追加する前にスペースを追加（既にスペースで終わっていない場合）
    body += " " unless body.end_with?("。", "、", " ")
  end
  
  # 目標文字数に達していない場合は、追加の文章を補完
  if body.length < min_chars
    additional_parts = [
      "全体的に満足できる内容でした。",
      "プレイして良かったと思います。",
      "おすすめできるゲームです。",
      "時間をかけてプレイする価値があります。",
      "ぜひ体験してみてください。"
    ]
    while body.length < min_chars && additional_parts.any?
      part = additional_parts.sample
      if body.length + part.length <= max_chars
        body += " " + part
      else
        break
      end
    end
  end
  
  # 最大文字数を超えている場合は切り詰める
  body = body[0, max_chars] if body.length > max_chars
  
  body.strip
end

# 各game_platformに対して50個のレビューを作成
puts "\nCreating reviews for each game platform..."
GamePlatform.find_each.with_index do |game_platform, index|
  puts "Creating reviews for game platform #{index + 1}/#{GamePlatform.count}..." if (index + 1) % 10 == 0
  
  50.times do
    Review.create!(
      user: users.sample,
      game_platform: game_platform,
      score: rand(0..100),
      title: review_titles.sample,
      body: generate_review_body,
      is_public: rand(0..1) == 1,
      likes_count: rand(0..100),
      created_at: rand(365).days.ago,
      updated_at: rand(365).days.ago
    )
  end
end

# game_platformのaverage_scoreとreview_countを更新
puts "\nUpdating game platform statistics..."
GamePlatform.find_each do |game_platform|
  reviews = game_platform.reviews
  if reviews.any?
    game_platform.update!(
      average_score: reviews.average(:score).round(1),
      review_count: reviews.count
    )
  end
end

puts "\nSeeds completed: #{Genre.count} genres, #{Platform.count} platforms, #{Game.count} games, #{User.count} users, #{Review.count} reviews created."
