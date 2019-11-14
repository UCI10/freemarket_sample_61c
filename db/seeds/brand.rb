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

# サ行
chanel = s_line.children.create(name: "シャネル")
supreme = s_line.children.create(name: "シュプリーム")

# ナ行
nike = n_line.children.create(name: "ナイキ")

# ラ行
louis_vuitton = r_line.children.create(name: "ルイヴィトン")



