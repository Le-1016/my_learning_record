import math
# ============================================================
# Python 計算まとめ
# ============================================================

# ── 四則演算 ──────────────────────────────────────────────
print(10 + 3)    # 13  加算
print(10 - 3)    # 7   減算
print(10 * 3)    # 30  乗算
print(10 / 3)    # 3.333... 除算（小数）
print(10 // 3)   # 3   整数除算（切り捨て）
print(10 % 3)    # 1   剰余（あまり）
print(10 ** 3)   # 1000 べき乗

# ── 負の数の剰余（演習1で使った） ───────────────────────
print(-10 % 512)   # 502
print(-508 % 512)  # 4

# ── 比較演算 ──────────────────────────────────────────────
print(5 > 3)    # True
print(5 < 3)    # False
print(5 >= 5)   # True
print(5 <= 4)   # False
print(5 == 5)   # True
print(5 != 3)   # True

# ── 論理演算 ──────────────────────────────────────────────
print(True and False)  # False
print(True or False)   # True
print(not True)        # False

# ── 型変換 ────────────────────────────────────────────────
print(int(3.7))    # 3    小数→整数（切り捨て）
print(float(3))    # 3.0  整数→小数
print(str(123))    # '123' 数値→文字列
print(abs(-5))     # 5    絶対値

# ── math ライブラリ ───────────────────────────────────────
import math

print(math.sqrt(16))        # 4.0   平方根
print(math.pi)              # 3.14159... 円周率
print(math.e)               # 2.71828... ネイピア数
print(math.floor(3.7))      # 3     切り捨て
print(math.ceil(3.2))       # 4     切り上げ
print(math.factorial(5))    # 120   階乗 5!
print(math.log(math.e))     # 1.0   自然対数
print(math.log10(1000))     # 3.0   常用対数
print(math.log2(8))         # 3.0   2を底とする対数

# 三角関数（引数はラジアン）
print(math.sin(math.pi / 2))   # 1.0
print(math.cos(0))             # 1.0
print(math.tan(math.pi / 4))   # 1.0

# 角度変換
print(math.degrees(math.pi))   # 180.0  ラジアン→度
print(math.radians(180))       # 3.14...  度→ラジアン

# 2点間の距離（演習3で使った考え方）
x1, y1 = 0, 0
x2, y2 = 3, 4
print(math.sqrt((x2-x1)**2 + (y2-y1)**2))  # 5.0

# ── NumPy ベクトル計算（演習3で使った） ───────────────────
import numpy as np

a = np.array([3, 4])
b = np.array([1, 2])

print(a + b)               # [4 6]  ベクトル加算
print(a - b)               # [2 2]  ベクトル減算
print(a * 2)               # [6 8]  スカラー倍
print(np.dot(a, b))        # 11     内積
print(np.linalg.norm(a))   # 5.0    ノルム（長さ）

# 単位ベクトル
print(a / np.linalg.norm(a))   # [0.6 0.8]

# 垂直ベクトル（90度回転）
def perp(v):
    return np.array([-v[1], v[0]])

print(perp(np.array([1, 0])))  # [0 1]