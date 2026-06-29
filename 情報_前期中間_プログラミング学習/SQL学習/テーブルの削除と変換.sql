CREATE DATABASE shop;

CREATE TABLE shop 
(shohin_id CHAR(4) NOT NULL, 
shohin_mei varchar(100) NOT NULL,
shohin_kubun varchar(100) NOT NULL,
hanbi_tanka integer ,
shilire_tanka integer ,
tourokubi date,
PRIMARY KEY (shohin_id),
); 



DROP TABLE shop; /*DROP TABLEの意味は、shopテーブルを削除するという意味である。
DROP TABLEを実行すると、shopテーブルに格納されているデータもすべて削除されるため、注意が必要である。*/

ALTER TABLE shop ADD COLUMN shohin_bunrui varchar(100); /*ALTER TABLEの意味は、shopテーブルに新しい列を追加するという意味である。
ALTER TABLEを実行すると、shopテーブルの構造が変更されるため、既存のデータに影響を与える可能性がある。*/

ALTER TABLE shop DROP shohin_id; --ALTER TABLEの意味は、shopテーブルからshohin_bunrui列を削除するという意味である。
ALTER TABLE shop DROP (shohin_mei,shohin_kubun);--一度に削除するときは(,,)で囲む必要がある。