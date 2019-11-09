#親カテゴリ:レディース
lady = Category.create(name: "レディース")
#子カテゴリ,孫カテゴリ:レディース
lady_tops = lady.children.create(name: "トップス")
lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"},{name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ/ブラウス(半袖/袖なし)"},{name: "シャツ/ブラウス(七分/長袖)"},{name: "ポロシャツ"},{name: "キャミソール"},{name: "タンクトップ"},{name: "ホルターネック"},{name: "ニット/セーター"},{name: "チュニック"},{name: "カーディガン/ボレロ"},{name: "アンサンブル"},{name: "ベスト/ジレ"},{name: "パーカー"}])

lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_jacket.children.create([{name: "テーラードジャケット"},{name: "ノーカラージャケット"},{name: "Gジャン/デニムジャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"},{name: "ライダースジャケット"},{name: "ミリタリージャケット"},{name: "ダウンベスト"},{name: "ジャンパー/ブルゾン"},{name: "ポンチョ"},{name: "ロングコート"},{name: "トレンチコート"},{name: "ダッフルコート"},{name: "ピーコート"}])

lady_pants = lady.children.create(name: "パンツ")
lady_pants.children.create([{name: "デニム/ジーンズ"},{name: "ショートパンツ"},{name: "カジュアルパンツ"},{name: "ハーフパンツ"},{name: "チノパン"},{name: "ワークパンツ/カーゴパンツ"},{name: "クロップドパンツ"},{name: "サロペット/オーバーオール"},{name: "オールインワン"},{name: "サルエルパンツ"},{name: "ガウチョパンツ"},{name: "その他"}])

lady_skirt = lady.children.create(name: "スカート")
lady_skirt.children.create([{name: "ミニスカート"},{name: "ひざ丈スカート"},{name: "ロングスカート"},{name: "キュロット"},{name: "その他"}])

lady_onepiece = lady.children.create(name: "ワンピース")
lady_onepiece.children.create([{name: "ミニワンピース"},{name: "ひざ丈ワンピース"},{name: "ロングワンピース"},{name: "その他"}])

lady_shoes = lady.children.create(name: "靴")
lady_shoes.children.create([{name: "ハイヒール/パンプス"},{name: "ブーツ"},{name: "サンダル"},{name: "スニーカー"},{name: "ミュール"},{name: "モカシン"},{name: "ローファー/革靴"},{name: "フラットシューズ/バレエシューズ"},{name: "長靴/レインシューズ"},{name: "その他"}])

lady_roomwear = lady.children.create(name: "ルームウェア/パジャマ")
lady_roomwear.children.create([{name: "パジャマ"},{name: "ルームウェア"}])

lady_legwear = lady.children.create(name: "レッグウェア")
lady_legwear.children.create([{name: "ソックス"},{name: "スパッツ/レギンス"},{name: "ストッキング/タイツ"},{name: "レッグウォーマー"},{name: "その他"}])

lady_hat = lady.children.create(name: "帽子")
lady_hat.children.create([{name: "ニットキャップ/ビーニー"},{name: "ハット"},{name: "ハンチング/ベレー帽"},{name: "キャップ"},{name: "キャスケット"},{name: "麦わら帽子"},{name: "その他"}])

lady_bag = lady.children.create(name: "バッグ")
lady_bag.children.create([{name: "ハンドバッグ"},{name: "トートバッグ"},{name: "エコバッグ"},{name: "リュック/バックパック"},{name: "ボストンバッグ"},{name: "スポーツバッグ"},{name: "ショルダーバッグ"},{name: "クラッチバッグ"},{name: "ポーチ/バニティ"},{name: "ボディバッグ/ウェストバッグ"},{name: "マザーズバッグ"},{name: "メッセンジャーバッグ"},{name: "ビジネスバッグ"},{name: "旅行用バッグ/キャリーバッグ"}])

lady_accesary = lady.children.create(name: "アクセサリー")
lady_accesary.children.create([{name: "ネックレス"},{name: "ブレスレット"},{name: "バングル/リストバンド"},{name: "リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "イヤリング"},{name: "アンクレット"},{name: "ブローチ/コサージュ"},{name: "チャーム"},{name: "その他"}])

lady_hairaccesary = lady.children.create(name: "ヘアアクセサリー")
lady_hairaccesary.children.create([{name: "ヘアゴム/シュシュ"},{name: "ヘアバンド/カチューシャ"},{name: "ヘアピン"},{name: "その他"}])

lady_goods = lady.children.create(name: "小物")
lady_goods.children.create([{name: "長財布"},{name: "折り財布"},{name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},{name: "手袋/アームカバー"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー/ショール"},{name: "ストール/スヌード"},{name: "バンダナ/スカーフ"},{name: "ネックウォーマー"},{name: "サスペンダー"}])

lady_watch = lady.children.create(name: "時計")
lady_watch.children.create([{name: "腕時計(アナログ)"},{name: "腕時計(デジタル)"},{name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])

#親カテゴリ:メンズ
men = Category.create(name: "メンズ")
#子カテゴリ,孫カテゴリ:メンズ
men_tops = men.children.create(name: "トップス")
men_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"シャツ"},{name:"ポロシャツ"},{name:"タンクトップ"},{name:"ニット/セーター"},{name:"パーカー"},{name:"カーディガン"},{name:"ジャージ"},{name:"ベスト"},{name:"その他"}])

men_jacket = men.children.create(name: "ジャケット/アウター")
men_jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"},{name:"Gジャン/デニムジャケット"},{name:"レザージャケット"},{name:"ダウンジャケット"},{name:"ライダースジャケット"},{name:"ミリタリージャケット"},{name:"ナイロンジャケット"},{name:"フライトジャケット"},{name:"ダッフルコート"},{name:"ピーコート"},{name:"ステンカラーコート"},{name:"トレンチコート"},{name:"モッズコート"}])

men_pants = men.children.create(name: "パンツ")
men_pants.children.create([{name:"デニム/ジーンズ"}, {name:"ワークパンツ/カーゴパンツ"},{name:"スラックス"},{name:"チノパン"},{name:"ショートパンツ"},{name:"ペインターパンツ"},{name:"サルエルパンツ"},{name:"オーバーオール"},{name:"その他"}])

men_shoes = men.children.create(name: "靴")
men_shoes.children.create([{name:"スニーカー"},{name:"サンダル"},{name:"ブーツ"},{name:"モカシン"},{name:"ドレス/ビジネス"},{name:"長靴/レインシューズ"},{name:"デッキシューズ"},{name:"その他"}])

men_bag = men.children.create(name: "バッグ")
men_bag.children.create([{name:"ショルダーバッグ"}, {name:"トートバッグ"},{name:"ボストンバッグ"},{name:"リュック/バックパック"},{name:"ウェストポーチ"},{name:"ボディーバッグ"},{name:"ドラムバッグ"},{name:"ビジネスバッグ"},{name:"トラベルバッグ"},{name:"ビジネスバッグ"},{name:"トラベルバッグ"},{name:"メッセンジャーズバッグ"},{name:"エコバッグ"},{name:"その他"}])

men_suit = men.children.create(name: "スーツ")
men_suit.children.create([{name:"スーツジャケット"}, {name:"スーツベスト"},{name:"スラックス"},{name:"セットアップ"},{name:"その他"}])

men_hat = men.children.create(name: "帽子")
men_hat.children.create([{name:"キャップ"},{name:"ハット"},{name:"ニットキャップ/ビーニー"}, {name:"ハンチング/ベレー"},{name:"キャスケット"},{name:"サンバイザー"},{name:"その他"}])

men_accesary = men.children.create(name: "アクセサリー")
men_accesary.children.create([{name:"ネックレス"}, {name:"ブレスレット"},{name:"バングル/リストバンド"},{name:"リング"},{name:"ピアス（片耳用）"},{name:"ピアス（両耳用）"},{name:"イヤリング"},{name:"アンクレット"},{name:"その他"}])

men_goods = men.children.create(name: "小物")
men_goods.children.create([{name:"長財布"}, {name:"折財布"},{name:"コインケース/小銭入れ"},{name:"名刺入れ/定期入れ"},{name:"キーケース"},{name:"キーホルダー"},{name:"ネクタイ"},{name:"手袋"},{name:"ハンカチ"},{name:"ベルト"},{name:"マフラー"},{name:"ストール"},{name:"バンダナ"},{name:"サスペンダー"}])

men_watch = men.children.create(name: "時計")
men_watch.children.create([{name:"腕時計（アナログ)"}, {name:"腕時計（デジタル）"},{name:"ラバーベルト"},{name:"レザーベルト"},{name:"金属ベルト"},{name:"その他"}])

men_swimwear = men.children.create(name: "水着")
men_swimwear.children.create([{name:"一般水着"}, {name:"スポーツ用"},{name:"アクセサリー"},{name:"その他"}])

men_legwear = men.children.create(name: "レッグウェア")
men_legwear.children.create([{name: "ソックス"},{name: "レギンス/スパッツ"},{name: "レッグウォーマー"},{name: "その他"}])

men_underwear = men.children.create(name: "アンダーウェア")
men_underwear.children.create([{name:"トランクス"}, {name:"ボクサーパンツ"},{name:"その他"}])

men_other = men.children.create(name: "その他")
men_other.children.create([{name: "すべて"}])

#親カテゴリ:ベビー・キッズ
baby_kids = Category.create(name: "ベビー・キッズ")
#子カテゴリ,孫カテゴリ:ベビー・キッズ
baby_kids_girl  = baby_kids.children.create(name: "ベビー服(女の子用) ~95cm")
baby_kids_girl .children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "スカート"},{name: "ワンピース"},{name: "ベビードレス"},{name: "おくるみ"},{name: "下着/肌着"},{name: "パジャマ"},{name: "ロンパース"},{name: "その他"}])

baby_kids_boy = baby_kids.children.create(name: "ベビー服(男の子用) ~95cm")
baby_kids_boy.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "おくるみ"},{name: "下着/肌着"},{name: "パジャマ"},{name: "ロンパース"},{name: "その他"}])

baby_kids_jacket = baby_kids.children.create(name: "キッズ服(男女兼用) 100cm~")
baby_kids_jacket.children.create([{name: "コート"},{name: "ジャケット/上着"},{name: "トップス(Tシャツ/カットソー)"},{name: "トップス(トレーナー)"},{name: "トップス(その他)"},{name: "ボトムス"},{name: "パジャマ"},{name: "その他"}])

baby_kids_toy = baby_kids.children.create(name: "おもちゃ")
baby_kids_toy.children.create([{name: "おふろのおもちゃ"},{name: "がらがら"},{name: "オルゴール"},{name: "ベビージム"},{name: "手押し車/カタカタ"},{name: "知育玩具"},{name: "その他"}])

baby_kids_eventitem = baby_kids.children.create(name: "行事/記念品")
baby_kids_eventitem.children.create([{name: "お宮参り用品"},{name: "お食い初め用品"},{name: "アルバム"},{name: "手形/足形"},{name: "その他"}])

baby_kids_other = baby_kids.children.create(name: "その他")
baby_kids_other.children.create([{name: "母子手帳用品"},{name: "その他"}])

#親カテゴリ:インテリア・住まい・小物
interior = Category.create(name: "インテリア・住まい・小物")
#子カテゴリ,孫カテゴリ:インテリア・住まい・小物
interior_kitchengoods = interior.children.create(name: "キッチン/食器")
interior_kitchengoods.children.create([{name: "食器"},{name: "調理器具"},{name: "収納/キッチン雑貨"},{name: "弁当用品"},{name: "カトラリー(スプーン等)"},{name: "テーブル用品"},{name: "容器"},{name: "エプロン"},{name: "アルコールグッズ"},{name: "浄水機"},{name: "その他"}])

interior_bed = interior.children.create(name: "ベッド/マットレス")
interior_bed.children.create([{name: "セミシングルベッド"},{name: "シングルベッド"},{name: "セミダブルベッド"},{name: "ダブルベッド"},{name: "ワイドダブルベッド"},{name: "クイーンベッド"},{name: "キングベッド"},{name: "脚付きマットレスベッド"},{name: "マットレス"},{name: "すのこベッド"},{name: "ロフトベッド/システムベッド"},{name: "簡易ベッド/折りたたみベッド"},{name: "収納付き"},{name: "その他"}])

interior_sofa = interior.children.create(name: "ソファ/ソファベッド")
interior_sofa.children.create([{name: "ソファセット"},{name: "シングルソファ"},{name: "ラブソファ"},{name: "トリプルソファ"},{name: "オットマン"},{name: "コーナーソファ"},{name: "ビーズソファ/クッションソファ"},{name: "ローソファ/フロアソファ"},{name: "ソファベッド"},{name: "応接セット"},{name: "ソファカバー"},{name: "リクライニングソファ"},{name: "その他"}])

interior_chair = interior.children.create(name: "椅子/チェア")
interior_chair.children.create([{name: "一般"},{name: "スツール"},{name: "ダイニングチェア"},{name: "ハイバックチェア"},{name: "ロッキングチェア"},{name: "座椅子"},{name: "折り畳みイス"},{name: "デスクチェア"},{name: "その他"}])

#親カテゴリ:本・音楽・ゲーム
book_music_game = Category.create(name: "本・音楽・ゲーム")
#子カテゴリ,孫カテゴリ:本・音楽・ゲーム
book_music_game_book  = book_music_game.children.create(name: "本")
book_music_game_book .children.create([{name: "文学/小説"},{name: "人文/社会"},{name: "ノンフィクション/教養"},{name: "地図/旅行ガイド"},{name: "ビジネス/経済"},{name: "ビジネス/経済"},{name: "健康/医学"},{name: "コンピュータ/IT"},{name: "趣味/スポーツ/実用"},{name: "住まい/暮らし/子育て"},{name: "アート/エンタメ"},{name: "洋書"},{name: "絵本"},{name: "参考書"},{name: "その他"}])

book_music_comic = book_music_game.children.create(name: "漫画")
book_music_comic.children.create([{name: "全巻セット"},{name: "少年漫画"},{name: "少女漫画"},{name: "青年漫画"},{name: "女性漫画"},{name: "同人誌"},{name: "その他"}])

book_music_game_magazine = book_music_game.children.create(name: "雑誌")
book_music_game_magazine.children.create([{name: "アート/エンタメ/ホビー"},{name: "ファッション"},{name: "ニュース/総合"},{name: "趣味/スポーツ"},{name: "その他"}])

book_music_game_music  = book_music_game.children.create(name: "CD")
book_music_game_music .children.create([{name: "邦楽"},{name: "洋楽"},{name: "アニメ"},{name: "クラシック"},{name: "K-POP/アジア"},{name: "キッズ/ファミリー"},{name: "その他"}])

book_music_game_dvd = book_music_game.children.create(name: "DVD/ブルーレイ")
book_music_game_dvd.children.create([{name: "外国映画"},{name: "日本映画"},{name: "アニメ"},{name: "TVドラマ"},{name: "ミュージック"},{name: "お笑い/バラエティ"},{name: "スポーツ/フィットネス"},{name: "キッズ/ファミリー"},{name: "その他"}])

book_music_game_game = book_music_game.children.create(name: "テレビゲーム")
book_music_game_game.children.create([{name: "家庭用ゲーム本体"},{name: "家庭用ゲームソフト"},{name: "携帯用ゲーム本体"},{name: "携帯用ゲームソフト"},{name: "PCゲーム"},{name: "その他"}])

#親カテゴリ:おもちゃ・ホビー・グッズ
toy_hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
#子カテゴリ,孫カテゴリ:おもちゃ・ホビー・グッズ
toy_hobby_toy = toy_hobby.children.create(name: "おもちゃ")
toy_hobby_toy.children.create([{name: "キャラクターグッズ"},{name: "ぬいぐるみ"},{name: "小物/アクセサリー"},{name: "模型/プラモデル"},{name: "ミニカー"},{name: "トイラジコン"},{name: "プラモデル"},{name: "ホビーラジコン"},{name: "鉄道模型"},{name: "その他"}])

toy_hobby_talent = toy_hobby.children.create(name: "タレントグッズ")
toy_hobby_talent.children.create([{name: "アイドル"},{name: "ミュージシャン"},{name: "タレント/お笑い芸人"},{name: "スポーツ選手"},{name: "その他"}])

toy_hobby_anime = toy_hobby.children.create(name: "コミック/アニメグッズ")
toy_hobby_anime.children.create([{name: "ストラップ"},{name: "キーホルダー"},{name: "バッジ"},{name: "カード"},{name: "クリアファイル"},{name: "ポスター"},{name: "タオル"},{name: "その他"}])

toy_hobby_card = toy_hobby.children.create(name: "トレーディングカード")
toy_hobby_card.children.create([{name: "遊戯王"},{name: "マジック：ザ・ギャザリング"},{name: "ポケモンカードゲーム"},{name: "デュエルマスターズ"},{name: "バトルスピリッツ"},{name: "プリパラ"},{name: "アイカツ"},{name: "カードファイト!! ヴァンガード"},{name: "ヴァイスシュヴァルツ"},{name: "プロ野球オーナーズリーグ"},{name: "ベースボールヒーローズ"},{name: "ドラゴンボール"},{name: "スリーブ"},{name: "その他"}])

#親カテゴリ:コスメ・香水・美容
beauty = Category.create(name: "コスメ・香水・美容")
#子カテゴリ,孫カテゴリ:コスメ・香水・美容
beauty_basemakeup = beauty.children.create(name:"ベースメイク")
beauty_basemakeup.children.create([{name:"ファンデーション"}, {name:"化粧下地"},{name:"コントロールカラー"},{name:"BBクリーム"},{name:"CCクリーム"},{name:"コンシーラー"},{name:"フェイスパウダー"},{name:"トライアルセット/サンプル"},{name:"その他"}])

beauty_makeup = beauty.children.create(name:"メイクアップ")
beauty_makeup.children.create([{name:"アイシャドウ"}, {name:"口紅"},{name:"リップグロス"},{name:"リップライナー"},{name:"チーク"},{name:"フェイスカラー"},{name:"マスカラ"},{name:"アイライナー"},{name:"つけまつげ"},{name:"アイブロウペンシル"},{name:"パウダーアイブロウ"},{name:"眉マスカラ"},{name:"トライアルセット/サンプル"},{name:"メイク道具/化粧小物"},{name:"美顔用品/美顔ローラー"},{name:"その他"}])

beauty_nailcare = beauty.children.create(name:"ネイルケア")
beauty_nailcare.children.create([{name:"ネイルカラー"}, {name:"カラージェル"},{name:"ネイルベースコート/トップコート"},{name:"ネイルアート用品"},{name:"ネイルパーツ"},{name:"ネイルチップ/付け爪"},{name:"手入れ用具"},{name:"除光液"},{name:"その他"}])

beauty_perfume = beauty.children.create(name:"香水")
beauty_perfume.children.create([{name:"香水（女性用）"}, {name:"香水（男性用）"},{name:"ユニセックス"},{name:"ボディミスト"},{name:"その他"}])

beauty_skincare = beauty.children.create(name:"スキンケア/基礎化粧品")
beauty_skincare.children.create([{name:"化粧水/ローション"}, {name:"乳液/ミルク"},{name:"美容液"},{name:"フェイスクリーム"},{name:"洗顔料"},{name:"クレンジング/メイク落とし"},{name:"パック/フェイスマスク"},{name:"ジェル/ゲル"},{name:"ブースター/導入液"},{name:"アイケア"},{name:"リップケア"},{name:"トライアルセット/サンプル"},{name:"洗顔グッズ"},{name:"その他"}])


#親カテゴリ:その他
others = Category.create(name: "その他")
#子カテゴリ,孫カテゴリ:その他
others_set = others.children.create(name: "まとめ売り")
others_set.children.create([{name: "すべて"}])

others_petitem = others.children.create(name: "ペット用品")
others_petitem.children.create([{name: "ペットフード"},{name: "犬用品"},{name: "猫用品"},{name: "魚用品/水草"},{name: "小動物用品"},{name: "爬虫類/両生類用品"},{name: "かご/おり"},{name: "鳥用品"},{name: "虫類用品"},{name: "その他"}])

others_food = others.children.create(name: "食品")
others_food.children.create([{name: "菓子"},{name: "米"},{name: "野菜"},{name: "果物"},{name: "調味料"},{name: "魚介類(加工食品)"},{name: "肉類(加工食品)"},{name: "その他 加工食品"},{name: "その他"}])

others_drink = others.children.create(name: "飲料/酒")
others_drink.children.create([{name: "コーヒー"},{name: "ソフトドリンク"},{name: "ミネラルウォーター"},{name: "茶"},{name: "ウイスキー"},{name: "ワイン"},{name: "ブランデー"},{name: "焼酎"},{name: "日本酒"},{name: "ビール、発泡酒"},{name: "その他"}])

others_daily = others.children.create(name: "日用品/生活雑貨/旅行")
others_daily.children.create([{name: "タオル/バス用品"},{name: "日用品/生活雑貨"},{name: "洗剤/柔軟剤"},{name: "旅行用品"},{name: "防災関連グッズ"},{name: "その他"}])

others_other = others.children.create(name: "その他")
others_other.children.create([{name: "すべて"}])
