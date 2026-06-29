CREATE DATABASE shop;

CREATE TABLE shop 
(shohin_id CHAR(4) NOT NULL, 
shohin_kubun varchar(100) NOT NULL,
hanbi_tanka integer ,
shilire_tanka integer ,
tourokubi date,
PRIMARY KEY (shohin_id) 
); 

DROP TABLE shop; 

ALTER TABLE shop ADD COLUMN shohin_bunrui varchar(100); 
ALTER TABLE shop DROP shohin_id; 
ALTER TABLE shop DROP (shohin_mei,shohin_kubun);

--DML：データ登録
BEGIN TRANSACTION; /*BEGIN TRANSACTIONの意味は、トランザクションを開始するという意味である。
トランザクションとは、一連のデータベース操作をまとめて実行するための仕組みであり、途中でエラーが発生した場合には、すべての操作を元に戻すことができる。 */