score = 85
print(f'試験が {score} 点だったので「',end='')
if score >= 90 :
  print('秀',end='')
elif score >= 80 :
  print('優',end='')
elif score >= 70 :
  print('良',end='')
elif score >= 60 :
  print('可',end='')
else :
  print('不可',end='')
print(f'」の評価です。')

import random as r
for i in range(15): # 15連ガチャ
  n = r.random() # 0.0以上1.0未満の実数値
  print(f'{i+1:2}回目 n={n:.3f}') # 乱数確認用

  if n <= 0.1 :
    print('SSR')
  elif n <= 0.25 :
    print('R')
  else :
    print('N')