#append関数はリストの末尾に要素を追加する関数である。
classes = ['M', 'D', 'E',]

classes.append('I')

print(classes)

#このように、Iが追加された。ちなみに、英単語でappendは「付け加える」という意味である。

#insert関数はリストの指定した位置に要素を追加する関数である。
classes = ['M', 'D', 'E']

classes.insert(3, 'I')

print(classes)

#このように、3番目の位置にIが追加された。ちなみに、英単語でinsertは「挿入する」という意味である。

#index関数はリストの指定した要素が最初に出現する位置を返す関数である。
classes = ['M', 'D', 'E', 'I'] 
print(classes.index('E'))
#このように、Eは2番目の位置にあることがわかる。ちなみに、英単語でindexは「位置」という意味である。

#in演算子はリストの指定した要素がリストに含まれているかどうかを調べる演算子である。
classes = ['M', 'D', 'E', 'I']
print('E' in classes)
print('F' in classes)
#このように、Eはリストに含まれているが、Fはリストに含まれていないことがわかる。ちなみに、英単語でinは「～の中に」という意味である。
