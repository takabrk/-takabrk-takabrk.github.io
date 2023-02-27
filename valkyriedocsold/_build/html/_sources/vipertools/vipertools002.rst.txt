.. Viper Tools documentation master file, created by
   sphinx-quickstart on Wed Feb  3 16:26:19 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


viper.pyに引数を付け加えて機能を使う
=====================================

必要なライブラリのインストール
-------------------------------------

必要なライブラリのインストールは、端末で以下のようにして実行します。::

 $python viper.py import

input.txtに記載されている内容をコンピューターに喋らせる
-------------------------------------------------------------------

input.txtに記載されている文字列をコンピューターに喋らせる事が可能です。::

 $python viper.py input

viper.pyに引数を付け加えてコンピューターに喋らせる
----------------------------------------------------------------

viper.pyに文字列を引数として挿入する事で、コンピューターに喋らせる事が出来ます。::

 $python viper.py jsay こんにちは

・特定のテキストファイルを読ませる::

 $python viper.py jsay "テキストファイル名.txt"

PNG画像の入っているディレクトリをJPEG画像に変換する
-------------------------------------------------------------------

PNF画像の入っているディレクトリをJPEGに変換します。::

 $python viper.py 


競艇予想機能
-----------------
選手のデータはSQLiteで構築しており、viper/kyotei/kyotei.sqliteで保存されています。

・コマンド入力で選手の登録番号を入力する事で予想を行います。::

 $python kyotei.py 1111 2222 3333 4444 5555 6666

アニメーションSVG機能
---------------------------

ここでは画像フォルダを「test」とし、出力する画像サイズは640x480とします。

速度を変更したい場合は、３つ目の引数でアニメーションの実行時間を変更します。

ここでは5秒でアニメーションが終わるように設定しています。

コマンドは以下の通りです。::

 $python viper.py asvg test 640 480 5

これで同じディレクトリに「test.svg」が生成されます。

パラパラアニメのJavaScript付きのHTMLを生成する
------------------------------------------------------------
パラパラアニメを行なうJavaScript付きのHTMLを生成します。

一つのHTMLと画像フォルダの組み合わせでパラパラアニメを実現することができ、アニメーションSVGよりも負荷が低くなっています。

３つ目の引数は、setIntervalの時間を設定します。これを変更することでアニメーション速度を変更出来ます。

ここでは50msに設定しています。

コマンドは以下の通りです。::

 $python viper.py ahtml test 640 480 50

ディレクトリに「test.html」が生成されます。

PNG画像を一括でJPEGにする
-------------------------------------

複数のPNG画像を一括でJPEG画像に変換します。

ターミナルエミュレーターで以下のコマンドを使います。

ここでは、PNG画像をまとめたフォルダを「inputdir」、JPEG画像をまとめたフォルダを「outputdir」とします。

各フォルダはスクリプトと同じディレクトリに置いてください。::

 $python viper.py png2jpg inputdir outputdir 640 480 80

このコマンドの意味は、「inputdirに入っているPNG画像を一括で640x480の解像度・80%の圧縮率のJPEGに変換する」というものです。

PNG画像を一括でGIFにする
---------------------------------

複数のPNG画像を一括でGIF画像に変換します。

ターミナルエミュレーターで以下のコマンドを使います。

ここでは、PNG画像をまとめたフォルダを「inputdir」、JPEG画像をまとめたフォルダを「outputdir」とします。

各フォルダはスクリプトと同じディレクトリに置いてください。::

 $python viper.py png2gif inputdir outputdir 640 480 80

このコマンドの意味は、「inputdirに入っているPNG画像を一括で640x480の解像度・80%の圧縮率のGIFに変換する」というものです。

GIF画像を一括でPNGにする
-----------------------------------

複数のGIF画像を一括でPNG画像に変換します。

ターミナルエミュレーターで以下のコマンドを使います。

ここでは、GIF画像をまとめたフォルダを「inputdir」、PNG画像をまとめたフォルダを「outputdir」とします。

各フォルダはスクリプトと同じディレクトリに置いてください。::

 $python viper.py gif2png inputdir outputdir 640 480 80

このコマンドの意味は、「inputdirに入っているGIF画像を一括で640x480の解像度・80%の圧縮率のPNGに変換する」というものです。

JPEG画像を一括で回転させて保存する
---------------------------------------------

一括でJPEG画像を任意の角度に回転させます。

ターミナルエミュレーターで以下のコマンドを使います。

ここでは、JPEG画像をまとめたフォルダを「inputdir」とします。
各フォルダはスクリプトと同じディレクトリに置いてください。::

 $python viper.py rotatejpg inputdir -90

このコマンドの意味は、「inputdirに入っているJPEG画像を一括で-90度回転させて上書き保存する」というものです。


音声ファイルエンコード機能
----------------------------------
この機能には、「MP3→AAC,Ogg Vorbis(mp3aac,mp3ogg)」、「AAC→MP3,Ogg Vorbis(aacmp3,aacogg)」、「Ogg Vorbis→MP3(oggmp3)」の５方式の音声ファイルのフォーマットやコンテナをエンコードする事が出来ます。

以下のコマンドを入力して使います。::

 $python viper.py mp3ogg xxx 128
 $python viper.py oggmp3 xxx 128
 $python viper.py aacogg xxx 128
 $python viper.py mp3aac xxx 128
 $python viper.py aacmp3 xxx 128

上の例は、xxx.mp3というファイルをOgg Vorbisで作成したxxx.oggというファイルにビットレート128kbpsで変換する事が出来ます。

Pythonモジュールであるviper.pyの後に、モード・ファイル名（拡張子含まない）・ビットレートの順に指定していきます。

ffmpegを使っていますので、Ubuntu 14.04LTSをベースにしたLinuxディストリビューションを使っている場合には、viper.pyで必要なライブラリなどをインストールする事が可能です。

この機能を使うには、以下のようにします。::

 $python viper.py import

tmpfs RAMDISK Slider
------------------------------

tmpfsを使ってtmpディレクトリにRAMDISKを作成します。::

 $python viper.py tmpfs

imageinfo
--------------

画像の情報を取得します。::

 $python viper.py imageinfo 画像ソース名

imageflip
------------

画像を反転させる::

 $python viper.py imageflip 画像ソース名 left_right
 $python viper.py imageflip 画像ソース名 top_bottom

valkyrie
---------

Valkyrieデスクトップのインストールを行います。::

 $python viper.py valkyrie

ブラウザ機能
------------
端末で以下のようにして起動::

 $cd browser
 $browser.py

waifu2x.pyによる画像拡大
------------------------

端末では以下のようにして起動::

 $python viper.py waifu

