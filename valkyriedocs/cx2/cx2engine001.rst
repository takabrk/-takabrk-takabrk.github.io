.. Spider Web Framework documentation master file, created by
   sphinx-quickstart on Tue Feb  2 20:24:38 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


Processing用ライブラリ「CX2 Engine」
===================================
CX2 Engineは、Java+Processing環境で使う事が出来るライブラリです。


* Processingを使った多彩な表現

Processing 3をEclipseで使う
===========================
このライブラリを使うには、統合開発環境「Eclipse」を使います。

1.Eclipseの「Help」→「Install New Software」からhttp://proclipsing.googlecode.com/svn/tags/current_releases/proclipsingSite/を登録して、Proclipsingプラグインをインストール

2.[Window]->[Preference] で [Preferences]ダイアログを開き、左側のリストから Proclipsing を選択する。

3.[Processing Path] のテキストフィールドに Processing をインストールしたパスを設定して、Applyボタンを押し、[OK]ボタンをクリックする。

4.パッケージエクスプローラ上で右クリックを行い、 [New]→[Other] で [New] ダイアログを開き、「Processing」フォルダを選択して、「Processing Project」を選んで、[Next]ボタンをクリックする。

5.必要な項目を設定してプロジェクトを作成しく。

6.dataフォルダは、srcディレクトリの中に入れて、パッケージエクスプローラ上で右クリックメニューを出して、更新させる。

7.ビルドしたい場合には、メニュー→「Project」に「Processing Export」という項目が出来ているので、これを使ってビルドを行う。

8.プロジェクトのsrcフォルダに https://osdn.jp/projects/spider/releases/ でダウンロードしたファイルを解凍し、出来た「CX2」フォルダを置き、右クリックメニューのRefleshの項目をクリックします。

ライブラリのインポート

クラスの生成
===========

 package xxx;

 import CX2.CX2;

 public class Xxx extends PApplet{

    CX2 cx;
 
    public void setup(){

        cx = new CX2(this,800,600);

    }

    public void draw(){

    }

    public void settings(){

        size(800,600);

    }

    public static void main(String _args[]) {

        PApplet.main(new String[] { xxx.Xxx.class.getName() });

    }

 }

メソッド
========
card_shuffle
------------
トランプをシャッフルするようなエフェクトを表現する::

 cx.card_shuffle();
RBW
---
赤、青、白の短形と円形のオブジェクトで表現した風車風のエフェクトを表示する::

 cx.RBW();
worp_man
--------
楕円形オブジェクトを使ってポップなエフェクトを実現する::

 cx.worp_man();
prism
-----
光が降り注ぐようなエフェクトを描画する::

 cx.prism();
snow_circle
-----------
雪が散るような表現を行う::

 cx.snow_circle();
spider_ball
-----------
円形オブジェクトが蜘蛛の巣のように動く::

 cx.spider_ball();
random_line
-----------
ランダムに線を引く::

 cx.randomLine();
sea
---
煌く海面を表現する::

 cx.sea();

crimson_world
-------------
深紅の網目のようなエフェクトを描画する::

 cx.crimson_world();
check
-----
タータンチェックを表現する::

 cx.check();
