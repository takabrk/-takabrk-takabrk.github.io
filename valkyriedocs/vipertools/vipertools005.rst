.. Viper Tools documentation master file, created by
   sphinx-quickstart on Wed Feb  3 16:26:19 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


ナンバーズ予想用モジュール
=========================

download_data.pyのクラス生成
============================

クラスの生成は以下のように行います。::

 dd = download_data()
download_dataモジュールのメソッド
================================


download_html
--------------

みずほ銀行の宝くじ結果ページからHTMLをダウンロードします::

 k.db2list()


set_list,set_list2,set_list3
-----------------------------

当選結果日時を参考にHTMLファイルの名称をつける為のリストを生成します。::

 k.set_list()

 k.set_list2()

 k.set_list3()

load_numbers.pyモジュールのクラス生成
====================================

クラスの生成は以下のように行います。::

 nl = numbers_list()

make_list3_total
-----------------

ナンバーズ3の過去の当選結果のリストを生成します。::

 nl.make_list3_total()

make_list4_total
-----------------

ナンバーズ4の過去の当選結果のリストを生成します。::

 nl.make_list4_total()

set_list,set_list2,set_list3
-----------------------------

HTMLファイル群のリストを生成します。::

 nl.set_list()
 nl.set_list2()
 nl.set_list3()

make_list3,new_make_list3
--------------------------

ナンバーズ3の当選結果ページをパースして、データを取り出します。::

 nl.make_list3("xxx.html")
 nl.new_make_list3("yyy.html")

make_list4,new_make_list4
--------------------------

ナンバーズ4の当選結果ページをパースして、データを取り出します。::

 nl.make_list4("xxx.html")
 nl.new_make_list4("yyy.html")

write_file
-----------

ナンバーズ3とナンバーズ4の結果データのリストをファイルに書き込みます。::

 nl.write_file()

numbers.pyモジュールのクラス生成
================================

クラス生成は以下のように行います。::

 n3 = numbers3()
 n4 = numbers4()

makeMiniNumber1 etc
--------------------

ナンバーズ3ミニの基本数字を生成します。::

 n3.makeMiniNumber1()
 n3.makeMiniNumber2()
 n3.makeMiniNumber3()
