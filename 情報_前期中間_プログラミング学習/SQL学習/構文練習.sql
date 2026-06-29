CREATE DATABASE shop;

CREATE TABLE shop 
(shohin_id CHAR(4) NOT NULL, --NOT NULLの意味は、この列にはNULL値を入れることができないという意味である。つまり、shohin_id列には必ず値が入っていなければならないという制約を設けている。
shohin_mei varchar(100) NOT NULL,
shohin_kubun varchar(100) NOT NULL,
hanbi_tanka integer ,
shilire_tanka integer ,
tourokubi date,
PRIMARY KEY (shohin_id)　--PRIMARY KEYの意味は、shohin_id列を主キーとして設定するという意味である。主キーは、テーブル内の各行を一意に識別するための列であり、重複する値を持つことができない。
);　--ちなみに、KEYとは、インデックスのことを指す。インデックスは、テーブル内のデータを高速に検索するための仕組みであり、主キーや外部キーなどの制約を設定する際にも使用される。

/*複数行をメモ帳とする場合は、
このように、複数行をコメントアウトすることができる。*/