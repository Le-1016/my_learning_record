#int関数は文字列を整数に変換する関数である。
a = "123"
b = int(a)
print(b)
print(type(b))
#ちなみに、英単語でintは「整数」という意味である。

#float関数は文字列を浮動小数点数に変換する関数である。
c = "456.789"
d = float(c)
print(d)
print(type(d))
#ちなみに、英単語でfloatは「浮動小数点数」という意味である。

#map関数はリストの各要素に指定した関数を適用する関数である。
numbers = [1, 2, 3, 4, 5]
squared_numbers = list(map(lambda x: x**2, numbers))
print(squared_numbers) 
#ちなみに、英単語でmapは「地図」ではなく「写真を撮る」という意味である。

#ついでに、intとmapを組み合わせて、文字列のリストを整数のリストに変換することもできる。
string_numbers = ['1', '2', '3', '4', '5']
integer_numbers = list(map(int, string_numbers))
print(integer_numbers)

#また、floatとmapを組み合わせて、文字列のリストを浮動小数点数のリストに変換することもできる。
scores_str = ['3.5', '7.2', '10.0']

scores = list(map(float, scores_str))

print(scores)
#このように、文字列のリストが浮動小数点数のリストに変換された。