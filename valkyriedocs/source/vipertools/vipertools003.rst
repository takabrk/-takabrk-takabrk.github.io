.. Viper Tools documentation master file, created by
   sphinx-quickstart on Wed Feb  3 16:26:19 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


viper.pyをPythonファイルにモジュールとして読み込ませる
====================================================

各種メソッドは、viper.pyを該当するスクリプトにimport文を使ってインポートして使っていきます。::

 from viper import *

viperモジュールのクラス生成
==========================

クラスの生成は以下のように行います。::

 v = viper()

viperモジュールのメソッド
=========================

setupValkyrie
-----------------

Ubuntu系LinuxディストリビューションをオリジナルOS「Valkyrie SRX」に変換します。::

 v.setupValkyrie()

installApplications
---------------------

オリジナルOS「Valkyrie SRX」に収録しているLinuxアプリケーションをインストールします。::

 v.installApplications()

installPythonModules
---------------------

最小限必要なPythonモジュールをインストールします。::

 v.installPythonModules()

addPPAs
--------

PPAを追加します。::

 v.addPPAs()


set_plymouth
-------------

Linux起動時の画面においてアニメーションをさせる際のファイルをペーストします。::

 v.set_plymouth()

set_sources_list
-----------------

PPAのリポジトリを追加します。::

 v.set_sources_list()


set_wireless_poweroff
----------------------

無線LANのパワーマネージメント機能をオフにします。::

 v.wireless_poweroff()

set_blacklist
----------------

Linuxで認識したくないハードウェアのリストをセットします。::

 v.set_blacklist()

del_dpkg_info
--------------

Linuxでアプリケーションのインストール時に一緒に設置されるファイルを削除して、apt-get upgradeなどのコマンドでエラーが出ないようにします。::

 v.del_dpkg_info()

update_rc
-----------

rc.localを更新します。::

 v.update_rc()

off_service
------------

Ubuntuで動作しているサービスをオフにします。::

 v.off_service()

faststart
----------

Ubuntuのシステム起動を高速化します。::

 v.faststart()

talk
------

コンピューターにテキストファイルに書いた文字列を読ませます。::

 v.talk("xxx.txt","mei_happy","data")

ramdisk_slider
---------------

tmpfsでRAMDISKを設定します。::

 v.ramdisk_slider()

image_info
-----------

画像の情報を取得します。::

 v.image_info("xxx.jpg")

image_flip
-----------

画像を反転させます。::

 左右反転
 v.image_flip("xxx.jpg","left_right")

 上下反転
 v.image_flip("xxx.jpg","top_bottom")


sudoku
-------

数独を解きます。::

 v.sudoku()
