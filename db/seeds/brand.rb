#親カテゴリ
a_line = Brand.create(name: "ア行")
k_line = Brand.create(name: "カ行")
s_line = Brand.create(name: "サ行")
t_line  = Brand.create(name: "タ行")
n_line  = Brand.create(name: "ナ行")
h_line  = Brand.create(name: "ハ行")
m_line  = Brand.create(name: "マ行")
y_line  = Brand.create(name: "ヤ行")
r_line  = Brand.create(name: "ラ行")
w_line  = Brand.create(name: "ワ行")


# 子カテゴリ

# ア行
adidas = a_line.children.create(name: "アディダス")
a_bathing_ape = a_line.children.create(name: "ア ベイシング エイプ")
adam_et_rope = a_line.children.create(name: "アダム エ ロペ")
aeta = a_line.children.create(name: "アエタ")
amaca = a_line.children.create(name: "アマカ")
asics = a_line.children.create(name: "アシックス")

# カ行
keen = k_line.children.create(name: "キーン")
good_on = k_line.children.create(name: "グッドオン")
craft = k_line.children.create(name: "クラフト")
gregory = k_line.children.create(name: "グレゴリー")
converse = k_line.children.create(name: "コンバース")

# サ行
chanel = s_line.children.create(name: "シャネル")
supreme = s_line.children.create(name: "シュプリーム")
surf_eight = s_line.children.create(name: "サーフエイト")
cpfu= s_line.children.create(name: "シーピーエフユー")
suria = s_line.children.create(name: "スリア")

# タ行
danton = t_line.children.create(name: "ダントン")
chums = t_line.children.create(name: "チャムス")
champion = t_line.children.create(name: "チャンピオン")
tyr = t_line.children.create(name: "ティア")
descente = t_line.children.create(name: "デサント")

# ナ行
nike = n_line.children.create(name: "ナイキ")
nanga = n_line.children.create(name: "ナンガ")
new_balance = n_line.children.create(name: "ニューバランス")
new_line = n_line.children.create(name: "ニューライン")

# ハ行
hard_tail = h_line.children.create(name: "ハードテイル")
barbarian = h_line.children.create(name: "バーバリアン")
hurley = h_line.children.create(name: "ハーレー")
patagonia = h_line.children.create(name: "パタゴニア")
prana = h_line.children.create(name: "プラナ")
pualani = h_line.children.create(name: "プアラニ")
briefing = h_line.children.create(name: "ブリーフィング")

# マ行
maxim = m_line.children.create(name: "マキシム")
manastash = m_line.children.create(name: "マナスタッシュ")
mystery_ranch = m_line.children.create(name: "ミステリーランチ")
merrell = m_line.children.create(name: "メレル")

# ヤ行
yanuk = y_line.children.create(name: "ヤヌーク")
united_arrows = y_line.children.create(name: "ユナイテッドアローズ")
u_ni_ty = y_line.children.create(name: "ユニティー")
yorkland = y_line.children.create(name: "ヨークランド")

# ラ行
rasox = r_line.children.create(name: "ラソックス")
rash = r_line.children.create(name: "ラッシュ")
rreebok = r_line.children.create(name: "リーボック")
louis_vuitton = r_line.children.create(name: "ルイヴィトン")
rvca = r_line.children.create(name: "ルカ")
ronhill = r_line.children.create(name: "ロンヒル")

# ワ行
wired = w_line.children.create(name: "ワイアード")
y_three = w_line.children.create(name: "ワイスリー")
wako = w_line.children.create(name: "ワコー")
one_of_kind = w_line.children.create(name: "ワンオブカインド")

