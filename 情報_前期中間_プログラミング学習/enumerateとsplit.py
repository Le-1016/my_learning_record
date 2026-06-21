#まずは、enumerate関数を使って、番号と果物の名前を出力するプログラムを作成した。

classes = ['M', 'D', 'E', 'I']

for i, class_name in enumerate(classes):
    print(i, class_name)

#enumerate関数を使うと、lenとrangeを使わなくても番号と要素を同時に取得できるので便利である。
#また、1からカウントしたい場合は、enumerate関数の第2引数に1を指定することで、1からカウントすることができる。
for i, class_name in enumerate(classes, start=1):
    print(i, class_name)

#次は、split関数を使って、文字列を分割するプログラムを作成した。
s = 'M/D/E/I'

classes = s.split('/')

print(classes)

#以上で、enumerate関数とsplit関数の出力を学んだ。