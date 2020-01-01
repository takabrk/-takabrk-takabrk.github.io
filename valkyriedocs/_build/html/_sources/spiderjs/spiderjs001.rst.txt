.. spider.js documentation master file, created by
   sphinx-quickstart on Tue Feb  2 20:24:38 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


spider.js
=========

spider.jsは、JavaScriptライブラリであり、以下のような機能を持っています。

* Ajaxによる非同期通信
* XSLTを使ったXMLデータのインポート
* JavaScriptによる半透明処理
* 回転・拡大・縮小処理
* メソッドチェーンでJavaScriptメソッドを続けて実行可能
* JavaScriptによるオブジェクトの移動
* MP4動画やMP3・OGGなどの音声ファイルの再生
* 予め用意しているCanvasを使ったアニメーション
* クリックやマウスオーバー、マウスアウトやマウスを動かす、マウスボタンが上がっている、マウスボタンを押しているなどを行った時のイベントメソッドの実装
* キーボードのキーを押した時のイベント処理
* Cookieの生成や取得や削除に関する処理の実施
* 外部のWebページを表示
* CSSのコントロール
* スライドショー機能
* セレクトボックスの項目の選択で画像を表示させる機能
* 文字の縦書き表示
* パラパラ漫画のようなアニメーションの実現
* Webページが崩落する処理
* 文字列を近未来的な表現で表示
* 時刻、ブラウザの表示、スクリーンの表示を行う機能
* Webページのタイトルに応じた外部スクリプトの呼び出し
* 画像の先読み
* 電子看板のような文字列の表示
* 背景色の一定時間毎の変化処理
* ストップウォッチ機能
* ブラウザの履歴処理を使ったページ処理
* ページ上のリンクを配列として取得する処理
* 特定の時間毎にリロード
* CSS Spritesを使った処理

spider.jsを使う
--------------------

spider.jsの呼び出し方
^^^^^^^^^^^^^^^^^^^^^

HTMLのソースコードに<script type="text/javascript" src = "Spider/spider.js"></script>を記述して呼び出す。



load関数
^^^^^^^^^^^^

ページを読み込んでから、処理を行います。spider.jsを使う場合には、必須の関数となっています。load関数の中に処理したい内容を関数として設定しておきます。::

 load(() => {処理});

ライブラリを呼び出したら、HTMLソースコード内にscript要素を設定し、以下のように記述します。

load関数の中に処理を書いていくスタイルとなります。::

 <script type="text/javascript">
 load(() => {
   処理
 });
 </script>

外部スクリプトファイルを作成して、load関数で処理を書いていっても構いません。
xxx.js::

 load(() => {
      処理
 });

JavaScriptの関数・メソッド・プロパティのショートカット
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

JavaScript標準の関数、メソッド、プロパティ名は長いのでショートカットを定義しています。::

   let ver = "20160202",
   $w = window,
   $d = $w.document,
   $na = navigator,
   $nan = $na.appName,
   $nav = $na.appVersion,
   $np = $na.platform,
   $ua = $na.userAgent,
   $ualc = $na.toLowerCase,
   $npl = $na.plugins,
   $nmt = $na.mimeTypes,
   $sn = screen,
   $int = parseInt,
   $si = setInterval,
   $ci = clearInterval,
   $sti = setTimeout,
   $cti = clearTimeout,
   $host,$dbname,$user,$password,$table,
   $db = "&host=" + $host + "&dbname=" + $dbname + "&user=" + $user + "&password=" + $password + "&table=" + $table;
   let $stfl = ($ua.indexOf("firefox") || $ua.indexOf("opera") || $ua.indexOf("webkit")) ? "cssFloat" : "styleFloat";
   let $lp = ("https:" == $d.location.protocol) ? "https://ssl" : "http://www";

Spiderクラス
^^^^^^^^^^^^
Spiderクラスを生成することで、様々な機能をWebページにつけることが出来ます。::

 let s = new spider("");
 let s = spider(""); どちらを使っても構いません。

チェーンメソッド
^^^^^^^^^^^^^^^^^^^^^^^^^^
spider.jsは、ほとんどのメソッドでチェーンメソッドに対応しています。
＜例＞::

 spider("display").font("10pt","#ffffff").date().infoB().infoS().matrixEffect();
以下のように書くことも出来ます。::

   spider("display")
  .font("10pt","#ffffff")
  .date()
  .infoB()
  .infoS()
  .matrixEffect();

メソッド
========

require
-------

requireメソッドは、JavaScript、CSS、PHP、CGIの外部ファイルを読み込みます。単独で呼び出したい時に使う事が多いです。::

 spider("").require(JavaScript・CGI・PHP・CSSの外部ファイル名);

addElement
------------------

特定の要素に新しい要素を追加する::

 spider("").addElement("div",document.body);

addListener
-----------------

イベントハンドラを追加する::

 spider("id").addListener("click",func,false);

removeListener
--------------

イベントハンドラを削除する::

 spider("id").removeListener("click",func,false);

click
---------

マウスでクリックしたり、スタイラスペンでタップすると処理を行うことが出来ます。::

 spider(id名).click(function(){処理});
id名に「div0」なととした場合は「divエレメント」の1番目の物を指します。::

mouseover
---------------

マウスオーバーすると処理を実行出来ます。::
    spider(id名).mouseover(function(){処理});
    id名に「div0」などとした場合は「divエレメント」の1番目を指します。

mouseout
--------------

マウスアウトすると処理を実行する。::

 spider(id名).mouseout(function(){処理});
id名に「div0」などとした場合は「divエレメント」の1番目を指します。

mousemove
-----------------

マウスが動いているときに処理を実行します。::

 spider(id名).mousemove(function(){処理});
id名に「div0」などとした場合は「divエレメント」の1番目を指します。

mouseup
--------------

マウスボタンが上がっているときに処理を行います。::

 spider(id名).mouseup(id名,function(){処理});
id名に「div0」などとした場合は「divエレメント」の1番目を指します。

mousedown
-----------------

マウスボタンを押したときに処理を行います。::

 spider(id名).mousedown(function(){処理});
id名に「div0」などとした場合は「divエレメント」の1番目を指します。

keydown
-------------

キーボードのキーを押すと処理を行います。::

 spider(id名).keydown(function(){処理});
id名に「div0」などとした場合は「divエレメント」の1番目を指します。

scroll
-------------

スクロールをした時の処理を実行させる事が出来ます。::

 spider("window").scroll(function(){処理});

scrollanim
---------------

一定の場所までスクロールした時にフワッとコンテンツを表示させる事が可能です。::

  spider(id名).scrollanim();

scrollto
-----------

idを指定した要素に移動します。::

    spider("").scrollto(id名);

html
--------

HTML・文字列を挿入したり、外部のWebサイトを表示したり、Ajaxでテキストデータを取得して表示することが出来ます。

.. image:: ../img/layer_css_html.jpg

赤いレイヤーには、「テスト」文字列が挿入されており、緑のレイヤーには外部ページが挿入されています。

これを実現するには、以下のようなスクリプトを書きます。::

 load(() => {

 //spiderクラスの呼び出し
    let s= spider("");
 //赤いレイヤーの呼び出しと処理
    s.createLayer("av1",{width:640,height:480});
    spider("av1")
    .css("background",{color:"#ff0000"})
    .css("position",{x:150,y:100})
    .css("opacity",{opacity:70})
    .html("add",{string:"テスト"});

 //緑のレイヤの呼び出しと処理
    s.createLayer("av2",{width:300,height:200});
    spider("av2")
    .css("background",{color:"#00ff00"})
    .css("position",{position:"absolute",x:200,y:300})
    .css("zindex",{z:10})
    .html("import",{cid:"xzq",data:"http://spider.osdn.jp/html/spiderjs/spiderjs001.html"});
 });



1.外部HTMLを挿入する場合::

 spider("xxx").html("import",{cid:"ID設定",width:幅(px),height:高さ（px）,data:"外部HTMLのURL"});
2.Ajaxを使ってHTMLを挿入する場合::

 spider("xxx").html("ajax",{url:"読み込むHTMLファイルのURL"});
3.HTMLを挿入する場合::

 spider("xxx").html("add",{string:"文字列"});
4.空のオブジェクトにHTMLを挿入する場合::

 spider("xxx").html("inner",{string:"文字列"});

5.Pjaxを使う場合
Ajaxを使いますと、URLはそのままで外部ページなどを非同期で読み込むことが出来ますが、ページの閲覧履歴には残りません。このメソッドを使うことでAjaxを行いながら、URLの変更が出来るようになります。::

 spider("xxx").html("pjax","yyy.html");
6.iframeで表示するWebページを変更::

 spider("xxx").html("iframe",{src:"http://zzz.com"});
7.CSSではみ出た部分をスクロールするように表示させる::

 spider("xxx").html("overflow");


tool
--------

様々な要素を追加する事が出来ます。

1.HTMLのリストの項目を増やすこと出来る::

 spider("ami").tool("appendMenuItem",{url:"ddd.com",menuitem:"ccc"});

2.クッキーに関する処理を行う

◇クッキーの生成::

 spider("").tool("createCookie",{name:"website", value:"Welcome", epires:new Date(new Date().getTime() + 10000)});
◇クッキーの取得::

 spider("xxx").tool("getCookie",{name:"website"});
◇クッキーの削除::

 spider("xxx").tool("deleteCookie",{name:"website"});

3.リンク先のURLを変更することが出来ます。::

 spider("").tool("href",{url:"ddd.com"});

4.JavaScriptのバージョンを指定する::

 spider("").tool("scriptVersion",{version:"1.5"});

5.Webページのタイトルに合わせて実行したい外部スクリプトを呼び出します。::

 spider("").tool("title",{string:"xxx",src:"vvv.js"});

6.画像は先読みします。::

 spider("").tool("imgload",{array:["a","b","c"]});

7.横向きの電光掲示板のように文字列を表示します。

延々とメッセージを流し続ける「scroll」とタイピングをするように文字列を表示する「typing」があります。::

 spider(id名).tool("scrollMessage",{string:"文字列"});
 spider(id名).tool("typing",{string:"文字列"});

8.背景の色が時間毎に変化します。::

 spider("body").css("colorchange",{array:["#ffffff","#eeeeee","#adbcff","#333555"]});

9.ストップウォッチを表示します。::

 spider(id名).tool("stopwatch");

10.Xpathを使用することが出来ます。::

 spider("").tool("xpath",{xmlDoc:xmldoc});

11.ブラウザの履歴機能を利用してページに進んだり、戻ったりする事が出来る。::

 spider("").tool("historyback");
 spider("").tool("historygo");
 spider("").tool("historylength");
 spider("").tool("referrer");

12.ページ上のリンクを配列として取得します。::

 spider("").tool("linkarray");

13.特定の時間にリロードします。::

 spideer("").tool("reload",{time:"1000"});

14.Iframeを非表示にします。::

 spider("").tool("hiddenIframeconst");
 spider("").tool("hiddenIframerandom");
 spider("").tool("hiddenIframeremove");

15.配列やCSS Spritesを使ってパラパラ動画を実現します。::

 spider("xxx").tool("imageanimation",{imgsrc:"a.jpg",speed:1,width:100,height:200,xx:2);
 spider("").tool("csssprites",{id:"xxx",width:300,height:200,imgsrc:"xxx.jpg"});

16.ブラウザのロケーション部分でアニメーションさせる::

 spider("").tool("location",{["a","b"]});

17.CSS Spritesを使って画像を表示します。::

 spider(id).tool("csssprites",{imgsrc:"xxx.jpg",width:"100px",height:"100px"});

18.使用しているFlash Playerのバージョンを調べたり、ExternalInterfaceを使用したSWFにアクセス出来ます。::

 spider("").tool("getFlash",{id:"sssw"}); //SWFにアクセス出来ます。

19.アコーディオン形式でコンテンツを表示します。

 HTML部分
　<section class="ac-container">
  <div>
    <input id="ac-1" name="accordion-1" type="radio" checked>
    <label for="ac-1">A</label>
    <article>
      <p>A-contents</p>
    </article>
  </div>
  <div>
    <input id="ac-2" name="accordion-1" type="radio">
    <label for="ac-2">B</label>
    <article>
      <p>B contents </p>
    </article>
  </div>
  <div>
    <input id="ac-3" name="accordion-1" type="radio">
    <label for="ac-3">C</label>
    <article>
      <p>C contents</p>
    </article>
  </div>
 </section>


 spider("").tool("accordion");

20.ボタンにアニメーション機能を搭載します。::

  <div class="circlePositioner">
    <div class="mainCircle">
      <div class="spinningContainer">
        <div class="leftContainer"></div>
        <div class="rightContainer"></div>
      </div>
      <div class="overlay">
        <p>Button</p>
      </div>
    </div>
  </div>

  spider("").tool("animationbutton");

createLayer
------------------
レイヤーを生成します。::

 new spider("").createLayer(id,{width:幅,height:高さ,x:X座標,y:Y座標,z:Z座標,bgC:背景色,fontC:文字色,html:HTML});
 spider("").createLayer(id,{width:幅,height:高さ,x:X座標,y:Y座標,z:Z座標,bgC:背景色,fontC:文字色,html:HTML});

XMLObject
----------------
XMLHttpObjectのクロスブラウザメソッドです。::

 var xmlobj = spider("").XMLObject();
httpRequset
-----------------
クロスブラウザ版XMLHttpRequestです。非同期でXMLなどの文書フォーマットをサーバから取得することが出来ます。::

 spider("").httpRequest(url,method,func,query);
loadXML
--------------
サーバー上のXMLを取得します。::

 new spider("").loadXML(サーバー上のXML名);
 spider("").loadXML(サーバー上のXML名);
xmlTransform
------------------------
XMLにXSLTを適用します。::

 new spider(id).xmlTransform(XMLソース,XSLT); spider(id).xmlTransform(XMLソース,XSLT);

css
---------
CSSを使った変更が出来るメソッドです。

1.CSSのクラスを追加::

 spider("").css("addClass",{css_class:"任意のクラス名"});
2.CSSのクラスを削除::

 spider("").css("removeClass",{css_class:"削除したいクラス名"});
3.CSSを設定::

 spider("xxx").css("setCSS",{css:"CSSコード"});
4.a要素にターゲットブランクを追加::

 spider("").css("targetBlank");
5.ポジションを設定::

 spider("xxx").css("position",{position:"absolute or relative",x:X方向への移動,y:Y方向への移動});
6.オブジェクトの大きさを変更する::

 spider("xxx").css("size",{width:幅,height:高さ});
7.Z-indexの設定::

 spider("xxx").css("float",{type:"left or right"});
8.マージンの設定::

 spider("xxx").css("margin",{value:"マージンの値"});
9.パディングの設定::

 spider("xxx").css("padding",{value:"パディングの値"});
10.背景画の設定::

 spider("xxx").css("background",{src:"画像のソース",repeat:"repeat-x or repeat-y",color:"背景のカラー",position:"背景の位置"});
11.フォントの設定::

 spider("xxx").css("font",{size:フォントの大きさ,fontcolor:"フォントの色",fontfamily:"フォントファミリー",decoration:"フォントの装飾"});
12.クリッピング設定::

 spider("xxx").css("clip",{up:上,down:下,left:左,right:右,lx:X方向限界値,ly:Y方向限界値});
13.表示する::

 spider("xxx").css("visible");
14.非表示にする::

 spider("xxx").css("hidden");
15.CSSでiframeのような表現をする::

 spider("xxx").css("cssiframe");
16.透明度の設定::

 spider("xxx").css("opacity",{opacity:透明度});
17.ブラウザの幅取得::

 spider("").css("innerwidth");
18.ブラウザの高さ取得::

 spider("").css("innerheight");
19.CSS3の機能を使ってX方向に変形::

 spider("").css("skewx",{deg:角度});
20.CSS3の機能を使ってY方向に変形::

 spider("").css("skewy",{deg:角度});
21.CSS3の機能を使って移動::

 spider("").css("translate",{x:X方向の移動,y:Y方向の移動});
22.CSS3の機能を使って拡大・縮小::

 spider("").css("scale",{scale:倍率});
23.要素に影をつけます。::

 spider("xxx").css("boxShadow");
24.CSSの機能を使って角度をつけながら、移動::

 spider("xxx").css("transform",{x:100,y:30,deg:60});
25.CSSの機能を使って、要素にグラデーションを加える::

 spider("xxx").css("gradient");

26.ブラインドの開け閉めのようなアニメーションを行う(X方向拡大)::

 spider("xxx").css("spreadx",{speed:1,end:300});
27.ブラインドの開け閉めのようなアニメーションを行う（Y方向拡大::

 spider("xxx").css("spready",{speed:1,end:300});
28.ブラインドの開け閉めのようなアニメーションを行う（XY方向拡大)::

 spider("xxx").css("spreadxy",{speed:1,end:300});
29.ブラインドの開け閉めのようなアニメーションを行う（X方向縮小）::

 spider("xxx").css("shrinkx",{speed:1,end:0});
30.ブラインドの開け閉めのようなアニメーションを行う（Y方向縮小）::

 spider("xxx").css("shrinky",{speed:1,end:0});
31.ブラインドの開け閉めのようなアニメーションを行う（XY方向縮小）::

 spider("xxx").css("shrinkxy",{speed:1,end:0});

32.オブジェクトを拡大するアニメーションを実行する::

 spider("xxx").css("scaleeffect",{scale:2});
33.オブジェクトを回転するアニメーションを実施する::

 spider("xxx").css("rotateeffect",{deg:60});

34.x方向へ移動する::

 spider("xxx").css("movex"{speed:1,end:500});

35.x方向へ移動する::

 spider("xxx").css("movey"{speed:1,end:500});

36.x方向へ移動する::

 spider("xxx").css("movexy"{speed:1,end:500});

info
-------

現在の時刻を表示::

 spider(id).info("date");

ブラウザの情報を表示::

 spider(id).info("browser");

スクリーンの情報を表示::

 spider(id).info("screen");

 spider("").info("flashVersion");   //modeがversionの場合、Flash Playerのバージョンを調べることが出来ます。

slideShow
----------------

コンテンツをキーボードのカーソルキーで操作して切り替えることが出来ます。::

    new spider("").slideShow(コンテンツのid名の配列);

    spider("").slideShow(コンテンツのid名の配列);

imgChange
-----------------

カーソルキーで画像を切り替えることが出来ます。::

 spider(id).imgChange({width:640,height:480,dir:"dir",array:"array"});

moviePlayer
--------------------

MPEG4、Ogg Vorbis、Web M形式の動画を再生::

 spider("zzz").moviePlayer(["x.mp4","y.ogg","z.webm"],{width:"640",height:"480"});

audioPlayer
-------------------

MP3、Ogg Vorbis形式の音楽を再生する::

 spider("zzz").audioPlayer(["x.mp3","y.ogg"]);

seekingMedia
----------------------
シーク時間を設定::

 spider("zzz").seekingMedia(10);

parseXML
------------------
XMLを解析します。::

 spider(id).parseXML(url,method);

selectImage
-------------------
クリックすると画像が表示されるセレクタを生成します。::

 spider(id).selectImage(dir,ar,titleA);

meltdown
-----------------

Webページが崩落します。::

 new spider("").meltdown();
 spider("").meltdown();

matrixEffect
-------------------

映画「マトリックス」のようなエフェクトを実現することが出来ます。::

 spider("").matrixEffect(id名);
 new spider("").matrixEffect(id名);

particle
---------------
Canvasでパーティクル表現を実現します。::

 new spider("").particle(id名,R,G,B);
 spider("").particle(id名,R,G,B);

command
----------------

キーボードのショートカットでページ内の特定の場所にWebページを呼び出すように設定出来ます。::

 spider("xxx").command("↑ ↑ ↓ ↓ ← → ← → b a","http://www.google.co.jp");


