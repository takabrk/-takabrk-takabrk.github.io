.. Valkyrie SRX documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

JavaScript Hack
===============

Processing.jsで複数のpdeファイルを取り込むには
-----------------------------------------------------------

Processingは、Javaベースのデジタルアート向けのプログラミング環境であり、標準のエディタでは複数のpdeファイルを並行して使う事が出来る為、よく使う処理はクラスやメソッドにして、本体とは別のpdeファイルにするのが一般的であり、効率的です。JavaScript実装のprocessing.js( href="http://processingjs.org/ )でも同じように本体pdeファイルとクラスpdeファイルを分けておく事が出来ます。
クラスpdeファイルである「cx2.pde」と本体pdeファイルである「worp_man.pde」があるとします。以下はHTMLソースコードの一部です。::

    <script src="processing.js" type="text/javascript"></script>
    <script type="text/javascript">
    function getProcessingSketchId () { return 'vivid'; }
    </script>
    </head>
    <body>
    <canvas id="sketch3dstg" data-processing-sources="cx2.pde worp_man.pde" width="1280" height="720">
    <p>Your browser does not support the canvas tag.</p>
    </canvas>
    <noscript>
    <p>JavaScript is required to view the contents of this page.</p>
    </noscript>
    </body>

canvas要素のdata-processing-sources属性を「data-processing-sources="cx2.pde worp_man.pde"」とする事で、纏めてpdeファイルの導入が可能です。

WebサイトのJavaScriptやCSSのキャッシュのせいで、これらのファイルが更新されない時の対処法
--------------------------------------------------------------------------------------------------------------------

WebサイトやWebアプリケーションを開発していますと、ブラウザのキャッシュ機能によって、JavaScriptやCSSがキャッシュされている方を使われます。

その為、Ctrl+更新ボタンやF5キーを押す事によって、強制キャッシュクリアをしなければいけません。

このような現象が起こらないようにする為には、JavaScriptやCSSを呼び出す際に、クエリを付加させておきます。::

    <script type="text/javascript" src="xxx.js?date=20170106"></script>
    <link rel="stylesheet" href="yyy.css?date=20170106" type="text/css" />

しかし、毎回「?」の後の文字列を手動で変更するのは手間が掛かります。

そこで、HTMLファイルをPHPファイルに変換して、PHPが動作するWebサーバ上でPHPを使った自動的なタイムスタンプを実行させます。

PHPファイルには以下の簡単なPHPスクリプトを埋め込みます。

これだけで自動的にクエリを生成してくれます。::

    <script type="text/javascript" src="xxx.js?date=<?php echo time(); ?>"></script>

    <link rel="stylesheet" href="yyy.css?date=<?php echo time(); ?>" type="text/css" />

JavaScriptのショートコードテクニックとトリッキーなテクニック
--------------------------------------------------------------------------

JavaScriptは、そのままプログラムを書きますと、比較的冗長的なソースコードになりがちですので、適度にショートコード化していくと良いでしょう。

1.オブジェクトとメソッドをエイリアスで短くする

オブジェクトやメソッドは、長い名前の物が多々あります。

これを解消するには、エイリアスを上手に使うのが効果的です。::

     document.getElementsTagName("script");

script要素を取得する為のDOMを使ったお馴染みの文です。

getElementsByTagNameの部分は、以下のようにする事が出来ます。::

    document["getElementsByTagName"]("script");

ドットシンタックス無しで表現したい時に有効な書き方です。

エイリアスを使ってショートコード化を図ります。::

    var $d = document,
    $gtag = "getElementsByTagName";

    $d[$gtag]("script");

2.三項演算子

三項演算子は、if文をショートコード化させる時によく使われます。

以下のようなif文があるとします。::

    if(条件){
        処理A;
    }else{
        処理B;
    }

これを三項演算子で表現しますと、以下のようになります。::

    (条件) ? 処理A : 処理B;

元の処理がセミコロンで区切られて、数行で構成されている処理の場合は、以下のようにすれば良いでしょう。::

    (条件) ? (処理A1,処理A2,処理A3) : (処理B1,処理B2,処理B3);

3.引数「div1」などという文字列から、div要素をDOMで収集した要素群の2番目の要素を指定する方法

getElementsByTagNameを使いますと、HTML文書内の全ての特定の要素を収集して配列化する事が出来ます。::

    document.getElementsByTagName("div");

このdiv要素群の2番目の要素にアクセスしたい場合には、以下のようにアクセスが可能です。::

    document.getElementsByTagName("div")[1];

「klj」という任意の関数があり、これの引数をidと設定します。::

    var klj = function(id){
        if(id.match(/^(div)/g)){
            document.getElementsByTagName("div")[parseInt(id.slice(3,id.length))];
        }
    }

idに「div1」の文字列を入れます。

これは、div要素群の2番目の要素を取り出すという意味で名づけています。::

    klj("div1");

この関数は、div要素群の2番目の要素にアクセス出来ます。

id名から取り出したい要素を判別し、更にそのid名から数字を取り出して、div要素群の配列のインデックスとして利用しています。

id名にslice関数を使って、前から4つ目の文字を取り出しています。

この場合は、「1」が該当し、配列のインデックスに使う為にparseIntで文字列を整数に変換しています。

4.オリジナルのライブラリを作った時に、newを使わずにインスタンスを生成したい

JavaScriptでは、インスタンスの生成にはnewを使って行うのが一般的です。

Imageコンストラクタの場合は以下のようになります。::

    var img = new Image();

オリジナルライブラリを作成して使う場合、このnewを使うのが手間に感じる事でしょう。

newを使わずにインスタンスを作るようにするには以下のようにします。

spiderクラスを作るとします。::

    var spider = (function(){
        var constructor = function(id){
            if(!(this instanceof spider))return new spider(id);
        }
    })();

「if(!(this instanceof spider))return new spider(id);」の部分がnew無しでインスタンス生成を可能にする肝になります。

5.オリジナルライブラリでチェーンメソッドを実現したい

オリジナルライブラリを作成して、一つのインスタンス生成後に数珠繋ぎで次々とメソッドの処理を追加したいでしょう。

例えば、以下のようなイメージです。::

    spider("browser_info").css("font",{size:"10pt",fontcolor:"#ffffff"}).info("date").info("browser").info("screen").matrixEffect();

このような数珠繋ぎで次々と処理を行えるメソッドの事をチェーンメソッドと呼びます。

jQueryなどのライブラリでは、当たり前のように使われています。

これを実現するには、非常に簡単であり、各メソッドの最後の部分に「return this;」を追加すれば良いのです。

僕が開発しているSpider Code Libraryからコードを抜粋した物が以下です。

最後に「return this;」が付加されているのが分かります。::

    require : function(src){
        var $head = $d[$gtag]("head")[0];
        (src.match(/\.(js)/i) || src.match(/\.(txt)/i) || src.match(/(https)\:\/\/(maps.googleapis.com)\/(maps)\/(api)\//i)) ?
        (aec=this.addElement('script',$head),aec.type = "text/javascript",aec.src = src) :
        (src.match(/\.(css)/i)) ?
        (aec=this.addElement("link",$head),aec.rel = "stylesheet",aec.href = src,aec.type = "text/css") :
        (src.match(/\.(cgi)/i) || src.match(/\.(php)/i) || src.match(/\.(rb)/i) || src.match(/\.(pl)/i) || src.match(/\.(py)/i)) ?
        this.httpRequest(src,"GET",function(){}) : 0;
        return this;
    },

JavaScriptにおける動的スクリプトインポートの注意点
----------------------------------------------------------------

外部スクリプトを動的には、document.createElementを使うのがポピュラーな方法ですが、この時に気をつけておくべき事があります。::

    1.HTML内でinnerHTMLを使って外部スクリプトを呼び出すと、scriptタグが被ってしまって、HTMLの文法エラーの原因になってしまって、結果的に外部スクリプトを呼び出せない。
    2.createElementを使って呼び出す場合には、document.writeを使って外部スクリプトの呼び出しを行なっているスクリプトを処理出来ないという仕様上の制約があります。

Tumblrの記事データをWordPress経由でバックアップ
------------------------------------------------------------------

Tumblrには、記事のインポート機能やエクスポート機能がありません。そこで、WordPressのインポート機能。エクスポート機能を活用して、Tumblrの記事データをバックアップしていきます。

WordPressは、自分でサーバを用意してインストールしても構いませんし、WordPress.comを使っても構いませんので、取り敢えず、適当にブログを一つ作成します。

「WordPressの管理」（ダッシュボード）→「ツール」→インポートでTumblrと連携させてインポートを行います。

インポートが完了したら、エクスポートを選択すれば、記事データをXMLで出力する事が出来ます。

インポートした記事は、このインポート画面で「アカウント情報を消去」という項目を選択すれば、WordPressにインポートした記事を消す事ができ、再度Tumblrで作成したサイトを選択すれば、記事が被らずに再度インポートを行えます。

関数やメソッド名を短くしてJavaScriptのライブラリの容量を減らす方法
-------------------------------------------------------------------------------------

ライブラリを出来るだけ減らすにはサードパーティー製の圧縮する他にも関数名やメソッド名を短くする方法があります。

例えば、以下のようにするとスクリプトが大きければ大きいほど効果が大きいことがわかると思います。::

    var $d = document,
    $gei = "getElementById";
    var s = $d[$gei]("id");

JavaScript,CGI,PHP,CSSを読み込む関数
------------------------------------------------------

JavaScript、CGI、PHP、CSSを読み込むための関数は以下のようにすると出来ます。::

    var require = function(src){
	     var addElement = function(tag,ele){
		       aec = document.createElement(tag);
		       ele.appendChild(aec);
		       return aec;
	     }
	     var XMLObject = function(){
		           return (typeof XMLHttpRequest != "undefined") ? new XMLHttpRequest() : (new ActiveXObject("Msxml2.XMLHTTP") || new ActiveXObject("Microsoft.XMLHTTP"));
	      }
	      var httpRequest = function(url,method,func,query){
		           var hObj = XMLObject();
		    (!hObj) ? eval("alert('Error : Not Found XML');return false;") : 0;
		    var hR = function(){
			    return (hObj.readyState == 4) ?
				    (hObj.status == 200) ? func(hObj) :
				    func(hObj) : 0;
		    }
		    hObj.onreadystatechange = hR;
		    if(method == "GET"){
			      hObj.open(method,url.match(/\?/g) ? url : url + "?" + (new Date).getTime(),true);
			      hObj.send("");
		    }
		    if(method == "POST"){
			    hObj.open(method,url.match(/\?/g) ? url : url + "?" + (new Date).getTime(),true);
			    hObj.setRequestHeader("Content-Type","application/x-www-urlencoded,charset=UTF-8");
			    hObj.send(query);
		    }
		    return this;
	    }
	    var $head = document.getElementsByTagName("head")[0];
	    (src.match(/\.(js)/i) || src.match(/\.(txt)/i)) ?
		    (addElement('script',$head),aec.type = "text/javascript",aec.src = src) :
	    (src.match(/\.(css)/i)) ?
		    (spider("").addElement("link",$head),aec.rel = "stylesheet",aec.href = src,aec.type = "text/css") :
	    (src.match(/\.(cgi)/i)||src.match(/\.(php)/i)||src.match(/\.(rb)/i)||src.match(/\.(pl)/i) || src.match(/\.(py)/i)) ?
		    httpRequest(src,"GET",function(){}) : 0;
   }

キーボードのカーソルキーを使って、写真をスライドさせる
--------------------------------------------------------------------

キーボードのカーソルキー操作で写真を切り替えるには以下のようにします。「var ek = e.keyCode - 38;」の部分でカーソルキーのキーコードを取得しています。::

    var imgChange = function(id,wi,h,dir,array){
	      var i = 0;
	      var ic = document.getElementById(id);
	      ic.width = wi + "px";
	      ic.height = h + "px";
	      ic.innerHTML = '<img src="' + dir + '/' + array[i] + '" id = "io"/>';
	      keyDown(function(e){
		        var ek = e.keyCode - 38;
		        var io = document.getElementById("io");
		        var da = dir + "/" + array[i];
		        var al = array.length;
		        i += ek;
		       (ek > 0) ?
			          (i > al) ? i = 0 : io.src =  da :
			          (i < 0) ? i = parseInt(al) : io.src = da;
	      });
    }

JavaScriptによるDynamicHTMLアニメーション
----------------------------------------------------------

JavaScriptでDHTMLアニメーションをさせるには、setIntervalメソッドで処理をループさせて、CSSの値を調整するのが基本になります。
+x方向へ移動させたい場合は以下のように書きます。::

    var move_x = function(id,spd,end){
	      var did = documetn.getElementById(id);
	      var fps = 0;
	      var aid = setInterval(
		        function(){
			          var ds = did.style;
			          ds.left = parseInt(ds.left) + fps + "px";
			          fps += spd;
			          (spd > 0) ?
				            ($int(ds.left) > end) ? clearInterval(aid) : 0 :
				            ($int(ds.left) < end) ? clearInterval(aid) : 0;
	          },50);
    }

上記の例は0.05秒毎にgetElementByIdで指名した要素を+x方向へspd[px]動かし、end[px]に到着すると止まる関数です。 つまり、0.05秒毎にCSSの値を書き換えてアニメーションをしているように見せているわけです。
フェードインさせたい場合は以下のようにします。今度はCSSのopacityメソッドの値を変更することで実現しています。::

    var fadein = function(id,spd){
	      var dobj = document.getElementById(id);
	      var opc = 0;
	      var fii = setInterval(function(){
		        dobj.opacity(opc);
		        opc += spd;
	      },100);
	      (opc > 100) ? clearInterval(fii) : 0;
    }

拡大処理をしたい場合は以下のようにします。今度はCSSのwidth,heightメソッドの値を変更しています。ここでは元のwidth,heightの値を整数に直して処理を行っています。これを行わないとアニメーションが出来ません。::

    var spread_xy = function(id,spd,end){
	      var did = document.getElementById(id);
	      var fps = 0;
	      var ds = did.style;
	      ds.width = "0";
	      ds.height = "0";
	      var aid = setInterval(function(){
		        ds.width = parseInt(ds.width) + fps + "px";
		        ds.height = parseInt(ds.height) + fps + "px";
		        fps += spd;
		        (parseInt(ds.height) > end) ? clearInterval(aid) : 0;
	      },100);
   }

innerHTML以外でHTMLを読み込む方法
---------------------------------------------------

innerHTML以外でHTMLを読み込むにはobjectやiframeを使います。::

    var cobj = document.createElement("object");
    document.getElementById(id).appendChild(cobj);
    cobj.type = "text/html";
    cobj.data = "読み込みたいHTMLのURL";
    cobj.id = cid;
    cobj.style.width = wi + "px";
    cobj.style.height = hi + "px";
    cobj.style.margin = 0;
    cobj.style.padding = 0;

この他にはAjaxを使う方法もあります。::

    var XMLObject = function(){
	      return (typeof XMLHttpRequest != "undefined") ? new XMLHttpRequest() : (new ActiveXObject("Msxml2.XMLHTTP") || new ActiveXObject("Microsoft.XMLHTTP"));
    }
    var httpRequest = function(url,method,func,query){
	      var hObj = XMLObject();
	      (!hObj) ? eval("alert('Error : Not Found XML');return false;") : 0;
	      var hR = function(){
		        return (hObj.readyState == 4) ?
			      (hObj.status == 200) ? func(hObj) :
				        func(hObj) : 0;
	      }
	      hObj.onreadystatechange = hR;
	      if(method == "GET"){
		        hObj.open(method,url.match(/\?/g) ? url : url + "?" + (new Date).getTime(),true);
		        hObj.send("");
	      }
	      if(method == "POST"){
		        hObj.open(method,url.match(/\?/g) ? url : url + "?" + (new Date).getTime(),true);
		        hObj.setRequestHeader("Content-Type","application/x-www-urlencoded,charset=UTF-8");
		        hObj.send(query);
	      }
    }
    var rtb = document.getElementById("rtb"); //id名rtbにHTMLを挿入
    httpRequest("取得したいHTMLのURL","GET",
	      function(xml){
		        rtb.innerHTML = xml.responseText;
	      }
    );

ループの高速化
----------------------

ループにキャッシュ用の変数を加えるだけでループを高速化することが出来ます。ここではdivという変数にdivエレメントの配列をキャッシュしています。::

    for(var i,div = document.getElementsByTagName("div");i<div.length;i++){
    }

JavaScriptからPHP、Perlなどで書かれたサーバープログラムを呼び出す
--------------------------------------------------------------------------------------------

JavaScriptでPHP、Perlで書かれたサーバーサイドプログラムを呼び出すには以下の方法があります。::

    JavaScriptでscriptエレメントを生成して呼び出す。
    var sc = document.createElement("script");
    sc.src = "サーバープログラム名";
    document.body.appendChild(sc);

サーバープログラムのURLの後ろに「?param=xxx&pram2=ccc」などを追記すると、サーバにクエリとして入力したい値を渡すことが出来ます。

クロスブラウザXMLHttpRequestオブジェクト
-------------------------------------------------------

汎用性のあるXMLHttpRequestオブジェクトです。::

    var XMLObject = function(){
	      return (typeof XMLHttpRequest != "undefined") ? new XMLHttpRequest() : (new ActiveXObject("Msxml2.XMLHTTP") || new ActiveXObject("Microsoft.XMLHTTP"));
    }

「エレメント名+数字」のid名で特定のエレメントを指定する方法
----------------------------------------------------------------------------

「エレメント+数字」のid名で特定のエレメントを指定するには以下のように書きます。

例えば、「var t = new spider("div2");」とすると、3番目のdivを取ることが出来ます。JavaScriptのメソッドを使いたい場合は「t.id.メソッド();」とすれば、使うことが出来ます。::

    var $int = parseInt;
    var spider = function(id)[
	      this.id = (id.match(/^(div)/g)) ? $d.getElementsByTagName("div")[$int(id.slice(3,id.length))] :
			      (id.match(/^p/g)) ? $d.getElmenetsByTagName("p")[$int(id.slice(1,id.length))] :
			      (id.match(/^a/g)) ? $d.getElementsByTag("a")[$int(id.slice(1,id.length))] :
			      (id.match(/^(ul)/i)) ? $d.getElementsByTagName("ul")[$int(id.slice(2,id.length))] :
			      (id.match(/^(li)/i)) ? $d.getElementsByTagName("li")[$int(id.slice(2,id.length))] :
			      (id.match(/^(input)/i)) ? $d.getElementsByTagName("input")[$int(id.slice(5,id.length))] :
			      (id.match(/^(button)/i)) ? $d.getElementsByTagName("button")[$int(id.slice(6,id.length))] :
			      (id.match(/^(span)/i)) ? $d.getElementsByTagName("span")[$int(id.slice(4,id.length))] :
			      (id.match(/^(script)/g)) ? $d.getElementsByTagName("script")[$int(id.slice(6,id.length))] :
			      (id.match(/^(head)/g)) ? $d.getElementsByTagName("head")[$int(id.slice(4,id.length))] :
			      (id.match(/^(iframe)/g)) ? $d.getElementsByTagName("iframe")[$int(id.slice(6,id.length))] :
			      (id.match(/^(title)/g)) ? $d.getElementsByTagName("title")[$int(id.slice(5,id.length))] :
			      (id == "body") ? $d.body :
			          (id == "document") ? $d :
			          $d.getElementById(id);
	      return this;
    }

JavaScriptのevalの代用
---------------------------------

(0)["constructor"]["constructor"]("JavaScriptのコード")()は、Functionコンストラクタの機能を持っているそうです。この性質を利用して、文字コードだけでJavaScriptを書いたり、日本語で書いたりすることも出来るようです。

JavaScriptにおける独自関数の正式名称と省略形を併せて設定する方法
-----------------------------------------------------------------------------------------

JavaScrptは無名関数を使うことで、開発者独自の関数を作り出すことが出来ますが、その正式名称と省略形をまとめて記述すると、スクリプトファイル容量の削減をすることが出来ます。

例えば、createLayerという関数を作ったとすると、以下のように書くことが出来ます。::

    var $cly = createLayer = function(){}

こういう風に書くと、createLayer()というフルネームで書くことが出来ますし、省略形に$cly()と書くことも出来ます。

CSS SpritesとJavaScriptを使ってパラパラアニメをつくる
---------------------------------------------------------------------

setIntervalで配列の中にある画像を次々と表示してアニメーションを作るものですが、これをCSS Spritesに応用すれば、より簡単にアニメーションを作ることが出来ます。::

    1.まず、動画にしたい複数の画像をリサイズします。ここでは400x300にしました。
    2.PhotoshopやGIMPで縦に長い新規画像を作成し、この中に先ほどの画像を映写機のフィルムのように順番に縦に並べていきます。これをPNGなどで出力します。ここでは画像「oj.png」とします。先ほどの画像を10枚並べるので画像サイズは300x4000です。
    3.HTMLファイルを作り、「<div id = "fg"></div>」という風にid付のdivエレメントを作ります。ここが表示領域になります。
    4.スクリプトは以下のようなものです。解像度が300x4000で、表示部分が10個あるので初期値に戻す条件を「ix > 4000」にしました。

    window.onload = function(){
        var fg = document.getElementById("fg");
        with(fg){
	          style.width = "300px";
	          style.height = "400px";
	          style.backgroundImage = "url('oj.png')";
	          style.backgroundRepeat = "no-repeat";
        }
        var ix = 0;
        setInterval(
            function(){
                fg.style.backgroundPosition = "0 -" + ix + "px";
                ix += 400;
                if(ix>4000)ix=0;
            },100);
        }

これを応用すると、スライドショーやサムネイル表示なども作ることができ、「配列無し」であらゆるコンテンツを作ることが可能になります。

JavaScriptで日本語の変数を使う
--------------------------------------------

ECMA262-3以降のECMAScriptでは日本語をオブジェクトやメソッドの名前に使えます。下のスクリプトはブラウザ上に「直江兼続」「リン・ミンメイ」と表示します。::

    <html xmlns:xlink="http://www.w3.org/1999/xlink">
    <head>
	  <title>test</title>
	  <script type="text/javascript">
		var 愛 = {
			天地人 : function(){
				document.body.innerHTML += "直江兼続";
			},
			おぼえていますか : function(){
				document.body.innerHTML += "リン・ミンメイ";
			}
		}
		window.onload = function(){
			愛.天地人();
			愛.おぼえていますか();
		}
	  </script>
    </head>
    <body>
    </body>
    </html>

同一ドメインでJavaScript対応ブラウザ用ページと非対応ブラウザ用ページを振り分ける簡単な方法
----------------------------------------------------------------------------------------------------------------------

日本でもノキアのスマートフォンやウィルコムのW-ZERO3シリーズなどのようにJavaScriptに対応するブラウザを持つ携帯電話は増えてきていますが、まだまだFOMAなどの携帯サイトのように非対応のブラウザを搭載しているものもま
だまだ多いのが実情です。PC用のWebサイトをすでに持っていて、携帯サイトを用意したいとき、新たに構築するのは面倒と考える方もいるでしょう。そんなとき、同一ドメインでJava Script対応ブラウザと非対応ブラウザ、それぞれに対してJavaScriptの処理を振り分ける簡易な方法を紹介しましょう。それは非常に簡単なことで、まずXHTMLをキッチリと書きます。これは携帯電話ブラウザで
もJava Script対応・非対応ブラウザでも見ることが出来るように書く必要があります。そして、対応ブラウザにはJavaScriptのinnerHTMLで書き換えます。bodyタグ直下にbody内容を一くくりにするdivタグを埋め込みid名を設定します。Java
Scriptのdocument.getElementById(id).innerHTMLで書き換える内容を記述してやり、ページがロードしたときにこのスクリプトが起動するように設定するだけです。Java Scriptを外部化しておけば、メンテナンスも楽です。もちろん、innerHTMLにはJavaScript/CSSを含むことも可能です。ただ、それでは煩雑になるので、XHTMLへJava Scriptで直接DOMコントロールする方が自然でしょう。つまり、非対応ブラウザにはXHTMLで対応し、対応ブラウザにはJavaScriptで対応するという最もシンプルかつ確実な場合分けがあるということです。


JavaScriptがニャルラトホテプ言語に((」・ω・)」うー!(/・ω・)/にゃー!)
----------------------------------------------------------------------------------

http://gigazine.net/news/20120528-unyaencode/

◇名状しがたいプログラミング言語のようなもの Nyaruko　いつもニコニコ あなたの隣に 這いよる混沌 ニャルラトホテプ言語 です

https://github.com/masarakki/nyaruko_lang

◇JavaScript→(」・ω・)」うー!(/・ω・)/にゃー!エンコーダ

http://sanya.sweetduet.info/unyaencode/


○JavaScript

::

 alert("(」・ω・)」うー!(/・ω・)/にゃー!")

○ニャルラトホテプ言語::

 (」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!CHAOS☆CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!CHAOS☆CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!Let's＼(・ω・)／にゃー﻿Let's＼(・ω・)／にゃー﻿(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!Let's＼(・ω・)／にゃー﻿CHAOS☆CHAOS!(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!CHAOS☆CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!CHAOS☆CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!CHAOS☆CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!Let's＼(・ω・)／にゃー﻿(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!(」・ω・)」うー!!!(／・ω・)／にゃー!!!Let's＼(・ω・)／にゃー﻿CHAOS☆CHAOS!(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!CHAOS☆CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー(／・ω・)／にゃー(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!!(／・ω・)／にゃー!!(」・ω・)」うー!(／・ω・)／にゃー!Let's＼(・ω・)／にゃー﻿CHAOS☆CHAOS!(」・ω・)」うー!!!(／・ω・)／にゃー!!!I WANNA CHAOS!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!(」・ω・)」うー!(／・ω・)／にゃー!Let's＼(・ω・)／にゃー﻿
