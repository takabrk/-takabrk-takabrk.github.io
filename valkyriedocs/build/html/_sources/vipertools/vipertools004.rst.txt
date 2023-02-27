.. Viper Tools documentation master file, created by
   sphinx-quickstart on Wed Feb  3 16:26:19 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


kyotei.pyのクラス生成
=====================

クラスの生成は以下のように行います。::

 k = kyotei()
kyoteiモジュールのメソッド
=========================


db2list
--------

データベースのデータをPythonのリストに変換します。::

 k.db2list()

k_sym
------

全国での勝率・２連率やモーター２連率、ボート連率から予想を行います。::

 k.k_sym()

