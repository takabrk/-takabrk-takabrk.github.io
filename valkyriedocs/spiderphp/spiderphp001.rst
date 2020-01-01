.. Spider Web Framework documentation master file, created by
   sphinx-quickstart on Tue Feb  2 20:24:38 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


spider.php
==========
spider.phpは、サーバサイドで行う事が出来る処理を纏めたライブラリです。

* Googl Map APIを使った女子校の地図の表示
* 各種データをセレクトボックスで選択出来るアプリケーションを生成する機能
* 各種データをテーブルレイアウトで表示出来るアプリケーションを生成する機能
* データベースを参照してJSONを作成
* Webページをファイルとして保存
* PHPの配列をJavaScriptの配列に変換
* AtomをXSLTを使ってHTMLに変換
* RSSの読み込み
* RSSをHTMLのリストに変換
* ディレクトのファイル一覧を配列に変換
* リモートページを取得する事が出来ます。
* 取得したページをテキストに変換
* 複数のページの一部分を書き換える
* ImageMagikを使ったサムネイルの生成
* カレンダーの表示

spider.phpを使う
----------------

spider.phpの呼び出し方
^^^^^^^^^^^^^^^^^^^^^^
PHPファイルの上部に以下の文を付け加えます。::

 require_once("Spider/spider.php");

クラスの生成
^^^^^^^^^^^^
クラスを生成したい場合には、以下のように行います。::

 $s = new spider();

メソッド
=============

connectDB
---------

データベースに接続します。::

 $sdb = $s->connectDB("mysql","database name","host name","user name","password");

createjson
----------

データベースからデータを取り出し、JSONに変換します。::

 $s->createjson($sdb,$table_name,$mode);

$sdbは接続したデータベース、$table_nameは接続するテーブル名、$modeはJSONに変換するモード名です。
変換出来るモードは以下の通りです。

address - テーブルのid,name,addressの項目のデータを取り出す
description - テーブルのid,name,descriptionの項目のデータを取り出す
db - テーブルのid,name,address,descriptionの項目のデータを取り出す
geo - テーブルのid,name,address,descriptionの項目のデータを取り出す

smartyAccess
-------------

smartyAccessは、テンプレートエンジン「Smarty」のテンプレート、キャッシュなどのディレクトリを指定するメソッドです。::

 $s->smartyAccess()

json2smarty
------------

JSONデータをSmartyのテンプレートに挿入します。::

 $s->json2smarty($json_src,$smarty_template);

$json_srcは、JSONが保存されているディレクトリを指定します。
$smarty_templateは、Smarty用のテンプレートを指定します。

json2map
---------

JSONデータをSmartyテンプレートとGoogleMaps APIを使って地図表示します。::

 $s->json2map($json_src,$smarty_template);

$json_srcは、JSONが保存されているディレクトリを指定します。
$smarty_templateは、Smarty用のテンプレートを指定します。

superDB
--------

superDBメソッドは、MySQLで構築したデータベースにアクセスして、テンプレートエンジン「Smarty」を通してセレクトボックスを使ったアプリ、GoogleMaps APIを使った地図アプリなどを表示する事が可能です。::

 $s->superDB($mode);

$modeには、表示したいタイプを入力します。
$modeで用意しているタイプは以下の通りです。
news - ニュースサイトのリンク集
mugen - 格闘ゲームエンジン「M.U.G.E.N」のリンク集
crimemap - 犯罪が起こっている場所を地図に表示
crime2 - 新聞報道などが行われた事件・事故のデータベース
schoolmap - 女子校の所在地マップの表示
technology - 日本の主要な理工系大学の所在地マップの表示
university - 西日本の大学の総合力ランキングのデータベース
school_rank - 関西の高校の総合力ランキングのデータベース
company - ブラック企業のデータベース

json_indent
-----------

PHP 5.3以下の場合、標準ライブラリにあるjson_encodeでJSONを整形する事が出来ませんので、代わりにこのメソッドを使う事で、PHP 5.3以下でもJSONを整形する事が可能になります。 ::

 $s->json_indent("xxx.json");

writeFile
---------

ファイルを書き出します::

 $s->writeFile("url","file","binary");
 $s->writeFile("url","file","plain");

arrayForJS
----------

フォルダ内のファイル名の一覧を取得後、JavaScript用の配列に変換します。::

 $s = new spider();
 $s->arrayForJS(ディレクトリ名,配列の変数名);

atomWithXSLT
------------

XMLをXSLTで変換することが出来ます。::

 $s->atomWithXSLT(atmのURL,XSL名);

loadRSS
-------

RSSを読み込んで表示します。::

 $s->loadRSS(URL);

RSS2List
--------

RSSをHTMLのリストに変換します。::

 $s->RSS2List(URL);

firefoxBookmarkList
-------------------

Webブラウザ「Firefox」のブックマークをHTMLのテーブルにします。::

 $s->firefoxBookmarkList(ファイル名);

createArray
-----------

ディレクトリのファイルを読み出して配列で返します。::

 $s->createArray(ディレクトリ名);

getRemortPage
-------------

リモートページを取得することが出来ます。::

 $s->getRemortPage(取得したいWebページのURL,書き出し用ファイル名);

remortPage2text
---------------

取得したページをテキストい変換する。::

 $s = new spider(); $s->remortPage2text(html,始点,終点);

page_parts_change
-----------------

複数ページの一部分を書き換えることが出来ます。::

 $s->page_parts_change(ディレクトリ名,ページ数,キーワード,スクラップの最初の部分,スクラップの最後の部分,書き出し用のファイル名);

pageScrap
---------

ページをスクラップします。::

 $s->pageScrap(ディレクトリ名,ページ数,キーワード,スクラップの最初の部分,スクラップの最後の部分);

make_thumnail
-------------

ImageMagickを利用したサムネイルを生成します。::

 $s->make_thumbnail(元の画像ソースの配列,リサイズした画像の配列,倍率,ImageMagickのURL);

calender
--------

カレンダーを表示する::

 $s = new spider(); $s->calender();
