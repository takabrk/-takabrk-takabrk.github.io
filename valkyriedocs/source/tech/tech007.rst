PlayOnLinux(Wine)で動作するソフトウェアまとめ
====================================

◇Wine 3.0の変更点

以下でWine 3.0の変更点が記載されています。主にDirect3D 10/11がサポートされた事でグラフィック周りが強化されています。

https://www.winehq.org/announce/3.0



◇Wine 2.0のリリースポイント

https://www.winehq.org/announce/2.0

安定版のWineもバージョン2.0になりました。

Microsoft Office 2013が動作するようになったり、MacOS上で64bit版が動作するようになってきたりと様々な機能強化が図られています。APIをシステムコールに置き換える方式を採用していますので、完全な仮想マシンにおけるエミュレーションよりもソフトウェアの動作が速くなっているのが、Wineを使う上でのメリットとなっています。


PlayOnLinuxは、Linux上でWindowsのソフトウェアを動作させる為のAPIレイヤー「Wine」の管理ソフトウェアです。

このソフトウェアでどのWindowsソフトウェアが動作するかは、Wineの公式サイトのデータベースであるhttps://appdb.winehq.org/で調べる事が出来ます。

ここでは、実際に動作確認したソフトウェアを纏めています。

［環境］
・64bit版Ubuntu系Linuxディストリビューション

・PlayOnLinux 4.2.10（64bit環境や32bit環境を効率的に一元管理出来る。）

・64bit版Wine 2.0.1,Staging版Wine 2.5

・winetricksでライブラリなどをインストール済み

・Windowsのバージョンを「Windows Vista」に設定

市販ソフトウェアでインストール時にDVD-ROMが必要になる物が多いので、ディスクをDVD-ROMドライブに設置したり、DVD-ROMをISO化してFurius ISO mountなどで仮想ドライブとしてマウント、あるいは、中身を任意のディレクトリに入れて、Wineの設定画面でディレクトリを直接指定してインストールします。
この方法は、必ず成功するとは限りません。

また、同人ソフトは、インストーラーでインストールする物が多くありますが、直接実行ファイルを起動させるタイプの方が起動確率は高いです。Flash・2次元ゲームの起動率は高く、3Dゲームはユーザーの環境依存が強くて、エラーが出る確率が高いようです。

◇PlayOnLinuxの各仮想環境上でwinetricksを起動させる方法

winetricksは、Wine環境に様々なライブラリや環境設定を視覚的に行えるツールです。Linux上ではターミナルエミュレーターで以下のコマンドを実行すると起動します。::

    $winetricks

PlayOnLinuxでも各仮想環境でwinetricksを使う事が可能です。「設定」→仮想ドライブを選択→「Miscellaneous」→「シェルを開く」でシェルを起動させ、前述のコマンドを実行するとwinetricksが起動します。

［動作確認したソフトウェア］

()内はソフトウェアが動作した仮想環境の対応ビット数。32bit環境でしか動作しない物があるので注意する事。

◇ツール

(64)Processing3 - Javaベースのグラフィカルアプリケーションプログラミング環境

(64)AviUtl 1.00　ー　動画編集

(64)Giam　ー　アニメーションGIF編集

(64)hugflash　ー　Flashに含まれる要素の抽出

(64)巡集　ー　Webサイトの収集

(64)縮専　ー　画像拡大縮小ツール

(64)Construct2　ー　HTML5ゲーム制作ツール

(64)Wolfエディター　ー　RPG制作ツール

(64)Fighters Factory 3　ー　M.U.G.E.N用キャラクター・ステージ制作ツール

(64)M.U.G.E.N 1.1β　ー　2D格闘ゲームエンジン

(64)Stirling　ー　バイナリエディタ

(64)FavBinEdit　ー　バイナリエディタ

◇ゲームエミュレーター・パソコンエミュレーター

(64)nnnesterJ　ー　ファミコンエミュレーター

(64)Neko Project II　ー　PC9801シリーズエミュレーター

(64)Ootake　ー　PCエンジンエミュレーター

(64)SNES9X　ー　スーパーファミコンエミュレーター

(64)WinX68k High Speed　ー　X68000エミュレーター

(64)ePSXe　ー　プレイステーションエミュレーター。ジョイパッドを使う場合には、QJoyPadなどのキー設定ソフトウェアを使った方が良い。

◇市販ゲーム

(64)Ultra Street Fighter IV(Steam版、輸入版。PlayOnLinuxで64bit環境を構築する必要あり。ネイティブ版quartz.dllを使ってもムービー再生が出来ず、これを使った場合、ゲームが落ちる。）

https://appdb.winehq.org/objectManager.php?sClass=application&iId=16370

◇市販18禁ゲーム

(32)手籠めにされる九人の堕女（インストール後にNoDVD化）

(32)尾行２（32bit環境でのみ成功。ディスクから収録されているファイルを全て新規作成したフォルダの中に入れて、それをWineの仮想ドライブに常時割り当てておく。）

(32)尾行３（NoDVD化必要。無修正パッチ対応、32bit環境でのみ成功）

(64)CROSS CHANNEL（NoDVD化必要）

(64)Fate/stay night（NoDVD化必要）

(32)FORTUNE ATERIAL（AlphaROM 3.x .000生成型汎用によるNoDVD化必要。ネイティブ版quartz.dllでムービー再生可能。）

(64)いいなり生徒会長

(64)セックス＆フレンズ

(64)ダンジョン＆ヒロインズ

(32)パルフェ(NoDVD化必要。ネイティブ版quartz.dllでムービー再生可能。) - 1.8以降カーソルが自動的に動く不具合

(64)戦乙女ヴァルキリー2（NoDVD化必要)

(64)中出し痴漢列車

(64)風紀委員長　片桐葉月

◇同人18禁ゲーム（ウディタ制作ゲームは終了時にGame.exeが終了しない事が多い。）

(64)DRAGON PRISON（終了時にGame.exeが終了しないのでタスクマネージャーでkillを行う事）

(64)DRAGON SLAVE（終了時にGame.exeが終了しないのでタスクマネージャーでkillを行う事）

(64)Dungeon of Retina

(64)Princess Saviour（終了時にGame.exeが終了しないのでタスクマネージャーでkillを行う事）

(64)RAPE GAME+

(64)travel淫g

(64)性技の味方　交配士セラの淫乱クエスト

(64)デルタの堕ちぶレイプ

(64)姦りに行けるアイドル

(64)姫レイプ条約

(64)少女妊娠無人島（終了時にGame.exeが終了しないのでタスクマネージャーでkillを行う事）

(64)彼女と彼女と私の七日

(64)ヤラぬなら止めてみせよう俺の町

(32)幻影のゴーストビル

(64)俺と凛の悶快なX

(64)JKハザード

◇同人ゲーム

(64)源平闘乱・愛

(64)ヴァンガードプリンセス

(64)箱庭の唄

(64)レミュオールの錬金術師

(64)しぇいむ☆おん(ネイティブ版quartz.dllでムービー再生可能)

(64)アサルとSPY

(64)ガールズバンド


PlayOnLinuxを起動させると、ユーザーディレクトリの直下に「.PlayOnLinux」というフォルダを作成されます。

この下にWine環境が構築される仕組みになっています。

複数のWine環境を構築する事ができ、32bit環境と64bit環境を分けたり、ソフトウェア毎に専用の環境を作成したりといった事が可能です。

但し、複数のWine環境を構築すると、その分だけディスクの容量が必要になってきますので、2～3ぐらいの環境を作っておくのがオススメです。

Linuxシステムで元々構築された32bitのWine環境（64bit Linux環境でも32bit Wine環境を作成する事は可能）の「default」と様々なソフトウェアを動作させている64bit Wine環境の「game」、32bit専用環境の「game32bit」しか作成していません。
環境が出来上がると以下のような感じになります。

Wine環境を一度構築して正常にソフトウェアが動作しているのであれば、出来るだけWineのバージョンは維持しておいた方が良いです。新しいバージョンのWineで動作する保証が無い上に、動作しなくなっている可能性も高いからです。
新しいバージョンのWineを試したい場合は、「default」という仮想ドライブがシステムのWineを使う設計になっていますので、システム側のWineを変更していけば対応出来ます。

Linux環境は、サーバ構築やプログラミング環境構築などオープンソースウェアを使って、強力な開発環境を構築するのに非常に優れています。
一方で、Windows環境は、パーツの入れ替えを行うとアクティベーションをする必要があり、パーツを入れ替え過ぎると再アクティベーション時に、ネットで認証が出来なくなってサポートに電話をかけて、コードを聞き出す作業まで発生する事があります。
優れた市販ソフトウェアや同人ソフトが多数あるWindows環境は、オフィスツールを使う環境やゲーム環境などに最適です。
このWindows環境の資源を有効活用しようというのが、WineやPCエミュレーターといったソフトウェアを使う利点です。

Wineは、Windows APIを他のOSに移植するといった意欲的なプロジェクトですが、近年発売されているWindowsソフトウェアは様々なプロテクトやアクティベーションが施されていますので、本家のWindowsのように完全にソフトウェアが動作するわけではありません。
しかし、バイナリエディタや動画編集ソフト、ゲーム制作ツールなどがWineである程度動作しますので、Linux環境には無い機能をWindowsソフトウェアで補うといった使い方が出来る点で便利です。

Linuxでは、SMPlayerやChromium Browser、GIMPやInkscapeやHandbrakeなど一般的な用途で使うソフトウェアからEmacsやPCSX2やPPSSPPなどディープなソフトまで数多く揃っています。
これらはWindowsにも移植されていたり、マルチプラットフォーム展開されていたりしますので、わざわざWineでWindows版を動作させる必要は無く、Linuxネイティブ版を使えば十分です。

超高精細な最近の3Dゲームを動作させたい場合には、別途Windows搭載マシンを用意した方が良いでしょう。

PlayOnLinuxは、環境構築が上手く出来れば、Linux環境とWindows環境を統合出来る手段として優れているツールと言えます。

イリュージョン「尾行2」インストール方法
-------------------------------------------------

1.製品CD2枚を用意して光学ドライブにセットするか、ISOとしてリッピングする。ISOを使う場合には、Furius ISO Mount(Synapticパッケージマネージャーなどからインストール可能)をインストールし、マウントさせる。

2.新しくフォルダを作成して、その中にCD-ROM、ISOの内容をコピーアンドペーストする。ここでは作成したディレクトリを１枚目のCD-ROMの内容が入っている物を「biko2base」、２枚目のCD-ROMの内容の物を「biko2w」とします。

3.winecfgを端末などから起動させ、ドライブタブの部分でDドライブレターに先ほどのbiko2baseを指定する。

4.インストール用の実行ファイルをWineで起動させてインストールする。

5.ゲームを起動させると2枚目のCD-ROMが必要になるという内容のメッセージが発せられるので、winecfgのドライブタブからDドライブにbiko2wを指定する

6.biko2wのゲーム起動実行ファイルをWineで起動させると、ゲームが遊べます。

イリュージョン「尾行3」インストール方法
-------------------------------------------------

1.製品DVD-ROMを用意し、DVDドライブにセットするか、ISOとしてリッピングし、Furius ISO Mount(Synapticパッケージマネージャーなどでインストール可)を使ってマウントする

2.新しくディレクトリ「Biko3」を作成して、DVD-ROMの中身をコピーアンドペーストする。

3.Biko3フォルダをwinecfgのドライブタブからDドライブとして指定する

4.NoDVDパッチをダウンロードする

http://www.rabidfiles.com/5AX

5.Biko3フォルダにNoDVDパッチを適用する

6.出来た実行ファイルをWineで起動させて、インストール作業を行う

7.無修正化させたい場合には、Uncensor.English.Menusパッチをダウンロードして適用させる

http://www.rabidfiles.com/5AW

Ubuntu 14.04 LTS/12.04 LTSでWineがインストール出来ない現象の対処方法
-------------------------------------------------------------------------------------------------

WineはWindowsのAPIをLinuxに移植しようというプロジェクトです。 このWineをUbuntu 14.04 LTS/12.04 LTSにインストールすることで、Windowsのソフトウェアを動作させることが出来ます。 しかし、インストールの時にエラーが出てインストールが出来ないことがあります。::

    Some packages could not be installed. This may mean that you have
    requested an impossible situation or if you are using the unstable
    distribution that some required packages have not yet been created
    or been moved out of Incoming.
    The following information may help to resolve the situation:

    The following packages have unmet dependencies:
    wine : Depends: wine but it is not going to be installed
    E: Unable to correct problems, you have held broken packages.

以上のようなメッセージが出た場合、対処法としては「i386」と書かれたアプリケーションをインストールすることです。 APTのリストに現れない場合には以下のコマンドを打ち込みます。::

    $dpkg --add-architecture i386

この後に、「sudo apt-get update」を行なって通常のインストールを行えばインストールすることが可能になります。

Wineでジョイパッドのキーが効かない時の対処法
------------------------------------------------------------

Wine1.4にバージョンアップしてからは、基本的にはDirect Xを別途用意しなくてもWindowsのソフトの起動率と動作安定度はずいぶん上がりました。しかし、たまにWineでジョイパッドのキーが効かないことがあります。その時は、ジョイパッドのキーにキーボードのキーを割り当てましょう。「QJoyPad」というソフトウェアが便利です。

http://qjoypad.sourceforge.net/

リポジトリを公開している人もいます。

http://linux.ikoinoba.net/index.php?UID=1320506521

::

    $sudo add-apt-repository ppa:ikoinoba/ppa
    $sudo apt-get update
    $sudo apt-get install qjoypad

Augustの18禁ゲーム「FORTUNE ARTERIAL」をWineで動かす
-----------------------------------------------------------------------------

Augustの18禁ゲーム「FORTUNE ARTERIAL」をUbuntu 10.10で動かしてみました。WineとVirtualBoxで動いています。 VirtualBoxは普通に3D/2Dアクセラレーション機能をオンにした仮想PCにXP以降のWindowsを入れて、FORTUNE ATERIALをインストールすれば遊べます。
問題はWineの方です。 1.FORTUNE ARTERIALのDVD-ROMをPCの光学ドライブにマウントして、インストールする。あるいはISO化(ここではFA.ISOとする）している場合はhomeフォルダに置いて、以下のコマンドでマウントします。::

    $sudo mount -o loop FA.ISO /media

/media/FORTUNE ARTERIAL/SetUp.exeを右クリックメニューのWine Windows Program Loaderで起動させると、インストール出来ます。

2.FORTUNE ARTERIALにはAlphaROMと呼ばれるプロテクトがかけられています。これを解除するには本来は初起動時にインストールディスクを使うのですが、Wineでは先程のマウント方法では出来ませんでした。そこでこのプロテクトを解除します。

AlphaROM 3.x .000生成型汎用 rev2またはAlphaROM 2.1～3.1汎用 rev4を使います。ここでパッチを当てるのは「reg.exe」というファイルです。パッチの当て方はAlphaROM 3.x .000生成型汎用 rev2またはAlphaROM 2.1～3.1汎用 rev4を起動させて、reg.exeを選択してください。

3.後はBGI.exeを起動すると、ゲームが遊べます。

http://anbalanz.blog33.fc2.com/blog-entry-117.html

SquashFSとaufsを使って、Wineのフォルダを一つのsquashfsファイルにして管理する方法
----------------------------------------------------------------------------------------------------------

SquashFSとaufsを使って、Wine用のフォルダ「.wine」を一つのsquashfsファイルにして管理することが出来ます。作業は全てhomeディレクトリ上で管理者権限で行っています。

1.wine_cacheフォルダを作成する::

    #mkdir wine_cache

2.「.wine」フォルダをSquashFSで圧縮する::

    #mksquashfs .wine wine.squashfs

3.元の「.wine」をリネームし、新規に空の「.wine」フォルダを作成する::

    #mkdir .wine
    #chmod 777 .wine

4.wine.squashfsをマウントする::

    #mount -o loop wine.squashfs .wine

5.「.wine」を書き込み用のディレクトリ「wine_cache」にマウントする::

    #mount -t aufs -o br:wine_cache:.wine none .wine

これで今までのWineの設定・アプリケーションを使用できるようになりました。以後、4,5の作業をすればいつでもwine.squashfsを使うことが出来ます。/etc/fstabで設定しておけば、システム起動時に自動的にマウントすることが可能です。アンマウントするときは以下のようにします。::

    #umount wine_cache
    #umount .wine

Wineの文字化けを防ぐレジストリファイル
--------------------------------------------------

◇wine_font_reg.reg::

    [HKEY_CURRENT_USER\Software\Wine\Fonts\Replacements]
    "MS Gothic"="IPA モナー ゴシック"
    "MS Mincho"="IPA モナー 明朝"
    "MS PGothic"="IPA モナー Pゴシック"
    "MS PMincho"="IPA モナー P明朝"
    "MS UI Gothic"="IPA モナー UIゴシック"
    "ＭＳ ゴシック"="IPA モナー ゴシック"
    "ＭＳ 明朝"="IPA モナー 明朝"
    "ＭＳ Ｐゴシック"="IPA モナー Pゴシック"
    "ＭＳ Ｐ明朝"="IPA モナー P明朝"
    [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink]
    "Lucida Sans Unicode"=hex(7):69,70,61,67,75,69,2d,6d,6f,6e,61,2e,74,74,66,2c,49,50,41,20,83,82,83,69,81,5b,20,55,49,83,53,83,56,83,62,83,4e,00,00
    "Microsoft Sans Serif"=hex(7):69,70,61,67,75,69,2d,6d,6f,6e,61,2e,74,74,66,2c,49,50,41,20,83,82,83,69,81,5b,20,55,49,83,53,83,56,83,62,83,4e,00,00
    "Tahoma"=hex(7):69,70,61,67,75,69,2d,6d,6f,6e,61,2e,74,74,66,2c,49,50,41,20,83,82,83,69,81,5b,20,55,49,83,53,83,56,83,62,83,4e,00,00
    [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontSubstitutes]
    "Tahoma"="MS UI Gothic"
    [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontSubstitutes]
    "MS Sans Serif"="MS UI Gothic"

IPA モナーフォントをインストール後、regeditを起動して、「ファイル」からこのレジストリファイルをインポートし、Wineを起動すれば文字化けを直すことが出来ます。

Ubuntu+Wineの環境にWindowsのDLLなどをインストールする「winetricks」
--------------------------------------------------------------------------------------------

http://wiki.winehq.org/winetricks

Ubuntu +Wineの環境はまだ真っ新なXPのような状態で、これに各種DLLやランタイム、Direct Xなどを入れる必要があります。そこで簡単にWineにDLLなどをインストールすることが出来るスクリプトが「winetricks」です。

1.ターミナルで以下のコマンドを打ち、winetricksをダウンロード、インストールします。::

    $wget http://www.kegel.com/wine/winetricks

2.下のコマンドで各種DLL、ランタイムをインストールすることが出来ます。アプリ名はwinetricksの公式サイトに掲載されています。::

    $sh winetricks corefonts アプリ名

Wineで動くアプリケーションが増えていくと思います。ゲームはUbuntuの「ホーム」にファイルを持ってくると起動させやすいです。

Ubuntu 10.04+Wine環境でAviUtlを使う
----------------------------------------------------

Windowsの定番動画編集環境をUbuntu 10.04 + Wineの環境で使うことが出来ます。

1.AviUtlとプラグインを「~/.wine/drive_c/Program Files/」直下に置く。

2.winetricksをダウンロードする。::

    $wget http://www.kegel.com/wine/winetricks

3..NET Franework、VC++2008、DirectX 9.0cなどをwinetricksでインストールする。::

    $sh winetricks dotnet20 vcrun2008 vb5run vb6run directx9

4.Wineのレジストリエディタを起動し、以下の項目と値を追加して、環境変数にパスを通します。端末で「regedit」と入力して、レジストリエディタを起動

「HKEY_LOACL_MACHINE/System/CurrentControlSet/Control/Session Manager/Enviroment」の「PATH」に「C:\Program Files\aviutl99\plugins（AviUtlのプラグインがある場所を指定）」を追加すると、環境変数にパスが通り、プラグインが使えるようになります。

5.後はエンコードに必要なコーデックなどをWindowsの時と同じようにインストールしていきます。ただし、「.inf」「.ax」といった拡張子を持つファイルでインストールするものは以下の方法でインストールします。::

    ・「.inf」の場合
    $ wine rundll32 setupapi,InstallHinfSection DefaultInstall 132 [filename].inf
    ・「.ax」の場合
    Wineのコマンドプロンプトを起動 $wine cmd 「.ax」の拡張子を持つファイルをc:/windows/system32にコピーし、system32フォルダで以下のコマンドを打ってインストールする。 >regsvr32 [filename].ax

これで一通りAviUtlで動画編集・エンコードが出来ます。
