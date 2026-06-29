#range関数を使って0から4までの数をどのように出力するか観測した。
for i in range(4):
    print(i + 1)

#続いてlen関数を使って基盤コースが何個あるか調べるコードを作成した。
classes = ['M', 'D', 'E', 'I']

print('基盤コースの数: ' + str(len(classes)))

#range関数を応用して、番号と果物の名前を出力するプログラムを作成した。
#なお、0からカウントされるので+1をしてわかりやすくした。
classes = ['M', 'D', 'E', 'I']

for i in range(len(classes)):
    print(i + 1, classes[i])

