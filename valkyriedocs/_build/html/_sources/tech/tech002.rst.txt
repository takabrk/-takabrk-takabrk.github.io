.. Viper Tools documentation master file, created by
   sphinx-quickstart on Wed Feb  3 16:26:19 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

CSS Hacks
=========

CSS Spritesでサーバへのアクセス数を減らしてWebサイトのレスポンスを上げる
----------------------------------------------------------------------------------------------------

    `The Mystery Of CSS Sprites: Techniques, Tools And Tutorials <http://www.smashingmagazine.com/2009/04/27/the-mystery-of-css-sprites-techniques-tools-and-tutorials/>`_

::

    CSS Sprites are not new. In fact, they are a rather well-established technique and have managed to become common practice in Web development. Of course, CSS sprites are not always necessary, but in some situation they can bring significant advantages and improvements - particularly if you want to reduce your server load. And if you haven't heard of CSS sprites before, now is probably a good time to learn what they are, how they work and what tools can help you create and use the technique in your projects.

上記サイトはCSS Spritesの成り立ちや使用方法、CSS Sprites用の画像の作り方などが書かれています。

CSS SpritesはWebサイトやBlogで使う複数の画像を一つの画像にして、CSSのbackground-positionを使って表示する方法です。画像生成にはPhotoShopやGIMPなどで作ります。その際にはグリッドを表示して作業するとやりやすいです。最近ではネットサービスでもCSS Sprites用の画像を生成することが出来ます。CSS Spritesは以下のようにします。::

    1.PhotoShopやGIMPなどのレタッチソフトで複数の画像を一つの画像ファイルにします。透過させたい場合はPNGやGIFで出力します。
    2.CSSのbackground-imageでCSS Sprites用の画像を読み込み、background-repeatをno-repeatにし、background-positionで表示したい部分を指定します。「background-image : x y」という風に書き、x、yに座標を書きます。+方向にあるので画像を-方向へ動かす必要があります。よって、x、yの値は負になります。

どうしても少しファイルが大きくなりますが、それと引き換えにサーバへのアクセス数が大幅に減るので、レスポンスがかなり向上します。CSS Spritesのデメリットは画像ファイルを大きくし過ぎると、Webサイトのレスポンスが落ちることでしょう。大きな画像には通常の方法で表示し、パーツ部分だけCSS Spritesを使用するとWebサイトのパフォーマンス向上に貢献できるでしょう。

CSS Sprites用ジェネレーターには以下のものがあります。細かい調整をする時は自分で調整した方が納得できると思います。

    `Data URI[CSS] Sprites <http://duris.ru/>`_
    `CSS Sprite Generator <http://drupal.org/project/sprites>`_

◇CSS Spritesのデメリット::

    ・画像の容量が大きすぎると、読み込みに時間がかかる
    ・CSSで背景の繰り返しを行う場合は全ての画像を繰り返してしまうので使えない

CSSのoverflowを使った大量の情報を整理する方法
------------------------------------------------------------------

Ｗｅｂサイトを作ると、載せたい情報が大量になり、リンクを作ってそのページに誘導します。しかし、Googleなどの検索エンジンにクロール時にサイ トの情報を見つけてもらうには出来るだけ元の文章のまま載せておくのが一番いいのです。そこで、枠からはみ出す情報をCSSのoverflowの scrollを使って、フレーム風にしてあげるといいでしょう。::

    div{
	      overflow : scroll;
    }

これでフレーム風の表示が出来、大量の情報を綺麗に見せることが出来ます。

ブラウザ別にCSSを適用するCSSハック
------------------------------------------------

◇スターハック::

    * html
        #hack {
	      color:#000000;
   }

セレクタの前に「* html」(*とhtmlの間に半角スペースが必要)をつけます。IE4～6、 Mac版4～5に対応。Validatorを通る。マッチする要素はHTML上に出現しない

◇スター7ハック::

    html*
          p {
	            color:#FF0000;
          }
    }

Windows IE 5.5?6、Mac IE 5、Safariのみにスタイルを適用する。セレクタの前に「html*」 (htmlと*の間は詰める)を記述する。Validatorを通らない。

◇アンダースコアハック::

    #hack{
	       color:#000000;
    }

IE4～6にだけ対応させたい場合はプロパティの前にア ンダースコアをつけます。Validatorを通らない。

◇Hollyハック::

    /*コメント文 \*//*/
    p{color:#ff0000;}
   /*コメント文*/

コメント文に「\*//」を付けるとMac版IE5のみに適用、「\」を追加するとMac版IE5のみ除外することが出来ます。 Hollyハックから抜けるためには、再度コメント文を記述します。Validatorを通らない。

◇ ハッシュハック::

    p{
	      #color:#FF0000;
    }

IE4～6,Mac IE5,Firefox,Opera7のみに適応させたいときに使う。プロパティの前に「#」を記述する。Validatorを通らない。

◇IE6のみ除外::

    #hack{
	      color/**/:#000000;
    }

IE6のみ除外したい場合は、プロパティの後に「空白+　/**/」を記述する。Validatorを通る。

◇IE7のみに適応させる::

    *:first-child+html
        #hack{
	          color:#ff0000;
        }

IE7のみに適応させる場合はセレクタの前に「*:first-child+html」を記述する。Validatorを通る。

◇IE7とモダンブラウザのみに適応させる::

    html>body #hack{
	      color:#ff0000;
    }

IE7とモダンブラウザ(Firefox,Opera,Safariなど)に適応させたい場合は、セレクタの前に 「html>body」を記述する。Validatorを通る。

◇IE7を除くモダンブラウザに適応させる::

    html>/**/body#hack{
	      color:#ff0000;
    }

IE7以外のモダンブラウザに適応させる時は、セレクタの前に「html>/**/body」を記述する。Validatorを通らない。

◇Safariのみ適応させる::

    html:\66irst-child
        #hack{
	           color:#ff0000;
        }

セレクタの前に「html:\66irst-child」を記述する。Validatorを通らない。

◇XHTMLでのIEへの適応::

    <!--[if It IE7]>
	      <link rel="stylesheet" type="text/css" href="css/test.css" media="screen" />
    <![endif]-->

ＩＥの特定バージョンにのみ適応させることが出来ます。上記の場合は「IE7未満のバージョンに適応させる」ことを意味します。

◇clearfix::

    /*IE7以外のモダンブラウザ向け*/
    .clearfix:after{
	      content:".";
	      display:block;
	      height:0;
	      clear:both;
	      visibility:hidden;
    }
    /*IE7およびMacIE5向け*/
    .clearfix{
	       display:inline-block;
    }
    /*Hides from IE-mac\*/
    * html .clearfix{
	       height:1%;
    }
   /*End hide from IE-mac*/
   /*IE6以前向け*/>
   .clearfix{
	     display:block;
   }
   ◇Caioハック
    /*コメント文 /*/
   p{
	     color:#ff0000;
   }
   /*コメント文*/

コメント文に「/」を追加すると、Netscape　4用を除外することが出来ます。Validatorを通ります。

◇Fabriceインバーション::

    /* コメント文/*//*/
    p{
	      color:#FF0000;
    }
   /* コメント文*/

コメント文に「/*//」を追加すると、NetScape 4,Opera4～5に適用される。Validatorを通る。

◇xmlns属性ハック::

    html[xmlns] p{
	      color:#FF0000;
    }

属性セレクタをサポートするFirefox,Opera,Safariで適用出来る様にする。Validatorを通る。

◇:root属性ハック::

    :root p{
	       color:#FF0000;
    }

Firefox,Opera,Safari,Mac IE5に適用される。Validatorを通る。

◇@importハック::

    @import "wie4.css";
    @import url("mie4.css");

上がIE4を除外、下がMac IE4.5を除外します。

◇!importantハック::

    .hoge{
	      color: red!important;
	      color: blue;
    }

プロパティを設定した後に、「!important」を追加すると「!important」のプロパティが最優先されます。IE6以下では未対応なので、モダンブラウザとIE6以下との場合分けに有効です。

解像度が変わっても常に中央にコンテンツが表示される方法
-------------------------------------------------------------------------

CSSを使って、テーブルを使ったときのようなサイズ可変可能なページレイアウトを実現する。あるいは、コンテンツを中央に表示することができる。

marginの値がポイント。左右のmarginの値をautoにすると自動でページの両側の余白を調整してくれる。また、positionは指定しないようにしたい。サイズが可変しなくなる。

１．コンテンツを中央に表示させたい場合::

    .baselayer{
	      width:600px;
	      margin:10px auto;
	      padding:0;
    }

２．コンテンツの幅を変更したい場合::

    .baselayer{
	      width:50%;
	      margin:0;
	      padding:0;
    }

CSSのfloatを使った段組レイアウト
-------------------------------------------

    .baselayer{
	      width:600px;
	      float:right;
	      margin:0;
	      padding:0;
    }

floatの値がポイント。回り込ませたいボックス要素を右に回り込ませたいなら「right」を、左に回りこませたいならば「left」を指定する。２段組だけでな く、<br>３段組など数を多くしても簡単に実現できるが、各ボッ<br>クス要素のwidthの値には注意が必要。リキッドレイアウトを使うときに、入れ子状態（ボックス要素の中にボックス 要素を入れる）にしている 場合、widthを十分にとっておかないとレイアウト崩れの原因になる。HTML側では、回り込ませたいボックス要素を先に記述しておくとよい。

リストの文頭のマークに画像を入れる
---------------------------------------------

CSSのリストの設定を次のようにすると、文頭のマークに好きな画像を入れることができる。::

    li{
	      list-style-image:url("入れたい画像名");
    }

リストの文頭のマークを指定する
----------------------------------------

CSSのリストの設定を次のようにすると、文頭のマークを指定することができる。::

    li{list-style-type:マークタイプ;}
    マークタイプには次のようなものがある。
    disc 小さい黒丸
    circle 小さい白丸
    square　小さい四角
    decimal 算用数字
    decimal-leading-zero　十進数で１桁の場合、上位の桁にゼロを付加する
    lower-roman　ローマ数字（小フォント
    upper-roman　ローマ数字（大フォント)
    lower-latin/lower-alpha　英小フォント
    upper-latin/upper-alpha　英大フォント
    hebrew　ヘブライ数字
    georgian　グルジア数字
    armenian　アルメニア数字
    lower-roman　小フォントの古代ギリシャフォント
    cjk-ideogrophic　漢数字
    hiragana　平仮名
    katakana　カタカナ
    hiragana-iroha　平仮名のいろは
    katakana-iroha　カタカナのいろは
    none　なし

マウスオーバーすると文字が大きく表示される
-------------------------------------------------------

CSSで文字サイズを大きく設定すると、スクリプトなしでインパクトの大きい演出ができる。文字のかわりに画像を使ってもよい。::

    .layer11{
       float:left;
       width:780px;
       height:100px;
       margin:0;
       padding:0;
    }
    .layer11 a{
       color:#ffffff;
       font-size:10pt;
    }
    .layer11 a:hover{
        color:#ff0000;
        font-size:20pt;
   }
   
