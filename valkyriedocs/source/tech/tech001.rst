.. Valkyrie SRX documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Ubuntu系ディストリビューション向けテクニック
=====================================

ChromiumにTVerやInstagram用のユーザーエージェントを追加してみた
--------------------------------------------------------------------------------------

Google ChromeやChromiumのユーザーエージェントを変更して、TVerの視聴やInstagramのPCからの投稿を可能にする方法
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. raw:: html

    <iframe width="560" height="315" src="https://www.youtube.com/embed/5w79Bo83OxM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

User-Agent Switcher
^^^^^^^^^^^^^^^^^^^^^
https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg/related?hl=ja

Google ChromeやChromiumなどのChrome系ブラウザでユーザーエージェントを変更しようと思いますと、User-Agent SwitcherというChrome拡張を利用するのが便利です。

TVerは、Linux版のChromiumで正常に動作しなくなってしまっているので、Firefoxのユーザーエージェントを変更して観る事が出来るようになります。僕の場合は、Mac版Firefoxの最新版のユーザーエージェントに変更しています。ちなみに、Windows版Firefoxのユーザーエージェントでも構いません。

Mac版Firefoxのユーザーエージェント
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

    Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:63.0) Gecko/20100101 Firefox/63.0


ブラウザのタスクボタンにUser-Agent Switcherがあるのであれば、右クリックでメニューを出す事が出来ますので、「オプション」を選びます。そして、そこに表示されている項目一覧でカスタマイズが出来ます。不要なユーザーエージェントは削除しておきますと、使う時にスッキリとして使い易くなるでしょう。

.. image:: ../_images/Screenshot20from202019-10-122017-10-57.png

.. image:: ../_images/Screenshot20from202019-10-122017-11-11.png

TVerにはWindows版・Mac版のFirefoxのユーザーエージェントを設定しておけば、視聴する事が可能になります。Instagramは、モバイル版のブラウザのユーザーエージェントを使う事で投稿・削除が出来るようになります。

カスタマイズしたユーザーエージェントを特定のサイトのみで自動的に割り当てるようにする事も可能であり、「Permanent Spoof List」という項目で設定を行ってください。ドメインですので、「https://」などの部分やディレクトリ部分にあたる所は省いて構いません。

僕の場合は、以下のように設定しました。

.. image:: ../_images/Screenshot20from202019-10-122017-28-18.png

この設定を行う事で、Instagramはモバイルページ版の物が表示されますし、TVerもJavaScriptがちゃんと機能するようになり、視聴が可能になります。
モバイル版Instagramは、下部に写真投稿などのアイコンメニューが表示されます。

.. image:: ../_images/Screenshot20from202019-10-122017-31-51.png

TVerでは、JavaScriptが機能していますと、動画再生ボタンが真ん中に表示されます。この状態であれば、視聴が可能になります。

.. image:: ../_images/Screenshot20from202019-10-122017-32-05.png


Google Chromeでマインドマップを手軽に作る事が出来るChrome拡張「MindMap Tab」
------------------------------------------------------------------------------------------------------------

マインドマップをLinux上で作成する時に「FreePlane」というソフトウェアを使っていましたが、これはJavaのランタイムやGroovyというJVM言語が必要になり、結構インストールする依存パッケージがあります。アプリからいちいち起動してマインドマップを作るのも面倒臭いので、Chrome拡張で何か便利な物が無いかなと探したら、マインドマップツールを作っている人がいました(^_^;)。

◇もっとマインドマップを簡単に描くためにChrome拡張機能を作りました
 https://qiita.com/yoichiro6642/items/b465cbec2f3dcaaccdb0

実際に「MindMap Tab」をChromium Browserにインストールしたところ、かなり便利に使えています。インデントを入れる事で自動的に区分けしてくれますので、思いついた事をどんどんテキストフォームに入力していくだけというお手軽さがとても良いです。
セーブは自動的に行ってくれますし、履歴から過去のマインドマップデータを呼び出す事も可能となっています。また、PNGやJPEGで画像保存が出来ます。ブラウザから呼び出して直ぐに使えるのは大きな利点でしょう。

.. image:: ../_images/Screenshot20from202019-06-162015-39-06.png
    :scale: 50%

レイヤー毎の画像を保存する事が出来るスクリプト「continuos-save」をGIMP 2.10.10にで使えるようにするには
--------------------------------------------------------------------------------------------------------------------------------------

大量の画像を纏めて拡大・縮小・トリミングをするには、レイヤー毎に画像を入れて、この画像を保存出来るスクリプト「continuos-save」を使うのが便利です。オリジナルのサイトが消えていますので、改良版を導入すると良いでしょう。

 http://userweb.pep.ne.jp/tamubun/computer/continuous-save.html

continuos-saveの導入方法は簡単であり、WindowsとLinuxでは以下のようにしますと導入が可能です。

◇Windowsの場合

C:\Users\ユーザ名\AppData\Roaming\GIMP\2.10\scripts以下にcontinuous-save.scmを置く。

◇Ubuntuの場合

/home/ユーザー/.config/GIMP/2.10/scriptsにcontinuous-save.scmを置く。

注意するべき事は、GIMP 2.10.10ではそのままではエラーが出ます。これの対策として、continuos-save.scmの一部分を書き換えます。
137行目(+ 1 (* 2 tmp-image-type)) "Temp Layer" 100 NORMAL)))」となっていますが、NORMALの部分を0にします。これで、GIMPを起動しますとconinuos-saveが使えるようになり、レイヤー毎にある画像を個別に画像ファイルとして書き出せます。

Linux環境でAffter Effectsのような事をするにはどうすれば良いのか？
-------------------------------------------------------------------------------------

動画編集をする時に、WindowsやmacOSはAdobe Premiere ProやAfter Effectsといった高性能なソフトウェアが使えますが、Linuxの場合は、ShotcutやAvidemuxで動画編集をするのが良いと思います。個人的にはShotcutだけで良いと思いますが、問題はAfter Effectsに相当するソフトウェアが無いという事です。
そこで、一つの策としては、3DモデリングソフトウェアのBlenderを使うという事です。これで予めAfter Effectっぽい映像を作っておいて、Shotcut上で他の動画クリップと組み合わせる事で、高度な映像を作れるのではないかと思います。
ちなみに、Shotcutのフィルタ機能には面白い機能があって、HTML5の機能を使ったフィルタを適用出来たりします(^_^;)。工夫次第では、面白い表現が出来るかもしれませんね。

LinuxでもAfter Effectsっぽいモーショングラフィックスを作る事が出来るソフトウェア「Natron」がありましたが、公式サイトが落ちていました(^_^;)。

Blenderでモーショングラフィックスっぽい動画クリップを作るというのも有効な手段ですが、その他にはShotcutのHTML5フィルタを使うのも良いかもしれません。
JavaScriptやCSS3を使って表現が出来るので、Web技術に長けているなら、この機能を使ってみても良いのではないでしょうか？

Shotcutの公式サイトにHTML5フィルタを使った作例動画が公開されています。
 https://shotcut.org/blog/video-tutorial-using-html5/

Jack Audio Connetion Kitと連携せずにPulseAudioを高音質化させるには
--------------------------------------------------------------------------------------------

◇高音質化設定した/etc/pulse/daemon.conf
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
::

    # This file is part of PulseAudio.
    #
    # PulseAudio is free software; you can redistribute it and/or modify
    # it under the terms of the GNU Lesser General Public License as published by
    # the Free Software Foundation; either version 2 of the License, or
    # (at your option) any later version.
    #
    # PulseAudio is distributed in the hope that it will be useful, but
    # WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    # General Public License for more details.
    #
    # You should have received a copy of the GNU Lesser General Public License
    # along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.

    ## Configuration file for the PulseAudio daemon. See pulse-daemon.conf(5) for
    ## more information. Default values are commented out.  Use either ; or # for
    ## commenting.

    daemonize = no
    ; fail = yes
    ; allow-module-loading = yes
    ; allow-exit = yes
    ; use-pid-file = yes
    ; system-instance = no
    ; local-server-type = user
    ; enable-shm = yes
    ; enable-memfd = yes
    ; shm-size-bytes = 0 # setting this 0 will use the system-default, usually 64 MiB
    ; lock-memory = no
    ; cpu-limit = no

    high-priority = yes
    nice-level = -11

    realtime-scheduling = yes
    realtime-priority = 9

    ; exit-idle-time = 20
    ; scache-idle-time = 20

    ; dl-search-path = (depends on architecture)

    ; load-default-script-file = yes
    ; default-script-file = /etc/pulse/default.pa

    ; log-target = auto
    ; log-level = notice
    ; log-meta = no
    ; log-time = no
    ; log-backtrace = 0

    ;resample-method = src-sinc-best-quality
    resample-method = speex-float-5
    ; avoid-resampling = false
    ; enable-remixing = yes
    ; remixing-use-all-sink-channels = yes
    enable-lfe-remixing = yes
    ; lfe-crossover-freq = 0

    flat-volumes = no

    ; rlimit-fsize = -1
    ; rlimit-data = -1
    ; rlimit-stack = -1
    ; rlimit-core = -1
    ; rlimit-as = -1
    ; rlimit-rss = -1
    ; rlimit-nproc = -1
    ; rlimit-nofile = 256
    ; rlimit-memlock = -1
    ; rlimit-locks = -1
    ; rlimit-sigpending = -1
    ; rlimit-msgqueue = -1
    ; rlimit-nice = 31
    rlimit-rtprio = 9
    ; rlimit-rttime = 200000

    default-sample-format = float32ne
    default-sample-rate = 48000
    alternate-sample-rate = 44100
    ;default-sample-channels = 6
    ;default-channel-map = front-left,front-right,rear-left,rear-right,front-center,lfe
    default-sample-channels = 2
    default-channel-map = front-left,front-right

    default-fragments = 2
    default-fragment-size-msec = 125

    ; enable-deferred-volume = yes
    deferred-volume-safety-margin-usec = 1
    ; deferred-volume-extra-delay-usec = 0

Ubuntu系ディストリビューションでexFATを使うには
--------------------------------------------------------------

Windows 10のデフォルトのファイルシステムは、MicroSoft社が開発したexFATです。このファイルシステムは、従来のFAT32とNTFSといったファイルシステムの弱点を克服しており、LinuxやmacOSなどのOSと4GB超えのファイルのやり取りをする時に優れています。Ubuntu系ディストリビューションでもexFATを使えるようにしておく事で、システムドライブはext4、持ち運び用のデータドライブはexFATといった使い分けが出来るようになります。

Ubuntu 18.04 LTSのGpartedは、exFATのフォーマットに対応していません。exFATを取り扱う事が出来るツールを導入して、コマンドでのフォーマット、あるいはGUIでのフォーマットを行えるようにしましょう。

1.exFATを扱う為の2つのツールをインストール::

    $sudo apt-get install exfat-fuse exfat-utils

2.GUIで操作したい場合は、GNOME Disiksをインストール::

    $sudo apt-get install gnome-disks-utility

3.コマンドで使う場合は以下のようにターミナルエミュレーターでコマンド入力。

/dev/sdbをフォーマットして「xxx」というラベルを付けて、exFATでフォーマットしたい場合にはオプションを追加する。::

    $sudo mkfs -t exfat -n xxx /dev/sdb

あるいは、::

    $sudo mkfs.exfat -n xxx /dev/sdb

Windows系のファイルシステムの中では、exFATがext4などの他のファイルシステムと相性が良く、高速ですので、データ保存用のポータブルHDDやUSBメモリーのフォーマットはexFATにしておけば良いでしょう。

Ubuntu 18.04 LTSに廃止されたgksuをインストールするには
---------------------------------------------------------------------------

Ubuntu 18.04 LTS以降は、suのフロントエンドアプリであるgksuがリポジトリから削除され、インストールも出来ない状態になっています。しかし、現在でもUbuntu 16.04 LTS向けのgksuは公開されていますので、これをインストールする事で使えるようになります。但し、依存関係が色々とありますので、ターミナルでインストール作業をしながら必要に応じて依存関係を解消していかなければいけません。最低限2つのdebファイルが必要です。

◇gksu

 https://launchpad.net/ubuntu/+source/gksu

◇libgksu2-0
 https://packages.ubuntu.com/ja/xenial/libgksu2-0

2つのdebファイルを同じディレクトリに置いて、dpkgやapt installでインストールしていくと依存関係で必要な物を知る事が出来ますし、依存関係が解消されていれば、すんなりとインストール出来ると思います。::

    $sudo dpkg -i *.deb


Windows版Steamのクライアントを動作させる時に諸々の問題を解決しよう
--------------------------------------------------------------------------------------------

ゲームプラットフォームとして、すっかり定着したSteamで公開・販売されているソフトウェアはWindows版の物が多いです。Steamを使うには、クライアントソフトが必要になってきますが、Windows版・Mac版・Linux版が存在します。この中で、最も良いのは、Windows版です。動作するソフトウェアが非常に多いので、LinuxにおいてもLinux版＋Protonでは無くて、Wine+Windows版Steamを使うのが良いでしょう。しかし、Windows版Steamを使う上で色々と問題が起こりますので、これをクリアすれば、Windows環境と同じようにSteamが使えるようになります。

Windows版SteamをWineで使う場合には、ArchLinuxのWikiが参考に出来るでしょう。

◇Steam/Wine ArchLinux Wiki

 https://wiki.archlinux.jp/index.php/Steam/Wine

1.クライアントで文字化けが起こる、あるいは文字が表示されない。

クライアントのインストーラーを起動させて、Steamをインストールする時に文字が表示されなかったり、文字化けを起こしたりします。これを解決するには、インストーラーを起動させる時に、以下のWineのオプション「-no-dwrite」を追加します。::

    $wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-dwrite

2.クライアントのブラウザがうまく機能せずに、内容が表示されない

クライアントをインストール出来て、いざSteamを起動させますと、ブラウザが機能せずに内容が表示されない事があります。

32bit版Steamクライアントを以下のオプション「-no-cef-sandbox」を付けて起動させます。::

    $ wine ~/.wine/drive_c/Program Files/Steam/Steam.exe -no-cef-sandbox

これでも解決しない場合は、winecfgで調整する事で解決出来ます。

.. image:: ../_images/winecfg_steam.png
    :scale: 50%

Wineの設定の「Windowsのバージョン」を「Windwos Vista」「Windows XP」にして、Steamフォルダにある「X64launcher.exe」を指定します。Steamを再起動させれば、ブラウザが機能して内容が表示されます。

3.ウィンドウを閉じてもSteamクライアントが終了しない

ウィンドウを閉じてもSteamクライアントは終了しません。必ず、Steamメニューにある「終了」の項目から終了させてください。

基本プレイ無料のWindows版18禁ゲーム「Crystal Maidens」をSteamにインストールして、起動させてみました。

.. image:: ../_images/cm001.png
    :scale: 50%

.. image:: ../_images/cm002.png
    :scale: 50%

.. image:: ../_images/cm003.png
    :scale: 50%

xconfigをQt5で立ち上げるには
--------------------------------------

Linuxカーネルをビルドする前に色々と設定を行う事が多いですが、その時に使う設定ツールでxconfigを立ち上げる場合、Qtの開発ツールが必要になります。Ubuntu系ディストリビューションでQt4の開発ツールを使うのであれば、以下のようにコマンドを入力する事でQt4の開発ツールをインストールする事ができ、xconfigを立ち上げる事が出来ます。::

    $sudo apt-get install qt4-dev

    $make xconfig

では、Qt5の開発者ツールを使う場合にはどのようにすれば良いのでしょうか？以下のようにコマンドを入力すると、Qt5ベースのxconfigを立ち上げる事が可能です。::

    $sudo apt-get install qt5-default

    $make xconfig

Chromeアプリ「Rajiko」でradikoを聴こう！
-------------------------------------------------

Google ChromeやChromiumにChrome拡張「Rajiko」を入れて、radikoを聴けるようにしましょう(^^)

1.ブラウザにChrome拡張「Radiko」をインストールします。ページにアクセスして、「Chromeに追加」ボタンを押すだけです。

https://chrome.google.com/webstore/detail/rajiko/ejcfdikabeebbgbopoagpabbdokepnff/related

2.radiko.jpの公式ページにアクセスします。

http://radiko.jp/

3.Radikoで聴きたいエリアを選択し、確認ボタンを押す。

.. image:: ../_images/Screenshot20from202019-02-242015-12-17.png
    :scale: 50%

4.後は好きな番組を選んで視聴してください。

LinuxのLiveDVDのISOをUEFI搭載のパソコンで直接起動させるには
---------------------------------------------------------------------------------

https://www.rmprepusb.com/tutorials/136_uefi_ubuntu

BIOS時代にLinuxのLiveDVDのISOを直接起動させて使ったりしていました。これは、UNetbootinなどのLiveUSBを作成するツールを使わなくても、LiveDVDのISOを交換するだけで、システムドライブとは別にLinuxの環境が使えて便利でした。しかし、UEFIが主流になってきて、しばらくこの方法が分からなかったので放置していたのですが、久しぶりに調べてみたら、既にUEFI向けの直接起動用のツールが公開されていました。

https://www.rmprepusb.com/tutorials/136_uefi_ubuntu/UEFI_boot_from_ISO.zip?attredirects=0&d=1

1.USBメモリーに「/efi/boot」ディレクトリを作成します。

2.この中に、使いたいLinuxのLiveDVDのISOを「boot.iso」に名前を変更して入れます。

3.上記リンク先のファイル「UEFI_boot_from_ISO.zip」をダウンロード解凍し、中に入っている「bootX64.efi」「bootIA32.efi」も/efi/bootに入れます。

4.これで、UEFIの設定画面にアクセスして、Securebootの項目をオフにしておきます。

5.ASRockのマザーボードですと、メーカーロゴが出ている時にF11キーを押しっぱなしにすると、起動させるストレージを選べるようになるのですが、その画面から作成したLiveUSBを起動させれば、ISOを直接起動させる事が可能です。

日本語対応させるには、boot.iso内の/boot/grub/loopback.cfgに以下のように「debian-installer/language=ja keyboard-configuration/layoutcode?=jp keyboard-configuration/modelcode?=jp106」を追加して、リマスターをする必要があります。::

    menuentry "Try Ubuntu without installing" {
	set gfxpayload=keep
	linux	/casper/vmlinuz  file=/cdrom/preseed/ubuntu.seed boot=casper iso-scan/filename=${iso_path} -- debian-installer/language=ja keyboard-configuration/layoutcode?=jp keyboard-configuration/modelcode?=jp106
	initrd	/casper/initrd.lz
    }

PC版Chromium BrowserでInstagramに写真をアップロードする方法

--------------------------------------------------------------------------------
通常PC版のGoogle ChromeやChromium Browserでは、Instagramへの写真のアップロードが出来ませんが、ユーザーエージェントをモバイルOS＋モバイルブラウザに変更する事でアップロードが可能です。

https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg

PC版Chrome系ブラウザの場合、ユーザーエージェントの切り換えに便利なのが、User-Agent Switcher for ChromeというChrome拡張です。これを導入して、Instagramにログインし、iOSやAndroidのユーザーエージェントに切り換える事でモバイル版Instagramを表示する事ができ、Instagramへの写真のアップロードが可能になります。

対応しているOSは、Windows・macOS・Linux・Chrome OSなどです。

.. image:: ../_images/Screenshot20from202018-11-162012-59-27.png

「QT_QPA_PLATFORMTHEME environment variable is not set correctly」というエラーが出てqt5ctが使えない時の対処法
---------------------------------------------------------------------------------------------------------------------------------------------------

Qt5で開発されたアプリケーションのデザインを一括で変更するには、qt5ctを使う事になります。Ubuntu系ディストリビューションの場合は以下のコマンドでインストール出来ます。::

    $sudo apt-get install qt5ct


この設定ツールを起動させる時に、「QT_QPA_PLATFORMTHEME environment variable is not set correctly」というエラーが出る時があります。これは、適切に設定されていない事で出るものですので、以下のように修正してシステムを再起動させれば、直ります。::

    $sudo nano /etc/environment

以下の文を追加。::

    QT_QPA_PLATFORMTHEME=qt5ct

Bluemanを立ち上げた時に「Settings schema 'org.blueman.general' is not installed」のエラーが出た時の対処法
--------------------------------------------------------------------------------------------------------------------------------------

UbuntuなどでBluetoothを使う時に、設定マネージャーである「blueman」が立ち上がらずに以下のエラーが表示される事があります。::

    (blueman-manager:4017): GLib-GIO-ERROR **: 02:14:55.562: Settings schema 'org.blueman.general' is not installed

このメッセージが出たら、以下のコマンドで設定をしてあげれば、bluemanが立ち上がるようになります。::

    $ sudo glib-compile-schemas /usr/share/glib-2.0/schemas

Ubuntu系ディストリビューションでWi-Fiアダプタの型番を調べるには
-------------------------------------------------------------------------------

Ubuntu系ディストリビューションでWi-Fiアダプタの型番を知るには以下のコマンドを使います。::

    $ sudo lshw -class network

以下のように表示されました。::

    *-usb:2
       詳細: 無線インターフェース
       製品: WDC-150SU2M
       ベンダー: ELECOM
       物理ID: 8
       バス情報: usb@1:8
       論理名: wlxbc5c4c4dc201
       バージョン: 0.00
       シリアル: bc:5c:4c:4d:c2:01
       性能: usb-2.00 __________________ physical wireless
       設定: broadcast=yes driver=r8188eu ip=192.168.100.119 maxpower=500mA multicast=yes speed=480Mbit/s wireless=IEEE 802.11bgn
    *-network
       詳細: イーサネット interface
       製品: Ethernet Connection (2) I219-V
       ベンダー: Intel Corporation
       物理ID: 1f.6
       バス情報: pci@0000:00:1f.6
       論理名: enp0s31f6
       バージョン: 31
       シリアル: d0:50:99:85:27:da
       容量: 1Gbit/s
       幅: 32 bits
       クロック: 33MHz
       性能: pm msi bus_master cap_list __________________ physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
       設定: autonegotiation=on broadcast=yes driver=e1000e driverversion=3.2.6-k firmware=0.8-4 latency=0 link=no multicast=yes port=twisted pair
       リソース: irq:125 メモリー:dff00000-dff1ffff

/var/lib/apt/listsの直下が肥大化するUbuntuの公式リポジトリとは？
--------------------------------------------------------------------------------

Ubuntuベースでディストリビューションを作成する時には、出来るだけ容量を減らしたいところです。肥大化し易いところとしては、/var/lib/apt/listsがあります。この直下にあるファイルは、sudo apt updateで更新したAPTで管理しているリポジトリのパッケージリストが保管されるところです。つまり、ここの容量を抑えるにはリポジトリの数を減らすのが有効です。

公式リポジトリの中でも肥大化し易いのがUniverseというコンポーネントに所属するものであり、ここだけで何万パッケージというソフトウェアがあります。Linuxとしてだけで使うのであれば、mainとRestrictedのコンポーネントを有効にしておけば良いでしょう。WineなどはUniverseに登録されています。

https://ja.wikipedia.org/wiki/Ubuntu

◇/var/lib/apt/listsの肥大化を起こすコンポーネントのPPA::

    deb http://jp.archive.ubuntu.com/ubuntu/ bionic universe

/etc/apt/sources.listをこれらをコメントアウトして、sudo apt-get updateを行えば、/var/lib/apt/listsの容量を大幅に削減可能です。

Ubiquityの「-b」オプションでブートローダ「GRUB」のインストール無しでUbuntuをインストールする
-----------------------------------------------------------------------------------------------------------------

Ubuntuに採用されているインストーラー「Ubiquity」は、-bオプションを付けて起動させる事で、ブートローダ「GRUB」のインストールをせずに、OSのインストールを行う事が出来ます。

http://averagelinuxuser.com/install-linux-mint-without-a-bootloader/

$ ubiquity -b

UbiquityによるGRUBインストールは、ユーザーの環境によって失敗する事がありますので、別の方法でGRUBをインストールするようにした方が便利です。

「Error! Could not locate dkms.conf file.File:  does not exist.」が出た場合の対処法
----------------------------------------------------------------------------------------------------

Ubuntuのバージョンアップを行なった時に、新しいカーネルのインストールが出来ない事があります。その時にエラーメッセージを調べますと、以下のエラーが表示されます。::

    Error! Could not locate dkms.conf file.
        File:  does not exist.

/var/lib/dkms以下に古いファイルがあると、dkmsでモジュールのビルドが出来ない為に、このエラーが発生します。そこで、対処法としてはこの直下の古いファイルを削除すれば良いです。xxxというフォルダがあるとすると以下のコマンドでxxxを削除可能です。::

    $ rm -r /var/lib/dkms/xxx

SquashFSで作成したファイルの圧縮方式を確認するには
--------------------------------------------------------------------

SquashFSで作成したファイルの圧縮方式をするには、xxx.suqashfsというファイルで確認したい場合、以下のコマンドで確認出来ます。::

    $ unsquashfs -s xxx.squashfs | awk '/^Compression/{print $2}'

Ubuntuで絵文字がカラーで表示されるようにする
------------------------------------------------------------

1.カラー絵文字フォントをダウンロードする::

    $mkdir ~/.local/share/fonts ; cd ~/.local/share/fonts && wget https://github.com/emojione/emojione-assets/releases/download/3.1.2/emojione-android.ttf ; cd -

2.フォントの設定を変更する::

    $mkdir ~/.config/fontconfig ; cd ~/.config/fontconfig && wget https://ja.osdn.net/downloads/users/16/16059/fonts.conf ; cd - ; fc-cache -fv

各種プログラミング言語リファレンス
---------------------------------------------

プログラミング言語を使いこなすには、文法から理解し、どのような事が出来るのかを知る事が大切です。

公式サイトやユーザー有志によって作られたリファレンスは、基礎から応用まで様々な知識を身につけられるようになっています。

◇シェルスクリプト
http://shellscript.sunone.me/

◇Python

https://www.python.org/

◇PHP

http://php.net/

◇JavaScript

https://developer.mozilla.org/ja/docs/Web/JavaScript

◇Haskell

https://www.haskell.org/

◇Java

http://www.oracle.com/technetwork/jp/java/javase/documentation/api-jsp-316041-ja.html

◇C++

https://msdn.microsoft.com/ja-jp/library/3bstk3k5.aspx

◇Processing

https://processing.org/reference/

◇Ruby

https://docs.ruby-lang.org/ja/

◇Perl

https://www.perl.org/

◇Erlang

https://www.erlang.org/

◇Scala

https://www.scala-lang.org/

◇Swift

https://developer.apple.com/swift/

htsvoiceファイル変換プログラムをUbuntuでも使えるようにする方法
------------------------------------------------------------------------------------

Ubuntu+OpenJtalkでコンピューターに喋らせる事が出来るようになりますが、その音声合成には音声モデルが必要になります。

比較的新しいバージョンのOpenJtalkで使う音声モデルは、htsvoiceファイル一つがありますと使えるようになっています。

ここでは、htsvoiceファイル変換プログラムをUbuntu+OpenJtalk用に使えるようにし、htsvoiceファイルを生成します。

1.初音ミクの音声モデルをダウンロードします。

http://cube370.wiki.fc2.com/wiki/%E8%87%AA%E4%BD%9C%E9%9F%B3%E9%9F%BF%E3%83%A2%E3%83%87%E3%83%AB

2.htsvoice変換プログラムをダウンロードします。

http://neu101.seesaa.net/article/316259910.html

3.UbuntuにMonoをインストールします。::


    $sudo apt-get install mono-mcs

4.1と2の圧縮ファイルを解凍し、音声モデルからは「Voice」フォルダを取り出し、htsvoice変換プログラムに付属している「htsvconv.cs」を取り出して、これをMonoでコンパイルします。::

    $mcs htsvconv.cs

5.出来た「htsvconv.exe」でVoiceフォルダの中にある音声モデルのファイル群を一つのhtsvoiceファイルにします。::

    $mono htsvconv.exe ./Voice

Tumblrの記事データをWordPress経由でバックアップ
--------------------------------------------------------------------

Tumblrには、記事のインポート機能やエクスポート機能がありません。

そこで、WordPressのインポート機能。エクスポート機能を活用して、Tumblrの記事データをバックアップしていきます。

WordPressは、自分でサーバを用意してインストールしても構いませんし、WordPress.comを使っても構いませんので、取り敢えず、適当にブログを一つ作成します。

「WordPressの管理」（ダッシュボード）→「ツール」→インポートでTumblrと連携させてインポートを行います。

インポートが完了したら、エクスポートを選択すれば、記事データをXMLで出力する事が出来ます。

インポートした記事は、このインポート画面で「アカウント情報を消去」という項目を選択すれば、WordPressにインポートした記事を消す事ができ、再度Tumblrで作成したサイトを選択すれば、記事が被らずに再度インポートを行えます。

テキストエディタ「Atom」に気になるワードをWeb検索出来る機能を追加する
---------------------------------------------------------------------------------------------

Atomで様々な文章やソースコードを開いている時に、気になるワードがあれば、そのワードをWebで検索したいという事があるでしょう。

これをわざわざブラウザを起動しなくても、Web検索が出来るようにするのが「web-search」というプラグインです。

インストールするには、以下のコマンドをLinuxなどのターミナルで実行します。::

    $apm install web-search

文章ファイルなどの気になるワードを選択した状態で右クリックメニューを出し、「web-search」という項目をクリックすれば、GoogleやWikipediaで調べる事が可能になります。

.. image:: ../_images/Screenshot20from202017-03-282000-28-29.png

テキストエディタ「Atom」でターミナルを呼び出す
------------------------------------------------------------

テキストエディタ「Atom」でターミナルを使えるようになれば、Pythonスクリプトを実行したり、Sphinxでドキュメントをパブリッシュ出来たりする時に便利です。

ターミナルを使えるようにするにはプラグインを追加します。

「Terminal-plus」と「platformio-ide-terminal」がありますが、Terminal-plusはバージョンによってターミナルを呼び出せない不具合がありますので、platformio-ide-terminalの方が安定していて普段使っているLinuxのターミナルと同じデザインですので良いと思います。

Linuxなどのターミナルで以下のコマンドを入力すればインストール出来ます。

https://atom.io/packages/platformio-ide-terminal

::

    $apm install platformio-ide-terminal

.. image:: ../_images/Screenshot20from202017-03-282000-29-03.png

ファイルを保存する時に、AtomのRemote-FTPで自動的にサーバにアップロードさせないようにする
----------------------------------------------------------------------------------------------------------------------

GitHubが開発したテキストエディタ「Atom」。

非常に高機能で使いやすいエディタの一つですが、これのプラグインにRemote-FTPという物があります。このプラグインは、サーバと接続してローカル上のファイルをアップロードしたり、ダウンロードしたりというように、AtomにFTP機能を追加してくれます。

この機能を使う事で、別途FTPソフトを用意する必要が無くなり、効率的にサーバ上のWebページを更新する事が出来ます。

しかし、困った事にアップロードしたくないファイルを編集保存した時に自動的にサーバに繋いでアップロードしてしまいます。このような事が起こらないようにする為には設定を変更します。

上部メニューバーの「File」→「Preferences」→「Packages」→「Remote-FTP」→「Settings」にアクセスして、Auto Upload On Saveを「never」に変更すれば、ファイル保存時に自動的にファイルをサーバにアップロードしなくなります。

.. image:: ../_images/Screenshot20from202017-03-242015-24-36.png

標準版Google Maps APIでのAPIキー取得方法
-----------------------------------------------------------

https://cloud-ja.googleblog.com/2016/07/google-maps-api.html

::

    Google Maps API の標準プランを改定しました
    2016年7月8日金曜日
    [この記事は Ken Hoetmer, Product Manager, Google Maps APIs による Geo Developers Blog の記事 "Building for Scale: Updates to Google Maps APIs Standard Plan" を元に翻訳・加筆したものです。詳しくは元記事をご覧ください。]
    ある開発者が最初に Google マップ のリバース エンジニアリングを行ってから 11 年が経ちました。今や位置情報を活用したアプリやウェブサイトの数は 300 万を超え、そこから毎日数十億件のリクエストが生成されています。これらはすべて Google Maps APIs によって実現されています。Lyft のような勢いのあるベンチャー企業をはじめとして、意欲的なプロジェクトや、さらには公共サービスでの活用に至るまで、地図と位置データが持つ力には、開発者の創造力次第で無限の可能性があります。
    この 10 年でインターネットの世界はデスクトップ PC からモバイルデバイスへと大きく様変わりし、それを受けて Google のサービスも進化を遂げ、開発者とユーザーのニーズに対応してきました。デバイスの増加はすなわちリクエストの急激な増加であり、世界中の何億人ものユーザーがインターネットにアクセスしようとしているのが現状です。こうした背景を鑑みて、Google は Google Maps APIs の標準プランの使用制限と価格を一部改定し、よりシンプルで統一性のある内容にいたしました。
    2016 年 6 月 22 日（米国時間）、Google Maps APIs の標準プランについて、以下の点を変更いたしました。
    1.キーレス アクセス（API キーが含まれていないリクエスト）はサポート対象外となります。今後のプロダクト アップデートは、API キーを使ったリクエストのみが対象となります。API キーが分かれば、Google は必要に応じて開発者の方に連絡を取ることができるようになり、また、正常に動作していない実装も発見しやすくなります。
    2.Google Maps JavaScript API、Static Maps API、Street View Image API の新たな実装に対し、マップ ロードは 1 日あたり 25,000 件まで無料とします。また、これらの API に関しては、これまで存在していた連続 90 日間という猶予期間を 2016 年 10 月 12 日をもって廃止します。この変更により、開発者の皆様は将来的な増加計画を立てられるようになります。
    3.Google Maps JavaScript API、Static Maps API、Street View Image API について、購入できる 1 日あたりのマップ ロードの上限を 1,000,000 から 100,000 リクエスト（API あたり）に減らしました（注）。使用量が多い場合は、テクニカル サポートとサービス レベル契約が含まれるプレミアム プラン ライセンスをお選びください。また、この変更により、マップとウェブ サービス API の全体を通して、標準プランの割当量が統一されることになります。
    4.関連するウェブ サービス API の 1 日の使用制限に関して、Google Maps JavaScript API クライアント側リクエスト数が集計されるようになります（注）。
    以上の変更点は、2016 年 6 月 22 日以降に作成されたすべての Maps API 実装に対して即時適用されます。
    既存のアプリケーションについては、現在の使用量に基づいて適用除外とし、今後も引き続き機能できるようにいたします。また、使用量の増加パターンに基づいて、今後影響があると思われる既存の API キー ユーザーの皆様にはこちらから連絡をさせていただきます。すでに利用されている皆様は、こちらの標準プランのポリシー改定の概要（英語）をご一読いただき、今回の改定によってアプリケーションにどのような影響がおよぶのかをご確認ください。

このように、標準版のGoogle Maps APIを使うにはアクセスキーを取得する必要があります。

取得方法は、以下のリンクにアクセスしてウィザード通りに手続きを進めていくだけです。

https://developers.google.com/maps/documentation/javascript/get-api-key#key

「Get Key」ボタンを押して順序通りに手続きを進めていく事でAPIキーの取得が出来ます。

取得したAPIキーは以下のように設定します。::

    <script src="https://maps.googleapis.com/maps/api/js?key=XXXXXXXXXXXXX"></script>;

クエリとしてURLに追加してあげれば良いです。

Wineで音割れがするのを改善する方法
--------------------------------------------------

UbuntuなどのLinuxディストリビューションで使えるWindows APIレイヤー「Wine」は、WindowsのAPIを移植する事でWindowsソフトウェアを動かそうという革新的なプロジェクトです。フロントエンドのPlayOnLinuxを使えば、ソフトウェアの管理を行ったり、バージョンが違うWineを複数導入して管理したりする事が出来ます。

但し、Wineはかなり機能面で強化されてきたとは言っても、Windowsを再現するには、色々なAPIが再現されておらず、その為、Windowsソフトウェアを全て動作させる事が出来ません。

市販されているゲームソフトや同人ソフトは、動作する物と動作しない物があります。3Dゲームで遊ぶ場合には、ミドルレンジ以上のグラフィックボードが必要になります。

ゲームソフトが動作した場合、比較的快適に遊べますが、音が割れる事があります。これはPulse Audioによる影響であり、PulseAudioとJack Audio Connection Kitを連携させる事で解消する事が出来ます。::

    $sudo apt-get install jack qjackctl alsaplayer-jack pulseaudio-module-jack pavucontrol

PulseAudioが動いている状態で、qjackctlを起動させると、pulseaudio-module-jack経由でPulseAudioからD-Busを通してJackにサウンドデータを流す事が出来ます。Jack対応アプリケーションを動作させて、qjackctlやpavucontrolで接続を確認します。「PulseAudio JACK Sink」などが出ていたら、音が出るはずです。pavucontrolでミュートになっていないか確認しておくと良いでしょう。Wineは、winetricksでサウンドをALSAに変更します。これで、Wineの音割れは無くなります。

https://wiki.ubuntulinux.jp/UbuntuStudioTips/Application/JACK-PulseAudio

SMPlayer+MPV+youtube-dlで動画共有サイトの1080p60fps動画をGPUの動画支援機能で動作させる
--------------------------------------------------------------------------------------------------------------------------------

Ubuntu環境でSMPlayerを使っている人は多いと思います。この環境を活用して、MPVやyoutube-dlと連携させて、Youtubeなどの動画共有サイトで公開されている1080p60fpsの動画をGPUの動画支援機能で動作させる事が可能です。Webブラウザで視聴するよりも消費電力が低くなるのが利点です。

◇環境
CPU : Celeron G 3900（2.8GHzデュアルコア、Skylake）

Motherboard : ASROCK B150M-COMBO-G(Micro-ATX、DDR4/DDR3排他仕様)

Memory : CFD DDR3-1600 4GBx2

Case : Century CSI-1299GG(Black、ミニタワー)

Power Supply : Silverstone ST30SF

Strage : Sundisk SSD 240GB + Toshiba MQ01ABD050(2.5inch HDD 500GB)

Graphicboard : MSI RADEON RX 460 2GB GDDR5

OS : Valkyrie SRX 17.13（Ubuntu 16.04 LTSベースのオリジナルLinuxディストリビューション）

◇ソフトウェアとインストール方法

SMPlayer

MPV

youtube-dl

::

    $sudo apt-get install smplayer mpv youtube-dl

◇設定
・「全般」→「全般」→「MPlayer/mpvの実行ファイル」のパスを入力する

.. image:: ../_images/Screenshot20from202017-04-082015-43-25.png

・「全般」→「出力ドライバー」を「vdpau」にする。「直接描画」「ダブルバッファー」「スクリーンセーバーを無効にする」にチェックを入れる

.. image:: ../_images/Screenshot20from202017-04-082014-08-44.png

・「全般」→「オーディオ」をpulseかalsaを選択する。

.. image:: ../_images/Screenshot20from202017-04-082014-08-49.png

・「パフォーマンス」→「ハードウェアデコード」を「vdpau」に変更

.. image:: ../_images/Screenshot20from202017-04-082014-08-57.png

・「ネットワーク」→「Youtube（およびその他のサイト）」で「Youtubeの内部サポートを有効にする」のチェックを外す。「MPVのストリーミングサイトへの対応を有効にする」にチェックを入れる。

.. image:: ../_images/Screenshot20from202017-04-082014-09-28.png

SMPlayer 17.4以降は以下のように「mpv+youtube-dl」を選択するだけで良くなった。

.. image:: ../_images/Screenshot20from202017-04-092011-55-26.png

・「詳細設定」→「MPlayer/mpvのオプション」に「--ytdl-format=bestvideo+bestaudio」を追加。これでyoutubeの動画で1080p60fpsの物まで再生が可能になりますが、Dailymotionなどの動画も再生するのであれば、このオプションを付ける事で再生出来なくなってしまうので注意が必要です。

.. image:: ../_images/Screenshot20from202017-04-082014-09-13.png

その原因は、VP9でエンコードした動画を指定しているようですので、VP9でエンコードされた動画を指定しないように設定すれば、Youtube以外の動画サイトの動画も再生出来るようになります。以下の例では、1080p以上の動画を観ない設定も同時に行っています。

コマンドは、「--ytdl-format=bestvideo[height<=1080][vcodec!=VP9]+bestaudio/best」

.. image:: ../_images/Screenshot20from202017-04-082017-28-24-276aa.png

◇視聴

.. image:: ../_images/Screenshot20from202017-04-082013-52-14.png

.. image:: ../_images/Screenshot20from202017-04-082014-08-20.png

squashfs-toolsでzstdを使えるようにする
-----------------------------------------------------

環境は、Ubuntu 16.04 LTS、GCC 7.2とします。

1.  https://github.com/facebook/zstd  でZstandardのソースコードを取得します。

2.ダウンロードしたファイルを解凍し、zstd-devフォルダに移動します。::

    $cd zstd-dev

3.ビルドを行い、インストールします。::

    $sudo su

    #make && make install

5.  https://github.com/iburinoc/squashfs-tools/tree/master でZstd対応のsquashfs-toolsのソースコードをダウンロードします。

6.ダウンロードしたファイルを解凍して、squashfs-tools-master/squashfs-toolsへ移動します。::

    $cd squashfs-tools-master/squashfs-tools

7.Makefileを以下のように書き換えます。::

    ZSTD_SUPPORT = 1

    ZSTD_DIR = /usr/local/lib

8.ビルドしてインストールします。::

    $sudo su

    #make && make install

9.ホームディレクトリにある「.bashrc」で共有ライブラリにパスを通します。::

    export LD_LIBRARY_PATH="/usr/local/lib"

10.以下のコマンドでsquashfsファイルが生成出来れば、SquashFSでZstdが使えます。::

    $mksquashfs test.txt test.sfs -comp zstd

他の圧縮方式を追加したい場合は、7番で行ったMakefileで各圧縮方式に対応した部分のコメントアウトを外してビルド・インストールを行えば良いでしょう。

InstagramをPCのブラウザから使う
-------------------------------------------

PCからも投稿出来ます。

1.Google ChromeやChromiumであれば、まず、`https://www.instagram.com <https://www.instagram.com>`_ にアクセスして、Ctrl+Shift+Iでデベロッパーツールを起動させます。

2.デベロッパーツールの左上部にあるアイコンの2つ目をクリックすると、モバイル端末向けのデザインに変化します。この状態で、ページを再読み込みすれば、上部にカメラアイコンが出てきますので、これをクリックすれば、パソコンに保存している写真をアップロード出来ます。

.. image:: ../_images/chromium20171007a.jpg

3.但し、この方法は、Twitter連携機能に対応していないので注意が必要です。

4.PC向けのブラウザからアップロードするには、ユーザーエージェントをモバイル端末向けに変更すれば良いという事になりますので、ユーザーエージェントスイッチが出来るアドオンを導入すれば便利になるでしょう。

GCC7のデフォルト化
---------------------------

GCC7をインストールして、update-alternativesでシンボリックリンクを張ります。::

    sudo apt-get update && \
    sudo apt-get install build-essential software-properties-common -y && \
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    sudo apt-get update && \
    sudo apt-get install gcc-snapshot -y && \
    sudo apt-get update && \
    sudo apt-get install gcc-7 g++-7 -y && \
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7

デフォルトのGCCを変更したい場合は以下のコマンドを入力します。::

    sudo update-alternatives --config gcc

DockerでPython環境を構築する
-------------------------------------------

Ubuntu系ディストリビューションにDockerを入れる場合は、Ubuntuに最適化されている物で良いでしょう。::

    sudo apt-get install docker.io

以下は本家版です。::

  `Docker <https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#uninstall-old-versions>`_

Dockerコンテナを起動させる時には、rootになる必要があるので、sudoが面倒くさい時にはユーザー登録::

    sudo adduser ユーザ名 docker

再ログインします。

Dockerコンテナを起動させる時には、rootになる必要があるので、sudoが面倒くさい時にはユーザー登録::

    sudo adduser ユーザ名 docker

再ログイン
groupsコマンドで確認::

    groups

hello worldプログラムで動作確認します。::

    docker run hello-world

Ubuntu 16.04 LTSベースのコンテナは、これで作成が出来ます。::

    sudo docker run -i -t ubuntu:16.04 /bin/bash

◇動作しているDockerコンテナ確認::

    docker ps

◇停止しているDockerコンテナ確認::

    docker ps -a

◇特定のイメージのコンテナを削除::

    docker rm コンテナID

◇既に作成したDockerコンテナを起動させる
IMAGEがubuntu:16.04となっている場合には、以下のコマンドを実行すれば、Docker Engineにマウント出来ます。::

    docker run -t -i ubuntu:16.04

コンテナをマウントする事が出来れば、Ubuntu上で端末を使った操作が行えるようになります。

◇Python環境を構築します。::

    #apt-get install python3.5
    #apt-get install -y python python3 python-pip python3-pip xfce4-terminal libglade2-0
    #apt-get install -y mecab mecab-utils mecab-naist-jdic  mecab-naist-jdic-eucjp mecab-jumandic python-mecab ffmpeg
    #apt-get install -y python-tk python3-tk python-dev libxml2-dev libxslt-dev python3-dev
    #pip2 install --no-cache-dir scipy numpy pandas seaborn scikit-learn statsmodels beautifulsoup4 matplotlib
    #pip3 install --no-cache-dir scipy numpy pandas seaborn scikit-learn statsmodels beautifulsoup4 matplotlib
    #apt-get install python-pip python-dev python-virtualenv
    #apt-get install python3-pip python3-dev python-virtualenv
    #pip install --upgrade tensorflow
    #pip3 install --upgrade tensorflow
    #pip install --upgrade tensorflow-gpu
    #pip3 install --upgrade tensorflow-gpu

◇コンテナ終了::

    exit

Twitter向けのテクニック
------------------------------
◇Twitterバックアップ方法

1.右上のプロフィール画像のアイコンをクリック

2.「設定とプライバシー」→ユーザー情報→「全ツィート履歴をリクエストする」をクリック

3.しばらくすると、登録メルアドにメールが届いているので、そのメールのダウンロードボタンを押すとZIPでダウンロードします。

◇Twitterのプロフィール画像・ヘッダ画像の最適化なサイズ

プロフィール画像とヘッダ画像を変更する事で、ユーザーの個性を引き出す事が出来ます。Twitter社が推奨するサイズは以下の通りです。::

   プロフィール画像（アイコン）　ー　400ピクセル×400ピクセル（最大10MB）

   ヘッダ画像　ー　1500ピクセル×500ピクセル（最大10MB）

◇特定のユーザーのツイートを検索する

「@ユーザー名　検索したいワード」

ハッシュタグの場合は以下のようにします。

「@ユーザー名　#検索したいワード」

【このリクエストはコンピュータによる自動的なものと判断されました。Twitterユーザーをスパムやその他の迷惑行為から保護するために、このリクエストを保留しています。しばらくしてからもう一度お試しください。】の対処法
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

【このリクエストはコンピュータによる自動的なものと判断されました。Twitterユーザーをスパムやその他の迷惑行為から保護するために、このリクエストを保留しています。しばらくしてからもう一度お試しください。】というTwitterの中途半端なスパム対策のせいでこういうメッセージが出る人が続出しています。

対処法は簡単であり、登録メールに該当メールが来ているはずなので、そのメールの指示通りにパスワードを変更するだけで復旧します。

MySQLで知っておくべき事
-----------------------------------

◎root権限でmysqlを起動::

    $sudo su
    $mysql -u root -p

◎パスワード変更::

    shell> mysqladmin -u user_name -h host_name password “newpwd”


◎一般ユーザー作成::

    GRANT ALL PRIVILEGES ON *.* TO user@localhost IDENTIFIED BY 'password' WITH GRANT OPTION;
    FLUSH PRIVILEGES;

◎ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)::

    ERROR 1045 (28000): Access denied for user ‘root’@'localhost’ (using password: NO)

上記のエラーが出た時の対処法はmysqlコマンドを使う時に「-p」を付けると設定したパスワードを要求するようになります。::

    $mysql -u root -p

ALSAの音量設定の保存方法
------------------------------------

LinuxでのサウンドドライバはALSAですが、システム起動音などを調整して、その音量を永続的に保ちたい場合があります。alsactlというツールを使う事で音量設定の保存が可能です。

1.alsamixerで音量を調整::

    $alsamixer

2.alsactlで音量設定を保存::

    $sudo alsactl store

GitでZen Kernel Sourceを取得
----------------------------------------

◇Zen Kernel Source取得::

    $git clone https://github.com/zen-kernel/zen-kernel.git
    $cd zen-kernel
    $git checkout origin/4.10/master

◇最新のリモートのブランチの情報をローカルに反映::

    $git fetch

◇ブランチ確認::

    $git branch -a

◇ブランチ切り替え::

    $git checkout -b origin/4.11/upstream-updates

LiveCD用のカーネルを作るためにaufsのパッチを当てる
---------------------------------------------------------------------

UbuntuなどのLinuxディストリビューションは、アプリケーションやスクリプトを使ってLiveCDを作成する事が可能です。しかし、カーネルをビルドする際に、UbuntuのようにLiveCDの造りがcasperを活用している場合、aufsに対応したカーネルで無ければ、起動出来ず、Busyboxに落ちてしまいます。

そこで、新しい機能を持ったLinuxカーネルをソースコードからビルドしてLiveCD上で起動出来るように、aufsパッチを当てます。

aufsは以下のサイトで公開されています。サイトにアクセスすれば分かりますが、カーネルバージョンナンバーとaufsのバージョンが同じ物になっています。このバージョン番号を合わせないと、パッチを当てる時にエラーが出て、ビルド時にもエラーが発生してビルドを完了する事が出来ません。

aufsのソースコードの入手方法は、Gitを使うようになっています。

http://aufs.sourceforge.net/

Linuxカーネル4.10であれば、aufs4.10を入手します。

Linuxカーネルのソースのディレクトリとaufsのディレクトリを同じ場所にしておきます。新規にフォルダを作っても良いですが、別にユーザーディレクトリ上に置いても構いません。ここでは、Linuxのソースコードが入ったフォルダを「linux」としておきます。::

    $git clone git://github.com/sfjro/aufs4-standalone.git
    $git checkout origin/aufs4.10

Linuxカーネルのソースコードにパッチを当てます。::

    patch -p1 < ./aufs4-standalone/aufs4-kbuild.patch
    patch -p1 < ./aufs4-standalone/aufs4-base.patch
    patch -p1 < ./aufs4-standalone/aufs4-mmap.patch
    patch -p1 < ./aufs4-standalone/aufs4-standalone.patch

カーネルバージョンとaufsのバージョンが合っていれば、パッチ当てが成功するはずです。失敗したら、バージョンを確認して再度行います。

aufsのフォルダからいくつかのファイルをlinuxフォルダにコピーします。::

    $cp -rp aufs4-standalone/fs/ linux/
    $cp -rp aufs4-standalone/Documentation/ linux/
    $cp -rp aufs4-standalone/include/uapi/linux/aufs_type.h linux/

linuxフォルダに移動して、.configファイルを作成します。::

    $make oldconfig
    $make xconfig

後は、Makefileのバージョン名などを変更したいのであれば、変更してビルドします。::

    $sudo make-kpkg -j3 --initrd linux_image linux_headers

一時的にLinuxカーネルのI/Oスケジューラーを変更する方法
----------------------------------------------------------------------------

Linuxカーネルには、様々なI/Oスケジューラーが用意されています。カーネルをソースコードからビルドする時に、I/Oスケジューラーを設定しておくのが一般的ですが、現在利用しているカーネルで一時的にI/Oスケジューラーの変更をしたい時には、以下のコマンドを使うと良いでしょう。::

    sudo -- sh -c 'echo cfq > /sys/block/sda/queue/scheduler'

「cfq」の部分を「deadline」「noop」「bfq」という風に変更するだけです。

確認のコマンドは以下の通りです。::

    cat /sys/block/sda/queue/scheduler

一方で、永続的に設定変更をしたいのであれば、Grubの設定を変更します。Ubuntu系Linuxディストリビューションでは、/etc/default/gurbの「GRUB_CMDLINE_LINUX_DEFAULT=""」に以下のコマンドを追加します。::

    elevator=deadline

deadlineの部分をcfqやbfq、deadlineに変更すれば、アルゴリズムを好きなように変更する事が出来ます。

他のコマンドも記述する場合は、半角スペースで区切っていきます。

CPUスケジューラとI/Oスケジューラの組み合せを探って性能アップを目指す
-------------------------------------------------------------------------------------------

Linuxカーネルをビルドするのに、Zen KernelにAufsのパッチを当てたソースを使っています。以前、UbuntuカーネルのソースコードにMuQSSパッチを当ててビルドをしたら、Wineが動かなかったという事を書きましたが、Zen Kernelと<a href="https://liquorix.net/" target="_blank">LIQUORIX KERNEL</a>のコンフィグファイルを使えば、ビルドが出来てWineが動作しました。

ビルドの際には、.configファイルを作成する事になりますが、この時に該当するパッチを当てていたら、CPUスケジューラにMuQSS、I/OスケジューラにBFQが追加されて選択する事が出来ます。この組み合せだけでも、PCのパフォーマンスが大きく変わってくるようです。

・CFS+CFS　デフォルトのUbuntuと同じ

・CFS+BFQ　低レイテンシカーネル環境で効果あり。WineやPCSX2などで動作する3Dゲームのパフォーマンスが大きく向上。

・MuQSS+BFQ　Manjaroなどで採用されているらしい。僕の環境では3DゲームでCPU使用率が高くなり、カクつきなどが発生した。しかし、普通の用途ではかなり動作が軽くなったので、一般的な用途やプログラミング用途などで有効でしょう。

この他にも、MuQSS+CFQ/Deadline/noopといった組み合せが考えられますが、これから試していくつもりです。

ただ、現在のところ、CFS+BFQが一番レスポンスの良さを感じますが、3Dゲームにおけるフレームレートが安定しないのがデメリットです。

Zen Intaractive Tuneの説明は以下のように書かれています。::

    Tune kernel for interactivity (ZEN_INTERACTIVE)

    type: boolean
    unknown property: symbol
    prompt: Tune kernel for interactivity
    default: y

    defined at init/Kconfig:50

    CONFIG_ZEN_INTERACTIVE:

    Tunes the kernel for responsiveness at the cost of throughput and power usage.

    --- Virtual Memory Subsystem ---------------------------

    Mem dirty before bg writeback..: 10 % -> 20 %

    Mem dirty before sync writeback: 20 % -> 50 %

    --- Block Layer ----------------------------------------

    Block Layer Queue Depth........: 128 -> 512

    --- CPU Scheduler (CFS) --------------------------------

    Scheduling latency.............: 6 -> 3 ms
    Minimal granularity............: 0.75 -> 0.3 ms
    Wakeup granularity.............: 1 -> 0.5 ms
    CPU migration cost.............: 0.5 -> 0.25 ms
    Bandwidth slice size...........: 5 -> 3 ms
    Ondemand fine upscaling limit..: 95 % -> 85 %
    Ondemand min upscaling limit...: 1 % -> 6 %
    Ondemand downscaling factor....: 1 -> 10

    --- CPU Scheduler (MuQSS) ------------------------------

    Scheduling interval............: 6 -> 3 ms
    ISO task max realtime use......: 70 % -> 25 %
    Ondemand coarse upscaling limit: 80 % -> 45 %
    Ondemand fine upscaling limit..: 95 % -> 45 %
    Ondemand min upscaling limit...: 1 % -> 6 %
    Ondemand downscaling factor....: 1 -> 10

    Symbol: ZEN_INTERACTIVE [=y]
    Type : boolean
    Prompt: Tune kernel for interactivity
    Location:
    -> General setup
    Defined at init/Kconfig:50

MuQSSで良い結果が得られないのであれば、CFS+Zen Intaractive Tuneで低レイテンシカーネルをより低レイテンシにする事が出来ます。これに、I/OスケジューラにBFQを選べば、リアルタイムカーネルの代わりに使えそうです。

古い記事ですが、BFSのベンチマーク記事がありました。CFSとほぼ同じですが、ApacheなどではBFSの優位性があるようです。

http://www.phoronix.com/scan.php?page=article&item=bfs_scheduler_benchmarks&num=1

MuQSSを導入したLinuxカーネルをゲーミング用途で動作させる方法
-------------------------------------------------------------------------------------

MuQSSというCPUスケジューラを使いますと、システムのレスポンスが非常に良くなりますが、その反面、3Dゲームではパフォーマンスが落ちてしまいます。最近のMuQSSのパッチには、yeild_typeを変更する事が可能な機能が追加されており、デフォルトでは1に設定されています。これを0か2にするとMuQSSを導入したカーネルでもゲーミング用途で使えるようになります。

http://ck-hack.blogspot.jp/2016/12/linux-49-ck1-muqss-version-0150.html

::

    Maybe someone wants to see the non-official TOI code for 4.9.0:
    http://workupload.com/file/sVqjhDZ
    * checksumming does not work, don't configure it
    * with 4.9.0 + MuQSS/ck use "echo 2 &gt; /proc/sys/kernel/yield_type"
    * possible other bugs I haven't encountered, use at your own risk

    I did some benchmarks and it seems that yield=1 has slower overall performance, at least in gaming, on average. Yield 2 and Yield 0 performed about the same:
    http://openbenchmarking.org/result/1701176-TA-CKYIELD0V56

    Sadly, in the test I have above, only 1 test (OpenArena) has per frame analysis. According to that test though, yield 0 had the smallest lag spikes, with a max of 17ms per frame vs. 27ms and 28ms for yield 2 and yield 1 respectively.

コマンドは以下のようになります。::

    $sudo su
    #echo 2 &gt; /proc/sys/kernel/yield_type

永続化する場合には、/etc/sysctl.confに以下の文を追加しておきます。::

    kernel.yield_type = 2

    https://www.reddit.com/r/archlinux/comments/66xegc/testinggnome_3241_animations_are_lagging_with/

::

    MuQSS has three kernel variables that influence its behavior. This here should list them and their current values:

    sysctl -a |& grep -E 'interactive|rr_interval|yield_type'

    Try to see what happens if you change 'yield_type' to "2" like this:

    sudo sysctl kernel.yield_type=2

    From what I understood about MuQSS, this yield_type setting is the only one that changes behavior of the kernel in a way that programs might not expect. With the "0" and "1" values, MuQSS changes the meaning of a C function "sched_yield()" and it's not doing what's described in the Linux documentation (you can check it out with man 2 sched_yield). Using "yield_type=2" makes it behave more like the normal kernel.


もう一つカーネルチューニングする方法としてMuQSSのInteractive modeをオフにする方法があります。::

    echo 0 &gt; /proc/sys/kernel/interactive

これでInteractive modeをオフにする事が出来ます。

https://github.com/fusion809/linux-ck/blob/master/4.8-sched-MuQSS_112.patch

::

    Interactive mode is enabled by default but can be disabled for improved
    throughput at the expense of deterministic low latency.

    echo 0 > /proc/sys/kernel/interactive

    Features SCHED_IDLEPRIO and SCHED_ISO scheduling policies as well.
    You do NOT need to use these policies for good performance, they are purely
    optional for even better performance in extreme conditions.

他にも色々とシステムのレスポンス向上やパフォーマンスアップが期待出来る項目変更の方法があります。

http://ck-hack.blogspot.jp/2017/02/linux-410-ck1-muqss-version-0152-for.html#comment-form

::

    Actually, I'm running rr_interval 1, interactive 1 and yield_type 2 and whereas one might expect that to hurt throughput, from some testing (both synthetic as well as real world) I've actually found that throughput seems to be BETTER than with, for example, rr_interval 6, interactive 0 and yield_type 1 (or 0).

    I suspect this has to do with more and more applications as well as OS subsystems becoming increasingly multithreaded and the overhead of the context switching (yield type 2 and rr_interval 1) being less than the overhead of threads simply waiting for other threads to complete their tasks.

    Something along those lines anyhow.

    Just to give you an idea -- running a demoscene demo (synthetic metric, obviously) in WINE sees a 12% difference for me between running the highly cooperative mode (yield 2, interval 1, interactive 1) and the highly selfish mode (yield 0, interval 6+, interactive 0). In favour of the cooperative approach.

http://ck-hack.blogspot.jp/2016/10/linux-48-ck5-muqss-version-0120.html

::

    zcat /proc/config.gz | grep -i NO_HZ
    CONFIG_NO_HZ_COMMON=y
    # CONFIG_NO_HZ_IDLE is not set
    CONFIG_NO_HZ_FULL=y
    CONFIG_NO_HZ_FULL_ALL=y
    # CONFIG_NO_HZ_FULL_SYSIDLE is not set
    CONFIG_NO_HZ=y
    # CONFIG_RCU_FAST_NO_HZ is not set

    with

    CONFIG_HZ_100=y
    # CONFIG_HZ_250 is not set
    # CONFIG_HZ_300 is not set
    # CONFIG_HZ_1000 is not set

使用用途で適切なTimer Frequencyはどの値にしたらいいのだろうか
------------------------------------------------------------------------------------

Linuxカーネルを構築するのに迷う項目の一つがTimer Frequency。これは用途によって適切な値があるようです。

xconfigで.configを見ますと、該当箇所の説明には以下の事が書かれています。::

    100 Hz is a typical choice for servers, SMP and NUMA systems
    with lots of processors that may show reduced performance if
    too many timer interrupts are occurring.

    250 Hz is a good compromise choice allowing server performance
    while also showing good interactive responsiveness even
    on SMP and NUMA systems. If you are going to be using NTSC video
    or multimedia, selected 300Hz instead.

    300 Hz is a good compromise choice allowing server performance
    while also showing good interactive responsiveness even
    on SMP and NUMA systems and exactly dividing by both PAL and
    NTSC frame rates for video and multimedia work.

    1000 Hz is the preferred choice for desktop systems and other
     systems requiring fast interactive responses to events.

多くの場合、この説明通りに低レイテンシカーネルでのTimer Frequencyの設定は1000Hzとしている例が一般的です。

しかし、リアルタイムカーネルやMuQSSのようにリアルタイム性能を重視する場合には、カーネルオーバーヘッドを起こしてスループットが低下するようです。

https://github.com/raspberrypi/linux/issues/1216

::

    Yes, the Low Latency Preemption is enabled while the rest of the Kernel is not so realtime.
    Check the difference between PREEMPT_VOLUNTARY and PREEMPT.
    For example Ubuntu always uses PREEMPT_VOLUNTARY for Desktops and Servers.
    Only the Low-Latency Kernel uses PREEMPT combined with 1000hz and a few other tweaks.
    Full Preemption causes Kernel overhead and reduces throughput.

https://forums.gentoo.org/viewtopic-t-789725-start-0.html

::

    1000hz is for single CPU, you should use 250 for dual core. I have seen some patches in ZEN? that have a better timer for dual core.

    The hz rating is per core, so if you set 1000hz you are actually running 2000hz, IIRC that is.

カーネルオーバーヘッドを削減するには、プロセッサのコア数に応じて変更する必要があります。

・低レイテンシカーネルを使っていて、シングルプロセッサやシングルスレッドで音楽視聴や音楽制作でシステムを構築する場合

1000Hzを選択

・リアルタイムカーネル、あるいはMuQSSのようにリアルタイムカーネル的な動作をするCPUスケジューラを使い、サーバやNUMAシステム、マルチコアを使ったデスクトップ用途でシステムを構築する場合

100Hzから300Hzを選択。デュアルコアやクアッドコアであれば、100Hzか250Hzで良いでしょう。

デスクトップ用途でも、マルチコアマシンでレスポンスを重視するのであれば、サーバに近い設定の方が良いのかもしれません。

MuQSSの開発者のCon Kolivasは、MuQSSの最適なTimer Frequencyは100Hzとしています。

http://ck-hack.blogspot.jp/2016/10/linux-48-ck5-muqss-version-0120.html

::

    - MuQSS is now a tickless scheduler. That means it can maintain its guaranteed low latency even in a build configured with a low Hz tick rate. To that end, it is now defaulting to 100Hz, and it is recommended to use this as the default choice for it leads to more throughput and power savings as well.

Ubuntu向けのカーネルを構築する時にccacheを使う
------------------------------------------------------------------

Ubuntu向けのカーネルを構築する時に、少しでもビルド時間を短くするには、ccacheを使うのも効果的です。::

    $sudo apt-get install ccache

    $sudo MAKEFLAGS="HOSTCC=/usr/lib/ccache/gcc HOSTCXX=/usr/lib/ccache/g++ CC=/usr/lib/ccache/gcc" make-kpkg -j3 --initrd linux_image linux_headers

「MAKEFLAGS="HOSTCC=/usr/lib/ccache/gcc HOSTCXX=/usr/lib/ccache/g++ CC=/usr/lib/ccache/gcc"」を追加する事で、ccacheを使ったビルドを行います。

あるいは、以下の文を.bashrcに追加しておけば、上記の文は必要ありません。::

    export USE_CCACHE=1
    export CCACHE_DIR=/root/.ccache
    export CC='ccache gcc'
    export CXX='ccache g++'

ccacheの効果があるのは、2回目以降のビルドの時です。1回目は、ビルドと平行してキャッシュを実施しますので、ccache無しとビルド時間は変わりません。

海外のクールなカスタムLinuxカーネル
-----------------------------------------------

Linux本家で公開されているLinuxのソースコードをベースに、独自の機能を追加して公開されているカーネルが世界中に存在します。その中でも、デスクトップ/サーバ向けのカスタムカーネルで注目されているのが、CK1 Kernel、Zen Kernel、Liquorix kernel、XanMod kernel、pf kernelです。

おすすめは、Zen kernelとCK1 kernelです。何れかを使えば、通常使用では十分なレスポンス性とパフォーマンス性を得られるはずです。

◇CK1 kernel

http://ck-hack.blogspot.jp/

CPUスケジューラ「MuQSS」「BFS」の開発者であるCon Kolivasが、MuQSSやPaolo Valenteが開発したI/Oスケジューラ `「BFQ」 <http://algo.ing.unimo.it/people/paolo/disk_sched/>_` などを含めた「CK1パッチ」と呼ばれる高レスポンスパッチを公開しています。バニラカーネルに、このCK1パッチを適用したのがCK1 kernelです。リアルタイムカーネル並のリアルタイム性を実現した画期的なパッチと言えます。

◇Zen kernel

https://github.com/zen-kernel/zen-kernel

MuQSSやBFQの他に、grayskyが開発したKernel GCC patchなどカーネルハッカーの技術が結集したカスタムカーネルです。このカーネルの一番の特徴は、Zen Interactive Tuningという最適化手法を用いている事であり、Zenパッチと呼ばれています。パッチ単体で公開されていませんが、パッチが当たった状態でカーネルソースが公開されています。MuQSSやBFQ、RTパッチを導入したカーネルのパフォーマンスやレスポンス性を高めてくれます。

◇Liquorix kernel

https://liquorix.net/

Zen kernelのソースをベースに、Debian向けのデスクトップ最適化コンフィグファイルを適用してビルドした物がLiquorix kernelです。Zen kernelを更にチューニングしており、デスクトップ用途やゲーミング用途に最適化されているのが特徴です。このパッチセットのメンテナである<a href="https://github.com/damentz" target="_blank">damentz</a>は、Zenパッチセットの開発者です。Zen kernelでは、パッチを単独で公開していないようですが、LiquorixではZenパッチを含めたLiquorixパッチセットが単独で公開されているという不思議な状況になっています。

◇XanMod kernel

https://xanmod.org/" target="_blank">https://xanmod.org/

MuQSSやBFQなどを導入している点では、Zen kernelやLiquorix kernelと同じですが、独自のチューニングが施されており、常に最新のGCCを使ってコンパイルされているのが特徴です。

◇pf kernel

https://pf.natalenko.name/

このカーネルも、ZenやLiquorixやXanModと同様に、MuQSSやBFQなどが採用されています。かつては、UKMSやTuxOnIceなどのパッチが導入されていましたが、現在ではZenやLiquorixやXanModに近い仕様になっています。

他にも色々なカーネルが公開されています。Arch LinuxのWikiにカスタムカーネルが紹介されています。

https://wiki.archlinuxjp.org/index.php/%E3%82%AB%E3%83%BC%E3%83%8D%E3%83%AB

Ubuntuにインテルのコンパイラをインストールする
---------------------------------------------------------------

Ubuntuで使えるCコンパイラとしてはGCCやLLVMがありますが、非商用目的でインテルのCコンパイラを使う事も出来ます。

1.ユーザー登録を行う。

https://registrationcenter.intel.com/en/forms/?licensetype=2&programID=opensource&productid=2302

2.登録したメールアドレスに2営業日以内に返信が来るので、インストーラーのダウンロードをします。20数MBのオンラインインストールファイルを使えば、オンラインで必要な物だけをインストールする事が出来ますので、おすすめです。

3.ダウンロードしたファイルを解凍して、インストーラーを立ち上げる。::

    ./install_GUI.sh

指示通りにインストールを進めていきます。途中で、ダウンロードするファイルをカスタマイズする事が出来ますので、必要な分のファイルをダウンロード出来るように選択をしておくと良いでしょう。

4.インストールが完了したら、iccのパスを通して完了です。::

    $source /opt/intel/bin/compilervars.sh intel64

5.iccのパスが通っているか確認します。::

    $icc -v

Audaciousで動画ファイルの音声部分だけを再生させる
----------------------------------------------------------------------

UbuntuなどのLinuxディストリビューションで動画ファイルを再生させる場合、SMPlayerやVLCなどの動画プレーヤーで再生させます。一方で、音楽を再生させたい場合には、Audaciousなどの音楽再生プレーヤーを使います。

しかし、動画ファイルは持っていても、音楽ファイルを持っていなくて動画ファイルから音声データを分離させるのが手間と感じているのであれば、動画ファイルから音声データを分離せずに、そのまま動画ファイルをAudaciousで再生させる事で可能です。つまり、MVをAudaciousで再生させれば、音楽を聴けます。ただし、動画ファイルによっては、MP3ファイルやAACファイルよりも容量が大きくなってしまうのがデメリットです。

UbuntuでのAudaciousのインストールは、Synapticパッケージマネージャーを使うか、端末で以下のコマンドを実行します。::

    $sudo apt-get install audacious

ブラウザをアプリモードで使う
------------------------------------

Google ChromeやChromium、FirefoxなどのWebブラウザを使用している人々は多いです。

V8 JavaScript Engineなどメーカーが独自に開発したり、オープンソースコミュニティで開発された物をフィードバックさせて使ったりして、JavaScriptなどで構築されたWebアプリケーションの動作が従来よりも快適になっています。

Googleのオンラインツール群など大手企業から個人まで様々な組織が、オンラインサービスやオンラインツールを公開しています。

このWebアプリケーションは、基本的にブラウザでそのアプリケーションがあるサイトへアクセスする必要があります。

ユーザーは、アドレスバーにアドレスを打ち込んだり、検索をしたり、ブックマークに登録したりしてアクセスしやすいように工夫しています。

Webアプリケーションをデスクトップアプリケーションのように使えるようになれば便利ではないでしょうか。

PeppermintというLinuxディストリビューションは、ブラウザなど必要最低限のデスクトップアプリケーションしか収録されていません。

その代わりにSSB(Site Specific Browser)と呼ばれる仕組みでWebアプリケーションをデスクトップアプリケーションのように扱えるようにしています。

SSBの仕組みは、単純にメニューバーやアドレスバーなどを非表示にして、ブラウザを起動させて特定のURLのページを表示させているだけです。

Chrome系のブラウザには、このSSBを実現する為の仕組みが用意されています。

それが、ブラウザの「アプリモード」と呼ばれるものです。

◇Chrome系ブラウザの場合::

    chromium-browser --disk-cache-dir="/tmp" --app="https://www.google.co.jp/chrome/browser/desktop/"

「--app」オプションを追加する事でアプリモードで起動出来ます。

--appオプションに入力するのは、開きたいページのURLです。

デスクトップのショートカットなどを作成する時に、--appオプションを追加してブラウザを起動させられるようにしておきます。

◇Firefoxの場合
新規に専用のプロファイルを作成しておきます。::

    $firefox -p

Firefoxを起動出来たら、メニューバーやツールバーなどを全て非表示にします。

後は、以下のコマンドで起動させます。

デスクトップのショートカットにコマンドを書いておけば、端末でコマンドを入力する手間を省けます。::

    $firefox -p　作成したプロファイル -new-instance 開きたいページのアドレス

「E: パッケージ xxx を再インストールする必要がありますが、そのためのアーカイブを見つけることができませんでした。」のメッセージが出た場合の対処法
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

::

$sudo dpkg -P --force-remove-reinstreq xxx

xfceのターミナルからEmacsを起動させるコマンド
------------------------------------------------------------

::

$xfce4-terminal --hide-menubar -e emacs --title=emacs

UbuntuでGoogle DriveとOneDriveの同期を行う
---------------------------------------------------------------

予め、Google DriveとOneDriveのアカウントを取得しておいてください。

◇Google Driveの同期方法

・以下のコマンドでgriveをインストールします。::

    $sudo apt-get -y install grive

指示通りに設定を行って下さい。

・設定終了後、同期したいフォルダ直下で以下のコマンドを実行します。::

    $grive -a

これで同期を開始します。

再度同期を行いたい時には、以下のコマンドを実行します。::

    $grive

◇OneDriveの同期方法

・Gitをインストールします::

    $sudo apt-get -y install git

・onedrive-dをインストールしたい場所で以下のコマンドを実行します。::

    $git clone https://github.com/xybu92/onedrive-d.git

・onedrive-dフォルダが出来ているので移動し、install.shを実行します。::

    $cd onedrive-d

    $./install.sh

後は、指示通りに設定を行っていきます。

設定が終われば、以下のコマンドで同期を開始します。::

    $onedrive-d start

その他の作業は以下のコマンドを実行します。

終了::

    $onedrive-d stop

再起動::

    $onedrive-d restart

Ubuntuでdアニメストアを観る方法
---------------------------------------------

◇Google Chromeで視聴する場合
dアニメストアをUbuntuで視聴するには、Google Chromeをインストールします。

dアニメストアでは、2016年4月頃からChromeとEdgeに対応するようになっており、HTML5プレーヤーを通して見る事が可能になりました。

https://www.google.co.jp/chrome/browser/desktop/

◇Chromium Browserで視聴する場合

＜注意＞Google ChromeとChromiumのバージョンが合っていないと使えません。

Google Chromeをインストールした方が楽でしょう。

dアニメストアをChromium Browserで視聴するには、Google ChromeからWidevineを移植する事で可能です。

1.Chromiumをインストール::
    $sudo apt-get install chromium-browser

2.以下のコマンドを入力::

    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    $ mkdir chrome-dir
    $ dpkg-deb -x google-chrome-stable_current_amd64.deb chrome-dir
    $ sudo cp -a chrome-dir/opt/google/chrome/WidevineCdm /usr/lib/chromium-browser

これで、Google Chromeを使わずにChromium BrowserだけでWidevineが使えます。

この作業をスクリプト化した物を以下のリンク先に置いておきます。

https://drive.google.com/open?id=0B1CllnoLXtxZTm5VbW1jbTgwbDg

beta版Chromiumで同期などをしたい時には、API keyが必要になります。手順は以下のリンクに記載されています。Chromium Devの参加とプロジェクトの作成が必要ですが、プロジェクト作成は適当な名前で作成すれば良いでしょう。

http://www.chromium.org/developers/how-tos/api-keys

.profileに取得した3つのAPIキーを追加します。::

    export GOOGLE_API_KEY="api_key"
    export GOOGLE_DEFAULT_CLIENT_ID="client_id"
    export GOOGLE_DEFAULT_CLIENT_SECRET="client_secret"

システムに再ログインすれば、反映されてGoogleが提供するAPIが有効になります。

Ubuntuでjstest-gtkのプロファイルを保存してジョイパッドを使い易い環境にする
-------------------------------------------------------------------------------------------------

Ubuntuでジョイパッドを使う場合、jstest-gtkを使って設定するのが良いです。::

    $sudo apt-get install jstest-gtk

jstest-gtkを起動させて設定をして、ユーザーの使い易いようにジョイパッドのキー割り当てを変更出来ますが、保存しても、次回PCを起動させた時に戻ってしまいます。
キー割り当て変更後に以下のコマンドを入力する事で、保存が出来るようになります。::

    $sudo jscal-store /dev/input/js0

なお、jstest-gtkのプロファイル保存機能は上手く保存する事が出来ませんので、キー割り当てを変更する毎に上記のコマンドだけを入力するようにしてください。

xfce4-terminalを透過
----------------------------

コンポジットマネージャー「compton」を起動させた状態であれば、Openbox環境でもxfce4-terminalを透過させる事が出来ます。

設定は、xfce4-terminalの「編集」→「設定」→「外観」→「背景」から行います。 不透明度は、0.7に設定しました。 背景色や文字色の変更も可能ですので、自分好みのカスタマイズを施してみると良いでしょう。

Chrome系ブラウザでe-Govを使う方法
----------------------------------------------------

http://www.gpki.go.jp/apca2/index.html

1.「◆アプリケーション認証局２の証明書」→「アプリケーション認証局２(Root)の自己署名証明書 (DER)」でAPCA2Root.derをダウンロードして保存。

2.ブラウザの「設定」→「HTTPS/SSL」→「証明書マネージャー」→「認証局」→「インポート」でAPCA2Root.derをインポート

3. https://www.e-gov.go.jp/policy/servlet/Propose が使えるようになります。

クレジットカード無しでDMMのコンテンツを購入する方法
---------------------------------------------------------------------

AVやエロゲーや同人ソフトなどを購入する際に便利なDMM.com。でも、クレジットカードでここのコンテンツを買うのに抵抗があるという人が多いでしょう。
そのような人でも、DMMはコンテンツを買えるように複数の支払い方法を用意しています。その方法は、ヘルプページに書かれています。

http://help.dmm.com/-/detail/=/qid=11108/

電子マネーや銀行振込やペイジー、DMMプリペイドカードやDMMギフト券などでポイントが買えるようになっています。

この中で便利なのはペイジーを使った方法です。

この方法は090番の電話番号の登録が必要になりますが、クレジットカードよりは安全かなと思います。

電話番号の登録が嫌な人は、コンビニで2000円から買えるプリペイドカードを購入しても良いです。

1000円程度の物を購入したい場合は、ペイジーを使う事になります。

ペイジーを使った支払い方法は以下の通りです。

http://www.dmm.co.jp/regist/bank/payeasy_atm.html/=/navi=none/

DMMでは光ディスクの製品版とダウンロード・ストリーミング販売に対応しています。
ダウンロードやストリーミングは、ADSLクラスの通信速度がある回線であれば、十分に視聴する事が出来ますが、プレーヤーはDMMプレーヤーと呼ばれるSilverlightベースの再生プレーヤーを使う事になりますので、Silverlightプラグインをインストールしてください。
Windowsはそれほど迷う事はありませんが、Linuxの場合はPipelightとFirefoxを使ってストリーミングで視聴する事になります。

Ubuntuであれば、以下のコマンドを端末で実行してください。::

    $sudo apt-add-repository ppa:pipelight/stable
    $sudo apt-get update
    $sudo apt-get install pipelight-multi pipelight
    $sudo pipelight-plugin --enable silverlight
    $sudo pipelight-plugin --create-mozilla-plugins
    $pipelight-plugin --system-check
    $sudo pipelight-plugin --enable widevine

DRMがかけられていますので、ダウンロードで購入しても対応プレーヤーが無ければ再生出来ませんので注意してください。
どんなプレーヤーでも観られるようにするには、DMMプレーヤーで動画を再生させながら、動画キャプチャーソフトを使って動画をキャプチャーしていけば良いです。
Linuxであれば、Record my desktopで出来ました。

staging版Wineにのみ搭載されている「CSMT」
------------------------------------------------------------

staging版Wineは、従来の開発版Wineであり、安定版では搭載されていない機能やバグフィクスなどを先行して採り入れています。このstaging版Wineには、マルチスレッドプロセッサ向けのパフォーマンスが向上する機能が搭載されており、それが「CSMT」です。

https://github.com/wine-compholio/wine-staging/wiki/CSMT

::

    When an application makes use of Direct3D on Windows, DirectX will implicitly create threads to decouple the actual drawing from the rest of the program. Vanilla Wine does not implement such a logic and instead directly executes the OpenGL calls without waiting for the call to be executed on the graphic card. This provides a somewhat similar performance but has the disadvantage that the order of drawing commands is no longer guaranteed to be correct.

    In most of the games and programs you won't notice a difference between Windows and Wine, but in some applications you will encounter bugs like flickering geometry. This is caused by the changing drawing order in each frame. To solve this problem Stefan Dösinger worked on a feature called CSMT (command stream multi-threading) which implements the same logic as on Windows and additionally causes a performance boost. Wine Staging added this feature in version 1.7.33.

4スレッド実行が出来るプロセッサであれば、このCSMTでかなりパフォーマンスアップが図れます。Pentium G 4600でも使えましたが、完全な2コア2スレッドCPUであるCeleron G3900では、大幅にパフォーマンスが落ちてしまいましたので注意が必要です。::

    winecfg→stagingタブ→「Enable CSMT for better graphic performance」にチェックを入れて適用すれば、CSMTがオンになります。


.. image:: ../_images/Screenshot20from202017-05-172002-55-55.png

2chブラウザ「JD」で新APIを使う方法
----------------------------------------------

2chブラウザ「JD」を新APIでも使えるようにするには、以下の設定を行います。

JDを起動させて、メニューバーの「設定」→「about:config」→「板一覧を取得するサーバ」を「http://kita.jikkyo.org/cbm/cbm.cgi/20.p0.m0.sc.op/-all/bbsmenu.html」に変更するだけです。

Smarty 3.1ではプラグインの追加方法が変更されているので注意
------------------------------------------------------------------------------

PHPテンプレートエンジン「Smarty」では、プラグインの自作が出来ますが、従来の方法は http://www.smarty.net/docs/ja/variable.plugins.dir.tpl のように、 SMARTY_DIR 直下の pluginsや新規に作成したフォルダに自作プラグインを放り込む事で以下のように、plugins_dir[]メソッドを使ってパスを指定すれば使えました。::
    <?php
    $smarty->plugins_dir[] = 'includes/my_smarty_plugins';
    ?>

しかし、Smarty 3.1からは、自作プラグインの導入方法が変更されています。 上記の方法で追加してプログラムを動作させると、以下のようなエラーが表示されます。

Notice: Indirect modification of overloaded property Smarty::$plugins_dir has no effect

Smarty 3.1でのプラグインの追加は、setPluginsDirメソッドやaddPluginsDirメソッドを使います。

例えば、/var/www/xxxというディレクトリに自作プラグインを放り込みたい場合には、以下のようにパスを追加してあげれば、エラーメッセージが出なくなります。::

    $smarty->addPluginsDir(array('/var/www/xxxx'));

以下のリファレンスページを参考にすれば良いです。

http://www.smarty.net/docs/en/api.add.plugins.dir.tpl

Ubuntu 16.04にApache2+WSGI環境を構築する
--------------------------------------------------------------

1.mod-wsgiをインストールする::

    $sudo apt-get install -y libapache2-mod-wsgi
    $sudo a2enmod mod-wsgi

2./etc/apache2/apache2.confの該当部分を以下のように編集する::

    <Directory /var/www/>
    Options Indexes FollowSymLinks ExecCGI
    AddHandler cgi-script .cgi
    AddHandler wsgi-script .wsgi
    AddHandler wsgi-script .py
    AllowOverride None
    Order allow,deny
    allow from all
    Require all granted
    </Directory>

3.Apache2を再起動させる::

    $sudo service apache2 restart

PPSSPPをUbuntu 16.04 LTSにインストールする
------------------------------------------------------------

PSPエミュレーター「PPSSPP」はUbuntu 16.04 LTSにもインストールする事が出来ますが、全体的にライブラリのバージョンが上がっていますので、そのままでは依存関係の問題が発生してインストールする事が出来ません。
https://launchpad.net/ubuntu/xenial/amd64/libglew1.10/1.10.0-3 からlibglew1.10をダウンロードしてインストールします。::

      $sudo dpkg -i libglew1.10_1.10.0-3_amd64.deb

後はPPSSPPをインストールしていきます。::

    $sudo add-apt-repository ppa:noobslab/apps
    $sudo apt-get update
    $sudo apt-get install ppsspp

Ubuntu 14.04でプリンターを使う時にはCUPSを使うと楽に設定できる
------------------------------------------------------------------------------------

Ubuntu 14.04でプリンターを使う時にはCUPSを使うと楽に設定出来ます。

APTなどでCUPSをインストール後に、パソコンにプリンターを接続して電源を入れた状態でブラウザを起動させ、「 http://localhost:631 」にアクセスして、指示通りに設定していくだけでプリンターを使うことが可能となります。

Ubuntuではメニュー→システム→プリンターでプリンターの設定が出来ますが、環境によっては途中で止まってしまったりしますので、ブラウザでCUPSにアクセスした方が確実にプリンターの設定が可能です。

PlayOnLinuxのバージョンを固定してエラーを防ぐ
-------------------------------------------------------------

Windows APIレイヤーのWineを視覚的に操作することが出来るソフトウェアであるPlayOnLinuxは、Linuxユーザーがよく利用しているソフトウェアです。
環境によって最新版の4.2.5は、アプリケーションインストールの画面で矢印が回転して作業が進まなかったり、32bitのOpenGLのライブラリが足りないなど様々なエラーに遭遇することが多々あります。
このような時には、旧バージョンを利用すると問題が解決します。

Synapticパッケージマネージャーを使っている場合は、PlayOnLinuxの項目の色をクリックで反転させて、メニュー→「パッケージ」→「バージョンの強制」を選択して、旧バージョンのPlayOnLinuxを選択します。
インストール後は、メニュー→「パッケージ」→「バージョンの固定」を行なうとSynapticでアップグレード作業を行っても更新されずに済みます。
また、ターミナルでapt-get upgradeなどを行なうことが多い場合には、PlayOnLinuxのリポジトリを選択しないようにSynapticパッケージマネージャーなどで設定しておくと良いでしょう。

Ubuntuでファイアウォールを設定する
---------------------------------------------

１．ufwのインストール::

    $sudo apt-get install ufw

２．ufwの現在の状況の確認::

    $sudo ufw status

３．SSHとHTTPだけ許可する設定

全てを拒否する設定::

    $ sudo ufw default deny

SSHを通す。::

    $ sudo ufw allow 22

HTTPを許可する。::

    $ sudo ufw allow 80

ポートの範囲してUDPの60000から610000を開ける場合::

    $sudo ufw allow 60000:61000/udp

ufwを有効にする。::

    $ sudo ufw enable

Linuxディストリビューションのリマスターでデータ容量が肥大化しやすい箇所に注意して制作を行う
--------------------------------------------------------------------------------------------------------------------

Ubuntuなどをベースにして、リマスターを行い、オリジナルのディストリビューションを制作することが出来ます。
その際に、データ容量が肥大化しやすい箇所を意識しながら、制作を行っていきますと、最終的なISO容量を抑えることが出来ます。

1./usr/share/iconsは、各アイコンのキャッシュデータ（icon-theme.cache）が結構容量が大きいですので、インストールするアイコンを絞って入れると良いでしょう。

2./usr/share/backgroundsなどの背景画像データも肥大化の原因になりますので、必要最低限に抑えます。

3./optには、ユーザー独自のアプリケーションやサードパーティー製のアプリケーションが置かれます。
容量に注意することが必要です。

4./etc/skelは、システム初回起動時にホームディレクトリに置くファイルを設置することが出来ます。
特にLiveCDを起動させた時に、ここに置いているファイル群が大容量ですと読み込みに時間が掛かりますので注意してください。

5./var/lib/apt/listsは、PPAを追加してアップデートを行った時に作成されるアプリケーションリストファイルが保管される所です。PPAを追加すればするほど、ここに作成されるファイル容量が増えます。

容量を減らす方法としては、SynapticパッケージマネージャーなどでPPAのチェックを外して、apt-get updateを行います。

mksquashfsのオプションでLinuxディストリビューションのISO容量を削減する
----------------------------------------------------------------------------------------------

Linuxディストリビューションの多くは、ISOファイルの形式で配布されていますが、SquashFSをLiveCDのファイルシステムとして活用しているケースが多いです。
その為、SquashFSの使い方によってISOの容量が大きく変わってきます。

・元のファイルサイズを2.4GBとします。$FSPATHは元のフォルダ、filesystem.squashfsが出力されるSquashFSファイルです。

1.gzipで圧縮::

    $mksquashfs $FSPATH filesystem.squashfs -noappend -no-recovery

930MBのfilesystem.squashfsが完成

2.gzip圧縮でブロックサイズを指定::

    $mksquashfs $FSPATH $ISOPATH/casper/filesystem.squashfs -noappend -no-recovery -b 1048576

900MBのfilesystem.squashfsが完成

3.LZO圧縮::

    $mksquashfs $FSPATH $ISOPATH/casper/filesystem.squashfs -noappend -no-recovery -comp lzo

960MBのfilesystem.squashfsが完成

4.XZ圧縮::

    $mksquashfs $FSPATH $ISOPATH/casper/filesystem.squashfs -noappend -no-recovery -comp xz

830MBのfilesystem.squashfsが完成

5.XZ圧縮でブロックサイズ指定::

    $mksquashfs $FSPATH $ISOPATH/casper/filesystem.squashfs -noappend -no-recovery -b 1048576 -comp xz

800MBのfilesystem.squashfsが完成

6.XZ圧縮でブロックサイズを指定し、X-dictを設定::

    $mksquashfs $FSPATH $ISOPATH/casper/filesystem.squashfs -noappend -no-recovery -b 1048576 -comp xz -Xdict-size 100%

750MBのfilesystem.squashfsが完成

XZ圧縮を行いますと、圧縮が大幅に時間が掛かりますが、オプションを付けることでかなりの圧縮が出来ます。
どのようなシステムを想定しているかによって、圧縮方式を変更していくと良いでしょう。

リマスターしたUbuntuでHDDにインストールしてもUEFIで起動出来ない場合の対処法
---------------------------------------------------------------------------------------------------------

Ubuntuをリマスターして、成果物をHDDにインストールした時に、UEFIモードでgrubプロンプトに落ちる事が多々あります。これを対処するには、リマスター時のLiveCDのホームディレクトリをubuntuにしておくだけで、LiveCDでもHDDインストールでもUEFIブート出来るようになります。

LiveCDは、ERIディレクトリにあるファイル群を読み込んで、起動し、カーネルはvmlinuz.efiが使われます。UEFIモードでHDDインストールを行なう時には、EFIパーティション(GPT)を作っておく必要があります。
UEFIブート用の特殊なFAT32のパーティションであり、起動ドライブにおいて最優先で読み込みます。これが無いと、HDDインストールしたUbuntuは動作しませんので、BIOSとの一番の違いと言えます。

EFIパーティションを作成するには、UEFIモードで対応しているLiveCDで起動させる必要があり、この状態でUbiquityをパーティション変更の部分まで進める事で、作成出来るようになります。
ファイルシステム選択欄に「EFIパーティション」という項目が増えていますので、これを指定してください。 EFIパーティションのサイズは、250MBぐらいで構いません。

xfceのターミナルからEmacsを起動させるコマンド::

    $xfce4-terminal --hide-menubar -e emacs --title=emacs

Boot Repairを使ったUEFI対応ポータブルドライブの作成
--------------------------------------------------------------------

UEFI環境において、BIOS時代の方法でポータルHDDやUSBメモリにフルインストールしますと、先に作成したドライブのGRUBがgrub rescueなどに落ちてしまいます。この現象を避ける為には、Boot Repairというソフトウェアを導入するのが有効です。::

    $ sudo add-apt-repository ppa:yannubuntu/boot-repair
    $ sudo apt-get update
    $ sudo apt-get install -y boot-repair

1.LiveCDを使って、デスクトップ環境を起動させた状態からUbuntuのインストーラーを起動させます。

2.インストールは、通常のUEFI向けのインストールで構いません。

3.インストール後、そのまま、LiveCDのデスクトップ環境上でGpartedを起動させます。

4.Gpartedで先ほどポータブルドライブにインストールしたEFIパーティションを削除し、FAT32にフォーマットした後、右クリックでフラグ編集を選び、「boot」の項目にチェックを入れます。

5.Boot Repairを起動させ、「高度なオプション」をクリックします。

セキュアブートの項目は必ず外す必要があります。設定が終わったら、適用ボタンを押して、GRUBの再インストールと設定を項目通りに行います。

再起動を行って、UEFIで起動するドライブを設定して保存、再起動させれば完了です。

Windows 10に仮想PCを設置してLinuxのパワーを活かす
------------------------------------------------------------------------

Windows 10を搭載したパソコンが大手家電量販店などで販売されています。

UbuntuなどのLinuxディストリビューションは、最新のBIOSシステムであるUEFIとセキュアブートに対応しています。しかし、BaytrailなどのAtom系Socを搭載したWindowsタブレットは、独自のドライバを使っている各種チップを搭載しているケースが多く、32bit UEFIを採用しているケースもありますので、スムーズにLinuxディストリビューションをインストール出来ず、無線LANが使えなかったり、タッチパネルが使えなかったりします。
Windowsとのデュアルブートが行いにくいといって欠点もあります。その為、WindowsタブレットでLinuxを使う方法としては、Virtualboxなどの仮想化ソフトウェアを使って仮想PCを構築し、そこにLinuxディストリビューションをインストールして使うというのが最も現実的です。

https://www.virtualbox.org/wiki/Downloads

1.WindowsにVirtualboxをインストールします。

2.タブレットの他に、仮想環境を構築する為のマシンを用意してください。Windowsタブレットは、メモリが1GBの物も存在し、ストレージもそれほど高速ではありませんので、WindowsタブレットにPC環境を構築してインストールすると非常に時間が掛かりますので、予め、マシンパワーのあるパソコンでLinuxが入っている仮想PCを構築してしまうのがオススメです。

3.Virtualboxには、構築した仮想環境を他のマシンに移行させる仕組みが用意されています。
「ファイル」→「仮想アプライアンスのエクスポート」で仮想環境を出力します。ファイル容量を３分の1にしてくれます。

完成したファイルをmicroSDやUSBメモリに保存して、Windowsタブレットにストレージを挿入します。

4.WindowsタブレットにインストールしているVirtualboxを起動させ、「ファイル」→「仮想アプライアンスのインポート」でovaファイルやovfファイルを選択します。
この後は、自動的にインポート作業が行われますので、完了するまで待って下さい。

後は、Windowsタブレットのスペックに合わせて、仮想マシンの環境を調整しておけば、Windows 10でLinuxを使える環境が整えます。

例えば、ゲームやWebブラウジングはWindowsで行い、EmacsやGIMPなどは仮想環境のLinuxで行うといった事も可能になります。共有フォルダを作っておけば、LinuxのEmacsでWindowsの共有フォルダにあるテキストファイルを編集するといった事も出来るでしょう。
仮想環境のLinuxに使うデスクトップ環境は、LXDEやOpenboxなど軽量な物にしておいた方が軽快に動作します。

Linux版FirefoxでWindows用のFlashを使用する
-----------------------------------------------------------

Pipelightは、Windows用のブラウザープラグインをLinux上で動かす為のプラグインです。

UbuntuではPPAが用意されていますので、以下の方法で入れていきます。::

    $ sudo add-apt-repository ppa:pipelight/stable
    $ sudo apt update
    $ sudo apt install pipelight-multi
    $ sudo pipelight-plugin --update
    $ sudo pipelight-plugin --enable flash

PulseAudioを切る
------------------------

Jackなどの他のサウンドサーバを使用したり、直接Alsaドライバーを各音楽ソフトウェアなどで使う場合にはPulseAudioを切る必要があります。

1.管理者権限で「/etc/pulse/client.conf」をテキストエディタで開く

2.「autospawn=no」「daemon-binary=/bin/true」を追記して保存し、システムを再起動させます。

3.端末を使って手動で「pulseaudio --start」でPulseAudioを起動させ、「pulseaudio --kill」でPulseAudioを切ることができ、spwanが起きません。

Ubuntu 14.04にゲームエミュレーターをインストールする
--------------------------------------------------------------------

◇Wii/ゲームキューブ(Dolphin)::

    $ sudo add-apt-repository ppa:glennric/dolphin-emu
    $ sudo apt-get update
    $ sudo apt-get install dolphin-emu-master

◇PSP(PPSSPP)::

    $ sudo add-apt-repository ppa:ppsspp/stable
    $ sudo apt-get update
    $ sudo apt-get install ppsspp-qt

◇PS2(PCSX2・要BIOS)::

    $ sudo add-apt-repository ppa:noobslab/pcsx2
    $ sudo apt-get update
    $ sudo apt-get install pcsx2

◇PS(PCSX Reloaded・ゲームに応じてBIOSが必要)::

    $ sudo apt-get install pcsxr

Ubuntu 14.04/12.04 LTSにnginx＋PHP FPMをインストール
-------------------------------------------------------------------------------

WebサーバのApache2を使う代わりに、nginxを使うことが出来ます。nginxでPHPを使用する場合にはPHP FPMが必要になります。::

    $sudo apt-get install python-software-properties
    $sudo add-apt-repository ppa:nginx/stable
    $sudo add-apt-repository ppa:ondrej/php5
    $sudo apt-get update
    $sudo apt-get install nginx php5-fpm

◇/etc/nginx/sites-available/defaultの編集(PHP FPMをデフォルトで使えるようにする）::

    location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
    # With php5-cgi alone:
    # fastcgi_pass 127.0.0.1:9000;
    # With php5-fpm:
    fastcgi_pass unix:/var/run/php5-fpm.sock;
    fastcgi_index index.php;
    include /etc/nginx/fastcgi_params;
    }

◇/etc/php5/fpm/php.iniの編集::

    ; cgi.fix_pathinfo provides *real* PATH_INFO/PATH_TRANSLATED support for CGI. $
    ; previous behaviour was to set PATH_TRANSLATED to SCRIPT_FILENAME, and to not $
    ; what PATH_INFO is. For more information on PATH_INFO, see the cgi specs. Se$
    ; this to 1 will cause PHP CGI to fix its paths to conform to the spec. A sett$
    ; of zero causes PHP to behave as before. Default is 1. You should fix your s$
    ; to use SCRIPT_FILENAME rather than PATH_TRANSLATED.
    ; http://php.net/cgi.fix-pathinfo
    cgi.fix_pathinfo=0

◇nginx再起動::

    $sudo service php5-fpm reload
    $sudo service nginx reload

Gzip以外でSquashFSを使う
-----------------------------------

SquashFSは読み込み専用のファイルシステムの一種です。
デフォルトでは圧縮プログラムにGzipが使われており、デフォルトの状態でも高圧縮が出来る仕掛けになっています。Ubuntu 14.04 LTS/12.04 LTSには、Squash Tools 4.2が搭載されており、XZやLZOといった圧縮プログラムを利用出来ます。また、Squash Tools 4.3のソースコードからビルドを行なうことでLZ4圧縮を使用することも可能です。
XZ圧縮を行なうことでGzip圧縮よりもさらにファイル容量を小さくすることが出来ます。 mksquashコマンドを以下のように使うとXZ圧縮を使えます。

http://techoverflow.net/blog/2013/01/11/create-highly-compressed-squashfs-from-folder/

::
    $mksquashfs [source folder] [SquashFS target file] -b 1048576 -comp xz -Xdict-size 100%

出来上がったファイルのマウント方法は以下のコマンドを使います。::

    $mount -o loop -t squashfs [SquashFS file] [folder you want to mount it in]

/etc/fstabに以下の内容を追加すると、システム起動時に自動的にマウントします。::

    [SquashFS file] [folder you want to mount it in] squashfs auto,defaults 0 0

ワンクリックで起動出来るPortableLinuxAppsで公開されているアプリケーション
------------------------------------------------------------------------------------------------

http://www.portablelinuxapps.org/

PortableLinuxAppsは、UbuntuやCent OSやRHELなどのLinuxディストリビューションでワンクリックで使うことが出来るアプリケーションです。Windowsでは、USBメモリに入れて持ち運びが出来るポータブルアプリケーションと呼ばれる物がありますが、PortableLinuxAppsで公開されているアプリケーションはそのような類の物です。各ディストリビューションのインストール方法を使用すると、多くの依存関係のあるソフトウェアがまとめてインストールされてしまいます。

PortableLinuxAppsのアプリを使用すると、余計なアプリがインストールされることがありません。
また、USBメモリに入れておくとメインシステムの外部記憶装置の容量が圧迫されることから解放されるという利点があります。

Ubuntuを大幅に強化したい時に役に立つUbuntuUpdates.org
----------------------------------------------------------------------------

http://www.ubuntuupdates.org/ppas

Ubuntuの主要なアプリケーションを最新のLinux環境に近づける為に使うと役に立つPPAが集まっているサイトです。 特にUbuntu 12.04 LTSはPPAを使うと、Linuxカーネル3.16やPython 3.4やLLVM 3.4やPHP 5.5などの最新のバージョンが使えるようになります。

Ubuntuのアプリケーションのバージョンを固定する
--------------------------------------------------------------

UbuntuはAPTなどでアップデートをすると基本的に最新のバージョンが入るようになっています。しかし、場合によっては旧バージョンの方が使いやすかったり、安定していたりするケースは多々あります。
その為、アップデートをしたくないという場合には、バージョンを固定するのが有効な手段です。

Synapticパッケージマネージャーを起動し、バージョンを固定したいアプリケーションを選択し、メニューの「パッケージ」⇛「バージョンを固定」を選択すると、バージョン固定が可能になります。

nautilus-dropboxを使わない安定したDropboxのインストール方法
----------------------------------------------------------------------------------

https://www.dropbox.com/install-linux

UbuntuなどのLinuxディストリビューションにDropboxのクライアントを導入する場合、APTなどのパッケージ管理ソフトウェアなどを使ってインストールを行いますが、環境によってはエラーが出ます。
より安定してインストールするには、コマンドラインで直接クライアントをダウンロードして起動させることです。

自動起動を確実に行いたい場合には、デスクトップ環境の自動設定用のフォルダ（.config/autostartなど）に「dropbox.desktop」というファイルを作り、「Exec=/home/(user)/.dropbox-dist/dropboxd」（(user)はユーザー名)の一文を書いておいて、再ログインすると出来るようになります。

KVMで音を鳴らす
-------------------------

Linuxに標準で搭載されている仮想化システムKVMではSpiceを使って音を鳴らすことが可能です。

Spiceをインストールする::

    $sudo apt-get install qemu-kvm-spice
    $sudo apt-get install spice-client spice-client-gtk
    $sudo apt-get install python-spice-client-gtk

KVMでOSを起動させる::

    $kvm -cdrom xxx.iso -m 512 -showhd all

Ubuntu系ディストリビューションでSkyDriveやGoogle Driveなどをネットワークドライブにする方法
---------------------------------------------------------------------------------------------------------------------

1.http://otixo.com/でアカウントを作成する

2.otixo.comにSkyDriveなどのオンラインストレージを登録する

3.davfs2をインストールする::

    $sudo apt-get install davfs2
4.適当なフォルダを作成する（ここではotixoフォルダを作成しました)

5.otixoフォルダ内でターミナルを起動させ、otixo.comのWevDAVを登録する::

    $sudo mount -t davfs https://dav.otixo.com .

6.otixo.comのアカウントとパスワードを入力する

7.otixoフォルダ内にotixo.comに登録したオンラインストレージのシンボリックリンクが作成される。
これでオンラインストレージをネットワークドライブとして使える

デスクトップマスコット「MaCoPix」
-----------------------------------------

MaCoPixはLinuxなどで動作するデスクトップマスコットエンジンです。UbuntuではAPTでインストール出来ます。::

    $sudo su
    #apt-get install macopix-gtk2

起動方法はターミナルで「macopix ファイル名」で起動出来ます。

OpenJTalk
----------------

OpenJtalkは、テキストデータなどを解析して読み上げるソフトウェアです。音声解析ソフトウェアと併用すると、コンピュータと「会話」することが出来るようになります。::

    $sudo apt-get install open-jtalk open-jtalk-mecab-naist-jdic htsengine libhtsengine-dev hts-voice-nitech-jp-atr503-m001

辞書は/var/lib/mecab/dic/open-jtalk/naist-jdic、音声は /usr/share/hts-voice/nitech-jp-atr503-m001にインストールされています。MMDAgentのMeiの声をインストールするには以下の通りの作業を行います。::

    $mkdir ~/tmp/src
    $cd ~/tmp/src
    $wget http://downloads.sourceforge.net/project/mmdagent/MMDAgent_Example/MMDAgent_Example-1.1/MMDAgent_Example-1.1.zip
    $unzip MMDAgent_Example-1.1.zip
    $sudo cp -R MMDAgent_Example-1.1/Voice/* /usr/share/hts-voice/

◇OpenJTalkの主なパラメータ::

    -s int sampling frequency 16000 [ 1--48000]
    -z int audio buffer size 1600 [ 0--48000]
    -p int frame period (point) 話速 80 [ 1--]
    -a float all-pass constant 声質 0.42 [ 0.0--1.0],br/> -b float postfiltering coefficient 0.0 [-0.8--0.8]
    -g int gamma = -1 / i (if i=0 then gamma=0) 0 [ 0-- ]
    -u float voiced/unvoiced threshold 0.5 [ 0.0--1.0]
    -jm float weight of GV for spectrum 音量 1.0 [ 0.0--2.0]
    -jf float weight of GV for Log F0 抑揚 1.0 [ 0.0--2.0]
    -jl float weight of GV for low-pass filter 1.0 [ 0.0--2.0]
    -l regard input as log gain and output linear one (LSP)

Xubuntu 12.04以降でシステム効果音を鳴らす
----------------------------------------------------------

Xubuntu 12.04以降ではデフォルトでシステム効果音が鳴らないように設定されています。

Xubuntuの場合はシステムサウンドをONにしてから、gnome-session-canberraをSynapticパッケージマネージャーなどから導入します。

・デスクトップ環境がXfceの場合は「設定マネージャー」→「設定エディター」→「xsettings」→「EnableEventSounds」にチェックを入れると、再ログオン時に音が鳴るようになります。また、SoundThemeNameでサウンドテーマを変更することが出来ます。::

    $sudo su
    #apt-get gnome-session-canberra

gnome-session-canberraを使う方法以外にはGUI表示させずに起動時に音楽プレイヤーで起動音を再生させるという方法があります。ここではogg123というOGG再生プレーヤーを利用しています。::

    $sudo su
    #apt-get install voribis-tools

「設定マネージャー」→「セッションと起動」→「自動開始アプリケーション」の追加ボタンを押して以下の様に設定後、システムを再起動させます。::

    名前:システム起動音（任意の名称を付けてください）
    説明：（分かりやすい説明を書いておくと便利です）
    コマンド:/usr/bin/ogg123 /usr/share/sounds/（サウンドテーマ名）/stereo/desktop-login.ogg

この設定は「~/.config/autostart」に保存されています。

リモートデスクトップを使ってAndroidタブレットにUbuntu 12.04のデスクトップを表示させる
------------------------------------------------------------------------------------------------------------

リモートデスクトップを使ってAndroidタブレットにUbuntu 12.04のデスクトップを表示させることが出来ます。これはAndoridoタブレットを仮想的なディスプレイとして利用出来ることを指しています。

1.Google Playで「VNC」で検索して、AndroidタブレットにVNCアプリをインストールし、接続したいPCのユーザー名・パスワード・マシンのIPアドレス・ポートなどの必要な情報を登録しておきます。

2.Wi-Fi接続出来るUbuntu 12.04マシンにAPTなどで「X11VNC」というGUIでVNC設定が出来るソフトウェアをインストールします。X11VNCを起動させて必要な情報を入力します。Sharedのチェックを入れると多人数でリモートデスクトップが利用出来るようになります。

3.Ubuntu12.04マシンのVNCサーバが動作している状態で、AndroidタブレットのVNCビューアから接続すれば、Ubuntu12.04のデスクトップ画面を見ることが出来ます。

4.コマンドでは以下のように設定していきます。::

    $x11vnc -storepasswd
    #x11vnc -rfbauth /root/.vnc/passwd

常駐させたい場合は、/etc/rc.localに「/usr/bin/x11vnc -rfbauth /root/.vnc/passwd -forever -xkb」と記述して再起動する

その他の自動起動は以下の通りです。::

    $ x11vnc -storepasswd（パスワードをセットする）
    # su
    # vi /etc/xinetd.d/x11vnc

    service x11vnc
    {
    port = 5900
    type = UNLISTED
    socket_type = stream
    protocol = tcp
    wait = no
    user = root
    server = /usr/bin/x11vnc
    server_args = -inetd -o /var/log/x11vnc.log -display :0 -auth /var/lib/gdm/:0.Xauth -rfbauth /home/ユーザーネーム/.vnc/passwd -forever
    disable = no
    }

    # vi /etc/services

    x11vnc 5900/tcp # VNC server（最下行に付け足す）

    # /etc/init.d/xinetd restart
    # reboot
    $ x11vnc -storepasswd

次に自動起動用のショートカットを保存するために、/home/nnnn/.config内にフォルダautostartを作成する。

自動起動用のショートカットを作成する::

    $ lxshortcut -o .config/autostart/x11vnc-start.desktop

ショートカットを登録する画面が表示されたら、分かりやすい「名前」（x11vnc自動起動）と次の「コマンド」を登録する。::

    $/usr/bin/sudo -u nnnn x11vnc -forever -nossl -noncache -nolookup -bg -usepw

設定→デスクトップセッションの設定で「x11vnc自動起動」にチェックが入っているのを確認

音声コーデック「VO3+」を使ったAVI動画の修正方法
-----------------------------------------------------------------

Ogg Vorbis系の音声コーデック「VO3+」を使っている動画は、動画プレーヤー「VLC」などでは再生出来ません。コーデックを入れれば再生できますが、MP3やAACに変換した方が使い勝手がいいでしょう。

1.Avidemuxで読み込む。音声の再生は出来ないが、音声の保存は出来るので、「音声」→「保存」で拡張子を「.ogg」にして音声を保存します。

2.音声編集ソフトウェア「Audacity」で1で保存した音声を読み込み、「ファイル」→「書き出し」でWAVE（拡張子wav)ファイルとして保存します。

3.Avidemuxで1の映像を読み込み、「音声」→「主トラック」で3のWAVEファイルを読み込み、映像コーデックは「コピー」、音声コーデックはCBRでMP3、AACなどに設定して、音声部分だけエンコードして完了です。これでVLCでも音声が聞けるようになります。

Gstreamerを使ったアプリケーションを起動させた時に「required: GStreamer element audioconvert」というエラーが出た時の対処法
------------------------------------------------------------------------------------------------------------------------------------------------------------------

Gstreamerを使ったアプリケーションを起動させた時に「required: GStreamer element audioconvert」というエラーが出ることがあります。 これを解消するには~/.gstreamerフォルダを削除して、Gstreamerを使ったアプリケーションを再起動させるだけです。

Upstartの起動速度が遅くなる原因となるモジュール、サービス
-----------------------------------------------------------------------------

1.VMWare Player - VMWare Playerの起動に必要なモジュールをOS起動段階で読み込むので、OSの起動が遅くなる。約10秒ほど遅くなる。

2.Winbind - OS起動時に読み込む。約数秒遅くなる。

3.cups - OS起動時に読み込む。約数秒遅くなる。

4.bluetooth関連 - OS起動時に読み込む。約数秒遅くなる。

Upstartの起動スクリプトを並列処理する
------------------------------------------------

/etc/init.d/rcの「CONCURRENCY=makefile」を「CONCURRENCY=shell」に変更。OSの起動速度が速くなる。

自動起動するデーモンを切る
-----------------------------------

sysv-rc-confを使う場合::

    #sudo apt-get install sysv-rc-conf
    #sudo sysv-rc-conf

Boot-Up-Managerを使う場合::

    #sudo apt-get install bum
    #sudo bum

スワップの使用を抑える

/etc/sysctl.confに「vm.swappiness = 0」と書くと、メモリを使い切ってから、スワップを使う。

Wine1.4を使ってWindows環境入りのLiveCDをつくる
-------------------------------------------------------------------

Windows APIレイヤー「Wine1.4」を使って、Windows環境を構築し、それが動作するLiveCDを作成します。

1.UbuntuをHDDにインストール。

2.Ubuntu Builder(http://code.google.com/p/ubuntu-builder/)をインストール

3.Ubuntu BuilderでUbuntu Mini Remixをダウンロード

4.Ubuntu Mini RemixをUbuntu Builderで展開する

5.Ubuntu BuilderのSynapticパッケージマネージャでOpenbox,obconf,obmenu,Wine1.4,nm-manager,xfce4-mixerをインストール

6.Ubuntu Builderのターミナルを起動し、作成中のLiveCDのrootディレクトリ(/home/ubuntu-builder/FileSystem/root)のパーミッションを「777」に変更

7.「winecfg」コマンドで作成中のLiveCDのrootディレクトリ直下に.wineディレクトリを作成

8./home/ubuntu-builder/FileSystem/root/.wine/drive_c/Program Files直下にWineで動かしたいWindowsのアプリケーションを置きます。

9.WineでWindowsアプリケーションを動かすコマンドは「wine start /Unix "/root/.wine/drive_c/Program Files/アプリケーション.exe"」

/etc/xdg/autostartの直下にコマンドの欄に先ほどのコマンドを書き込んだdesktopファイルを作成すると、OS起動後に自動でアプリケーションが起動します。

/etc/xdg/openbox/menu.xmlに先ほどのコマンドを追加すると、Openboxのメニュー項目に追加することも出来ます。

10.作業が完了すれば、Ubuntu BuilderのBuildボタンを押して、LiveCDを完成させます。後はUSBメモリにインストールしたり、CD-Rなどに焼きこんだりして使うだけです。2D格闘ゲームエンジン「M.U.G.E.N1.0」を使って「格闘ゲーム専用LiveCD」を作って遊んでみました。Windowsが無くてもWindowsをPCにインストールしなくてもM.U.G.E.Nをどこでも持ち運べるのはなかなか面白いものです。
Wine1.4はDirectX 9が無くてもアプリケーションが動作するほどよく出来ているソフトウェアですが、万能ではありません。.NET Frameworkで作成されたアプリケーションは.NET Framework 2.0ぐらいまでのものしか動作しません。Visual C++などWindowsネイティブなアプリケーションの方が動作する確率は高いです。
動作するWindowsアプリケーションを組み合わせて「擬似Windows LiveCD」を作ってみてもいいのではないでしょうか。

Compiz Fusion IconでXmonadと他のウィンドウマネージャを切り替える
-----------------------------------------------------------------------------------------

GPUで多彩なエフェクトを使うことが出来るウィンドウマネージャ「Compiz」にはパネルのトレイに常駐させることが出来る設定ソフトウェア「Compiz Fusion Icon」があります。これはUbuntuの場合、Synapticパッケージマネージャーなどで簡単にインストール出来ます。Comipz Fusion Iconには、Compiz以外のウィンドウマネージャに切り替える機能があります。これを使えば、Xmonadの環境からCompizなどのウィンドウマネージャへ切り替えることができます。

1.Xmonadを終了させる(Mod(デフォルトではAltキー）+Shift+q)

2.パネルのシステムトレイにあるCompiz Fusion Iconを右クリックして、「Select Window Manager」で切り替えたいウィンドウマネージャに切り替えます。Compizを使う場合、xcompmgr及びtranssetを使わないでください。

3.Xmonadに戻したい場合は、現在使っているウィンドウマネージャをkillした後にターミナルで「xmonad &」でXmonadを起動させます。以下のようなスクリプトを書いておくと便利です。

◇xmonad-start.py::
    #!/usr/bin/env python
    #-*- coding:utf-8 -*-
    import os
    import sys
    desktop_session = sys.argv[1]
    os.system("skill -KILL %s" % (desktop_session))
    os.system("xmonad &")

使い方はターミナルで「python xmonad-start.py 現在起動しているウィンドウマネージャ名」です。

zipで固めた画像を閲覧できるソフトウェア「Comix」
--------------------------------------------------------------

本来は漫画を読むためのコミックビューアですが、zipで固めた画像を閲覧することも出来ます。::

    $sudo apt-get install comix

Ubuntuでの動画キャプチャー
--------------------------------------

Ubuntuでも動画キャプチャーを行うことができます。「recordMyDesktop」というソフトウェアをインストールします。::

    $sudo apt-get install recordmydesktop

recordMyDesktopは、メニューには「Desctop recorder」という名前で登録されています。操作は簡単で設定で詳しい設定をすることが出来ます。「ウィンドウ選択」ボタンを押して録画したいウィンドウをクリックすると、そのウィンドウで動くソフトウェアの映像だけを記録することができます。録画の開始は「録音（なぜか日本語表示がそうなっている）」ボタンをクリックします。録画の停止はパネル上に表示されている赤い四角ボタンをクリックするとメニューが表れ、ここで出来ます。映像コーデック、音声コーデック、コンテナはそれぞれOGV,OGG,OVMとなっています。ライン端子などを使わずにPCの内部音源だけで録音するには、「サウンドの設定」→「入力」タブでサウンドカードの設定を出力だけにする必要があります。

LiveCDで書き込み機能を有効にする
---------------------------------------------

LiveCDで書き込み機能を有効にするにはPesistence機能を有効にします。

1.ext2/3/4でパーティションをフォーマットする

2.ラベルを付けます。Persistence機能はLinuxの構成で書き込んだ部分を差分として記憶します。この書き込みが出来る領域のパーティションのラベルを「casper-rw」と書きます。homeディレクトリを別に記憶したい場合はラベルに「home-rw」と記述します。つまり、homeディレクトリを分けたい場合、Persistent機能で使う領域はcasper-rwとhome-rwの2つが必要になります。

3.LiveCDを起動させるときには「persistent」オプションを付ける必要があります。grub2の場合は以下のような感じで書きます。::

    menuentry "Linuxディストリビューション名" {
    loopback loop (hd0,1)/Linuxディストリビューション.iso
    linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=/Linuxディストリビューション.iso persistent --
    initrd (loop)/casper/initrd.lz
    }

メニューからアプリケーションが起動できない場合の対処法
----------------------------------------------------------------------

Synapticパッケージマネージャーなどのように管理者権限から起動させるタイプのアプリケーションはメニューから起動出来ない場合があります。その場合はhomeディレクトリにある「.gconf/apps/gksu/%gconf.xml」をテキストエディタで開き、以下のように変更してください。これでgksuをsudoモードで動かすことが出来ます。::

    <entry name="sudo-mode" mtime="1298474650" type="bool" value="true"/>

RAMDISK設定
-------------------

::

    $sudo su
    #gedit /etc/fstab

fstabに「tmpfs /tmp tmpfs default 0 0」を追記して、システムを再起動すると使えるようになります。

HDD修復方法
-------------------

LiveCDを起動し、ターミナルで以下のコマンドを入力します。ここではファイルシステムをext4、デバイス名を/dev/sda2とします。::

    #fsck.ext4 -y /dev/sda2

Ubuntu 10.04+ブロードバンドで回線速度が遅いと感じたら、MTUを調整
------------------------------------------------------------------------------------------

Ubuntu 10.04をインストールして、いざネットを使ったときに遅く感じることがないでしょうか？これはネットワーク接続のMTUの設定が自動になっているからです。これを回線に合わせて変更しておきます。フレッツ光プレミアムの場合は「1438」、フレッツADSLを使っている場合は「1454」にしておくといいでしょう。ちなみにRWINはLinuxの場合、自動で調整してくれます。

IPv6を無効にする方法
-----------------------------

IPv6を無効にすると、無線LANなどが安定することがあります。::

    $sudo gedit /etc/modprobe.d/aliases

以下の文を追加し、再起動します。::

    alias net-pf-10 off

パッケージキャッシュを消す
--------------------------------

パッケージキャッシュを消すと、ディスクスペースを増やすことが出来ます。アプリケーションをインストールした後は不要になるので定期的に消しておきましょう。

◇パッケージキャッシュ容量を確認::

    $du -sh /var/cache/apt/archives/

◇パッケージキャッシュを削除::

    $sudo apt-get clean

ネットワークマネージャーをWicdに変更
------------------------------------------------

Ubuntuのウィンドウマネージャーの中にはGNOMEのネットワーク設定を引き継がないものがあるので、安定しているWicdに変更するといいでしょう。

1.APTなどでWicdをインストール::

    $sudo apt-get install wicd

2.Wicdと競合するnetwork-manager、network-manager-gnomeを削除::

    $sudo apt-get --purge remove network-manager network-manager-gnome

3.再ログインする

グラフィックドライバの情報を得る
------------------------------------------

::

    glxinfo |grep vendor
    dmesg | grep drm

グラフィックドライバをカーネルに入っているオープンソースドライバに戻す
----------------------------------------------------------------------------------------

1.xorg.conf を削除::

    $sudo rm /etc/X11/xorg.conf
2.オープンソースの選択肢（/usr/lib/mesa/ld.so.conf）を選択

    $sudo update-alternatives --config gl_conf

3.ld キャッシュと initramfs を更新

    $sudo ldconfig
    $sudo update-initramfs -u

4.コンピュータを再起動

MESAドライバをインストール
-------------------------------------

::

    $sudo apt-get install --reinstall libgl1-mesa-glx libgl1-mesa-dri

fglrxをアンインストール
-----------------------------

::

    $sudo apt-get remove --purge xorg-driver-fglrx

ウィンドウが消えた場合の対処法
---------------------------------------

GPUドライバを入れ替えた場合、再起動時にウィンドウマネージャーが起動せずにウィンドウが表示されないことがあります。

これはウィンドウマネージャーが起動していないだけなので、端末でウィンドウマネージャーを起動すれば直ります。例えば、Openboxを使っている場合は「openbox」と端末に入力します。

起動時にウィンドウマネージャーを確実に起動させたい場合は自動起動に登録しておくといいでしょう。

「GNOMEの電源管理」関連でログイン出来ない場合の対処方法
-------------------------------------------------------------------------------

Ubuntuを起動させ、ログインしようとすると右上に「GNOMEの電源管理の設定のデフォルトが正しくインストールされていません。あなたのコンピュータの管理者にお問い合わせください」というメッセージが出てログイン出来ないことがあります。これはHDDの容量が足りなくて、GNOMEの電源管理の設定ファイルをインストール出来ないことが原因で起こります。つまり、システムHDDの容量を増やしてあげればいいのです。 方法はいくつかありますが、Live CDを使って、任意のファイルを削除して容量を増やしてください。再起動させれば、通常通りにUbuntuのログインが出来るようになっています。

UbuntuでFlex3のパスやPythonのモジュールのパスを通す
------------------------------------------------------------------------

Windowsでは、スクリプト言語やライブラリ、フレームワークなどのパスを通すには「システムのプロパティ」の環境変数のPathの項目で出来ますが、Ubuntuではより簡単にこれらのパスを通すことが出来ます。 「home」フォルダのファイル表示をすべて表示出来るように設定（「表示」→「隠しファイルを表示する」にチェックを入れる）し、「.profile」というファイルがあるので任意のテキストエディタで表示します。以下をファイルに追加して保存します。

◇環境変数にパスを通す方法

・Flex3の場合（ダウンロードしたFlex3のフォルダのある場所を指定してください）::

    export PATH=$PATH:/opt/lampp/htdocs/Website/flex_sdk_3.4/bin
・Pythonのモジュールを通す場合（Pythonに加えたいモジュールのパスを記述してください）::

    PYTHONPATH=/opt/lampp/htdocs/Website/Spider/viper export PYTHONPATH

再ログインするとパスが通っています。

Thunarのコンテキストメニューに各種アクションを追加する
---------------------------------------------------------------------

Thunarは軽量化のために機能を必要最低限に抑えています。しかし、Thunarには「アクション」と呼ばれるコンテキストメニューの機能を追加する仕組みがあります。設定の仕方はGNOMEのメインメニューと同じで名前とコマンドを入力します。Thunarのメニューバーの「アクション設定」、あるいはhomeフォルダにある「.config/Thunar/uca.xml」で機能を追加することが出来ます。

Thunarで自動的にNTFSのドライブをマウントする方法
-----------------------------------------------------------------

Nautilusは半自動的にNTFSのドライブをマウント出来ますが、Thunarはデフォルトでは出来ません。そこで、fstabにマウントしたいドライブを設定して、Ubuntu起動時にマウントさせるようにします。 ドライブの構成を知りたい場合は以下のコマンドを実行してください。::

    $sudo fdisk -l

1.homeフォルダに適当なフォルダを作成します。ここでは「disk_sda3」というフォルダを作ったとします。geditでfstabを開きます。::

    $sudo gedit /etc/fstab

2.fstabに次の行を追加します。マウントしたいドライブをここでは「sda3」とします。::

    /dev/sda3 /home/ユーザー名/disk_sda3 ntfs defaults 0 0

fstabを閉じて、端末で「sudo mount -a」でドライブをマウントさせて、エラーが出なければ成功しています。 homeフォルダにあるdisk_sda3フォルダの中にマウントさせたsda3の中身が表示されます。以後再起動させてもThunarでsda3のドライブの読み書きが出来ます。

dpkg: サブプロセス post-installation script はエラー終了ステータス 1 を返しました」からの復帰方法
--------------------------------------------------------------------------------------------------------------------------

「/var/lib/dpkg/info」ディレクトリの*.postinst、*.preinst、*.prerm、*.postrmを削除すると復帰出来ます。*.deb ファイルを消す必要はありません 。また、UCKなどのリマスターツールでアプリケーションの更新を行うときに、この作業を行わないとLive CDのビルドに失敗したり、HDDインストール時にエラーが出る原因になります。

Ubuntu 10.04 LTSにおけるログイン画面の背景画像変更
------------------------------------------------------------------------

::

    $sudo cp /usr/share/applications/gnome-appearance-properties.desktop /usr/share/gdm/autostart/LoginWindow

ログオフして再ログインするときに、背景画像を変更出来ます。変更したら、ログインし、以下のコマンドでコピーしたgnome-appearance-properties.desktopを消します。::

    $sudo rm /usr/share/gdm/autostart/LoginWindow/gnome-appearance-properties.desktop

Ubuntu 10.04 LTSのスプラッシュ画像を変更する
------------------------------------------------------------

Ubuntu 10.04 LTSからスプラッシュ画面の変更アプリケーションが「Plymouth」に変更されています。画像を変更するだけなら、以下の箇所を変更するだけです。::

    /lib/plymouth/ubuntu-logo.png

/lib/plymouth/themes以下の各テーマのフォルダ内にある「*_logo.png」あるいは「*-logo.png」

Plymouthでオリジナルスプラッシュテーマを作成する
----------------------------------------------------------------

Ubuntuではplymouthに加え、plymouth-x11もインストールします。

1.ベースになるテーマをダウンロード::

    $wget -O /tmp/mytheme.tar.gz http://brej.org/blog/wp-content/uploads/2009/12/mytheme.tar.gz

2.ダウンロードしたテーマをコピー、解凍、インストール::

    $sudo cp -a /tmp/mytheme.tar.gz /usr/share/plymouth/themes/
    $tar xzf /usr/share/plymouth/themes/mytheme.tar.gz
    $sudo update-alternatives --install /lib/plymouth/themes/default.plymouth default.plymouth /lib/plymouth/themes/mytheme/mytheme.plymouth 10

3.テーマの切り替えは以下のコマンドを使います。::

    $sudo update-alternatives --config default.plymouth

mythme.plymouthを選択

4.テストしたい場合は以下のコマンドを使います。::

    $sudo plymouthd --debug --debug-file=/tmp/plymouth-debug-out ; sudo plymouth --show-splash ; for ((I=0;I<10;I++)); do sleep 1 ; plymouth --update=event$I ; done ; sudo plymouth --quit

5.より詳しいPlymouthのカスタマイズ法やPlymouthスクリプトの作成の仕方は以下でまとめられています。

https://wiki.ubuntu.com/Artwork/Documentation/Plymouth

Ubuntu 9.10のスプラッシュ画面を変更する
-------------------------------------------------------

Ubuntu 9.10には2種類のスプラッシュ画面があります。一つはGRUB起動後に表示されるアニメーションスプラッシュの「usplash」、もう一つはログイン画面で表示される「xsplash」です。xsplashの変更は簡単で管理者権限で「/usr/share/images/xsplash」の画像を変更するだけです。サイズは決まっているようなので、元からある画像に合わせて作ってください。usplashの方はやや面倒です。作成方法は以下の通りです。

◇USplash作成方法 1.gcc、libbogl-devをインストール::

    $sudo apt-get install gcc libbogl-dev

2.libusplash-devをインストール::

    $sudo apt-get install libusplash-dev

3.usplash作成用のフォルダを作成::

    $mkdir ~/usplash

4.examplesをコピー::

    $cp -rp /usr/share/doc/libusplash-dev/examples/ ~/usplash/

5. ~/usplash/examplesへ移動::

    $cd ~/usplash/examples

6.examplesには以下のファイルが入っています。::

    ・eft_800_600.png
    ・eft_1024_576.png
    ・eft_1024_576_cropped.png
    ・eft_1024_768.png
    ・eft-theme.c
    ・helvB10.bdf
    ・Makefile
    ・README
    ・throbber_back.png
    ・throbber_fore.png

「eft_*.png」のファイルを変更していきます。GIMPなどを使って同じサイズのPNGファイルを作成します。この時、usplash用に使える画像は「256色のインデックスカラーのPNG」なので、GIMPの画像モードをインデックスカラーモードにして作業する必要があります。つまり、GIFを作るような形でPNGを作ることになります。
「throbber_*.png」はプログレスバーの画像を置きます。ここも任意で変えることが出来るので256色のインデックスカラーのPNGファイルを作成しておいてください。

7.端末で「make」すると、eft-theme.soが完成します。make installでeft-thme.soをインストール出来ます。

8.StartStartUp-Managerをインストール::

    $sudo apt-get install startupmanager

9.StartStartUp-Managerで先ほどのeft-thme.soを指定して再起動すると作成したusplashが起動します。

Ubuntuのパッケージリストの作成と適用
-------------------------------------------------

1.パッケージリストを作成します。::

    $ dpkg --get-selections > packagelist

2.パッケージリストを適用します。::

    # dpkg --set-selections < packagelist
    # apt-get dselect-upgrade

これでクリーンインストールしたときにも楽に以前使っていたアプリケーションをインストール出来ます。

Ubuntuでキーボードの「半角/全角」キーが動作しなくなった時の対処
------------------------------------------------------------------------------------

Ubuntuで設定をいじっていると、たまに「半角/全角」きーが動作しなくなることがあります。その時には以下のように対処すると直ります。
「設定」→「キーボードの設定」の「レイアウト」タブをクリックし、「レイアウトの選択」で「日本語」以外を削除

Wine上で大量のキャラクターを搭載したM.U.G.E.Nが落ちる際の対処法
----------------------------------------------------------------------------------------

Wine上で大量のキャラクターを搭載したM.U.G.E.Nが落ちる事がありますので、その対処法としては以下のように書き換えます。

◇/etc/sysctl.conf::

    fs.file-max = 204708

FirefoxでSilverlightを使う
--------------------------------

Linuxでは、Silverlightプラグインを使えませんが、特殊なパッチが追加されたWindows APIレイヤー「Wine」である「Wine Staging」であれば、Firefox上でSilverlightを使えるようになります。
以下の方法があります。

◇FirefoxにPipelightを導入する

以下のコマンドを端末に入力して実行します。::

    $sudo apt-add-repository ppa:pipelight/stable
    $sudo apt-get update
    $sudo apt-get install pipelight-multi pipelight
    $sudo pipelight-plugin --enable silverlight
    $sudo pipelight-plugin --create-mozilla-plugins
    $pipelight-plugin --system-check
    $sudo pipelight-plugin --enable widevine
    $sudo apt-get install winehq-staging
    $export WINEARCH=win32 winecfg

最後の2行は、Wine StagingをデフォルトのWine環境に設定するものです。これを行なう事でLinux版FirefoxをWindows版のFirefoxのように見せる事ができ、DMMでダウンロード購入したコンテンツの再生やダウンロードが出来るようになります。

MMD/MMDAI/MMDAgentまとめサイト
---------------------------------------------------

http://www6.atwiki.jp/vpvpwiki/pages/187.html

MMDの使い方、モデルデータ作成用のツールの紹介、PMDファイル・Xファイルなどのリンクなどがまとめられています。

http://hkrn.github.io/MMDAI/

LinuxやMac OS Xでネイティブに動作するMMD互換ソフトウェアの配布サイトです。MMDのモデリングデータやモーションデータ、アクセサリデータなどを使うことが可能です。Linuxの場合、Ubuntu 12.04のバイナリが配布されています。その他のディストリビューションの場合はソースコードからビルドすることになります。

http://www.mmdagent.jp/

MMDのキャラクターに話しかけることが出来るソフトウェア。バイナリはWindows版だけ配布されています。UbuntuではPPA経由でバイナリを使うことが出来ます。::

    $sudo su
    #apt-add-repository ppa:irie/mmdagent
    #apt-get update
    #apt-get install mmdagent

MMDAgentを動作させる
---------------------------------

MMDAIで動作する3Dモデルを音声で反応させるように動かすことが出来るソフトウェアです。Ubuntu 12.04ではPPAが公開されています。

1.MMDAgentをインストール::

    $sudo su
    #apt-add-repository ppa:irie/mmdagent
    #apt-get update
    #apt-get upgrade
    #apt-get install mmdagent

2.mdfファイルが動作させる3Dモデルの本体であり、これをMMDAgentで立ち上がるように右クリックメニューを設定しておく

MMDAgentのモデルを初音ミクに変更
-----------------------------------------------

MMDAgentのデフォルトの3Dモデルはメイですが、MMDのモデルなどを使うことが出来るので、初音ミクなどのボーカロイドに変更することが可能です。ここではUbuntu 12.04を使った方法を解説します。

http://sourceforge.net/projects/mmdagent/files/MMDAgent_Example/MMDAgent_Example-1.3.1/MMDAgent_Example-1.3.1.zip/download でサンプルスクリプトをダウンロードします。

このZIPファイルを解凍します。::

    Accesoryフォルダ ー MMDのアクセサリデータを入れます。
    Modelフォルダ ー MMDのモデルデータを入れます。
    Motionフォルダ ー MMDのモーションデータを入れます。
    Voiceフォルダ ー 音声データを入れます。
    MMDAgent_Example.fst ー MMDAgentの設定ファイルです。ここで使いたいMMDモデルなどを指定します。

サンプルスクリプトの「MMDAgent_Example」の名前が付いているファイルを全て「MMDAgent」の名前にリネームします。MMDAgent.fstのファイルをテキストエディタなどで開き、以下のように使いたいMMDモデルがあるファイルを指定します。::

    11 12 MODEL_EVENT_ADD|bootscreen MODEL_ADD|mei|Model\＜使いたいMMDモデルのフォルダ・ファイル名（.pmd)＞|0.0,0.0,-14.0

この変更したサンプルスクリプトフォルダの中身をroot権限で「/etc/MMDAgent」にコピーします。::

    $sudo su
    #cp -a ~/MMDAgent_Example-1.3.1/* /etc/MMDAgent

MMDAgentを起動させるとMMDモデルに変わっています。

MMDAIを動作させる
---------------------------

MMDAIはボーカロイド初音ミクの3Dモデルを踊らせることが出来るソフトウェア「MMD」のデータを使って、MMDと同じようなことを行うことが出来るソフトウェアです。

1.http://hkrn.github.io/MMDAI/でMMDAIをダウンロード

2.https://developer.nvidia.com/cg-toolkit-downloadでNvidia Cg Toolkitをダウンロードし、解凍します。

/usr/libの下にあるsoファイルをMMDAIのフォルダに入れます。

3.MMDAIのフォルダに移動し、ターミナルで以下のコマンドを打って、MMDAIを起動させます。::

    $./MMDAI2

4.MMDAIを起動させたら、新規プロジェクトを作り、「ファイル」→「モデルの追加」でCGモデルを取り込むことが出来ます。

5.「ファイル」→「モーションを全てのモデルに追加」などでモーションデータを取り込む事が出来ます。

GIMP2.6で使えるフラクタル＆アブストラクト系Photoshopブラシ
-----------------------------------------------------------------------------

最近のバージョンのGIMPでは、Photoshopのブラシ(拡張子abr)を直接使用できるようになっています。abrファイルをGIMPがインストールされているフォルダの下にある「share\gimp\2.0\brushes」フォルダ以下に置いて、GIMPを起動させるとPhotoshopのブラシを使用できるようになります。以下のブラシは炎や光などの表現を作り出したい時に便利なブラシです。

http://www.brusheezy.com/brush/442-Rise-Brushes

http://www.brusheezy.com/brush/311-Green-Lotus-Brushes

http://www.brusheezy.com/brush/444-Mystcart-Brushset-IV

http://www.brusheezy.com/brush/445-Mystcart-Brushset-III

http://www.brusheezy.com/brush/389-Inner-Universe-Brushes

http://www.brusheezy.com/brush/248-Winter-Breeze

http://www.brusheezy.com/brush/399-Abstract-Brushset-X

http://www.brusheezy.com/brush/283-50-Ultimate-Fractals

http://www.brusheezy.com/brush/244-Psionic-Storm

http://www.brusheezy.com/brush/247-Trance-Brushes

http://www.brusheezy.com/brush/571-Genisis-Brushes

http://www.brusheezy.com/brush/289-Nova-Equinox

http://www.brusheezy.com/brush/288-S-O-L-E-X-Brushes

http://www.brusheezy.com/brush/287-Odysee-Brushes

http://www.brusheezy.com/brush/279-Stormy-Fractals

http://www.brusheezy.com/brush/246-Universal

http://www.brusheezy.com/brush/243-Maiden-Voyage

http://www.brusheezy.com/brush/242-Radon-Brushes

http://www.brusheezy.com/brush/238-13-Abstract

http://www.brusheezy.com/brush/83-Stardust

GIMP2.4→GIMP2.6へ移行する方法
----------------------------------------------

http://gimp-win.sourceforge.net/stable.html

オープンソースフォトレタッチソフト「GIMP」の安定版「2.6」がリリースされました。ダウンロード、インストールをした後に、2.4で使っていたプ ラグインを2.6の方に移します。2.6に入っていないプラグインだけを入れてください。特にPhotoshop Pluginを使う場合は「2.6」には「pspi.exe」が入っていないので、入れてください。

・プラグインフォルダの場所

「GIMP-2.6\lib\gimp\2.0\plug-ins」

・ブラシ、パターン、グラデーション、Script-Fuのフォルダの場所

「GIMP-2.6\share\gimp\2.0」直下の各フォルダ

ただし、「menus」フォルダにPhotoshopメニュー化用のファイルに上書きすると、2.6のメニューが一部消えてしまうので、ここはまだ触らないようにした方がいいと思います。

PhotoShop Pluginを使うにはGIMP起動後にPhotoshop Pluginフォルダのパスを指定する必要があります。2.4までのGIMPはツールボックスのメニューから設定出来ましたが、2.6からはメイン画面の方に移されています。メイン画面のメニューの「フィルタ」→「Photoshop Plug-in Setting」をクリックし、新規アイコンをクリックし、Photoshoのプラグインのフォルダを指定します。GIMPを再起動すると Photoshop Plugu-Inを使うことが出来るようになります。

2.6からはたくさんのバグ修正と共に新描画システム「GEGL」が一部で使われ、Python-Fuが標準装備されています。

GIMP 2.3.14 + Photoshop-Pluginで無料強力画像生成環境をつくる
--------------------------------------------------------------------------------------

Linux、Windosws、Mac OS XなどのPC用OS上で動作し、豊富なフィルタで写真加工ができるフリーソフトウェア「GIMP」（http://www.gimp.org/）。 Script-Fuと呼ばれるSchemeベースのスクリプト言語で書かれたプログラムで機能拡張できる。あるいは、世界中で配布されているGIMPプラグインを使うことで、標準装備されていない機能 を追加することができる。もうひとつのGIMPの拡張機能として、「pspi」 （http://www.gimp.org/~tml/gimp/win32/pspi.html）というGIMPプラグインを使うことで、Photoshop-Plug-Inをも使用することができる。日本語版のプラグインには対応していないが、海外製のものは配布・販売されているものに関わらず、使用できる。ここでは、フリーで使用できる非常に強力なプラグインを紹介する。

１．pspiをGIMPにインストールする。

http://www.gimp.org/~tml/gimp/win32/pspi.htmlからpspiをダウンロード、解凍し、「pspi.exe」を\GIMP-2.3.14\lib\gimp\2.0\plug-insへ手動でインストール する。GIMP本体→拡張→PhotoshopPlug-inを選び、一番左側のアイコンで新規プラグインを設定する。「OK」をクリックするとプラグインを使用できるようになる。

２．プラグイン「RedFieldPlugin」http://www.redfieldplugins.com/ds.htDownloam

様々な波紋を作ることのできる「Water Ripples」、パターンを組み合わせて幾何学的な画像の変換ができる「Lattice Composer」「Jama 3D」など非常に強力なフィルタを追加できる。GIMP標準のフィルタよりも綺麗な仕上がりを期待できる。

3.プラグイン「Harry's Filters」（ http://thepluginsite.com/products/harrysfilters/index.htm ）

自動で69ものパターンをつくる「VideoRave」が強力なフィルタプラグイン。GIMPのグラデーションや下塗りフィルタでは表現できない「下地」作りに適する。

GIMP2.4のドックを本体に格納する
-------------------------------------------

オープンソースウェア「GIMP2.4」は、使っているうちにウィンドウがたくさん散らばってしまいがちです。作業ウィンドウを除くウィンドウをGIMP本体にまとめてしまうと、非常に快適な環境が出来ます。

GIMP本体→「ファイル」→「ウィンドウ」→「新規ドック作成」→「レイヤー・チャンネルとパス」「ブラシ・パターンとグラデーション」「その他いろいろ」のドックを表示します。各ドックのタブになっているアイコンをドラッグ&ドロップでGIMP本体のドックに移動させると、ドックがGIMP本体に格納されます。

また、「ファイル」→「ウィンドウ」→「ツールアイコン」ではGIMP本体のアイコンを表示・非表示させることが出来ます。デフォルトでは表示されていないものもあるので、ここで設定しておくとGIMP本体だけでほぼ全ての作業が出来るようになります。

inkscapeでJPEGなどの画像ファイルをSVGへ変換する
------------------------------------------------------------------

http://www.inkscape.org/

Illustlatorライクな高機能ベクタグラフィックソフト「Inkscape」。GIMP同様、GTKをベースにしたマルチプラットフォームフリー ウェアです。基本機能はIllustlator並の機能を持ってますので、Illustlatorを買うお金が貯まるまでのつなぎとしても便利かもしれま せん。本来は絵を描くためのソフトですが、Webサイトを構築する人にも便利な機能があります。それは、「JPEGなどの画像ファイルをSVGとして保 存」できることです。

1．「ファイル」→「インポート」でSVGにしたい画像ファイルをInkscapeへインポートします。

2．「ファイル」→「ドキュメント設定」でカスタムページの囲みの中の「ページを選択オブジェクトにフィット」ボタンをクリックすると、ドキュメントのサ イズが自動的にインポートした画像ファイルサイズに調整されます。

3．「エフェクト」→「画像」→「すべての画像を埋め込む」で画像ファイルを統合します。

4．「ファイル」→「保存」でSVGで保存できます。

InkscapeによるSVG変換ではファイルのデータ容量が少し大きくなります。SVGのデメリットは対応ブラウザかプラグインを使わなければ見るこ とが出来ないことです。しかし、これもFirefoxやOperaなどでは対応していて、IEでもAdobeのSVGプラグインを使えば閲覧することが出 来ます。ブラウザを限定すれば、InkscapeによるSVG変換は使える方法だと思います。また、SVGはXMLをベースにしたベクタグラフィック フォーマットです。よって、Java Scriptと併用すれば、さらに用途は広がると思います。

OSをUNetbootinでLiveUSBを作って運用する(BIOS、UEFIモード対応）
--------------------------------------------------------------------------------------

https://wiki.ubuntulinux.jp/UbuntuTips/Install/CreateSeparateHomePartition

最近ではSSDにOSを入れて、データをHDDに入れて運用するPCの構成が一般的になってきましたが、 UbuntuとUSBメモリを使って、より低価格でシステムを運用する方法です。

・Live USBを作る為の容量は16GB程度で構いません。

Live USB部分は、Squash FSで高圧縮していますので、Linuxディストリビューションをフルインストールするより容量が少なくて済みます。

USBメモリのパーティションをGpartedなどのツールで分けます。

Live USB部分は、使うOSのISO容量以上を確保し、その他に、運用時に変更点を保存する領域であるcasper-rwとhome-rwのラベル名を持った２つのパーティションを作ります。

casper-rwとhome-rwのファイルシステムは、ext4などLinuxでデフォルトで使われているファイルシステムでフォーマットしてください。

casper-rwは、システム部分の変更を保存します。

home-rwは、ユーザーディレクトリの変更を保存する仕組みになっています。

・LIve USB化したいLinuxディストリビューションをダウンロードして、 UNetbootin(http://unetbootin.sourceforge.net/)を使って、 UbuntuのLiveUSBを用意します。UNetbootinは、Windows版やLinux版などがありますので、LiveUSBが作りやすいです。

・Live USB化したUSBメモリをPCに接続します。

・Live USBの/boot/grub/grub.cfgは、Live USBのメニューです。

「linux	/casper/vmlinuz.efi file=/cdrom/preseed/ubuntu.seed boot=casper persistent -- debian-installer/language=ja keyboard-configuration/layoutcode?=jp keyboard-configuration/modelcode?=jp106」というように persistentオプションを追加する事で、Live USBメモリはPersistenceモードとして起動でき、casper-rwやhome-rwに変更点を保存出来ます。

Persistenceモードで動作させるLIve USBは、USBメモリにフルインストールするよりも高速にアクセス出来ますので、快適に使えます。

以下のような使い方も出来ます。

・homeフォルダに他のパーティション（ext4,ext3などでフォーマットしたもの）にあるフォルダのシンボリックリンクを作成しておきます。
このようにする事で、他のストレージにバックアップしたデータを使いたい時に使う事が出来ます。

さらに発展させたバージョンはDropboxと同期させることです。

・Dropboxが使える状態にする

・homeフォルダに出来たDropboxフォルダの中に同期させたいものをまとめておきます。ここではhome_backupフォルダを作成し、この中に.mozillaなどのフォルダを入れておきます。

・後はこれらのシンボリックリンクを作成すれば、設定を引き継ぐことが出来ます。バックアップはDropboxとつながっている限りDropboxがバックアップしてくれます。あまりにも大きいファイルがある場合はHDDからシンボリックリンクを引っ張ってくればいいと思います。homeフォルダの中はリンクだらけになります(^_^;)が、結構便利です。

USBメモリへのアクセスを減らす有効な方法はRAMディスクを使うことです。RAMディスクはHDDにアクセスするよりも速いというメリットと同時に、電源を切るとデータが消えるというデメリットがあります。対策としては、キャッシュだけを置く方法と「/etc/init.d/umountfs」を利用してRAMからバックアップ先に書き込む方法がありますが、個人的にはキュッシュだけを置く方法がおすすめです。

tmpfs RAMディスクにしたいディレクトリ名 tmpfs defaults 0 0

/tmpをtmpfsに載せて、.cache,.thumbnailにシンボリックリンクを作成して、Firefoxのキャッシュもtmpfsに載せています。::

 $ln -s /tmp /home/user_name/.cache
 $ln -s /tmp /home/user_name/.thumbnail
Firefoxのキャッシュの設定はuser.jsを使っています。::

 user_pref("browser.cache.disk.parent_directory","/tmp");
　すでに複数の同じ名前のユーザーディレクトリがあるとすると、/etc/fstabの編集して再起動するだけでhomeディレクトリを変更することが出来ます。 変更したいhomeフォルダのあるパーティションを/dev/sda2とすると、/etc/fstabに以下のように付け加えます。::

 UUID=79110aad-f5fd-4fa5-9399-76979d650a58	/home	ext4	defaults	0	0
　UUIDの調べ方は以下のコマンドを使います。::

 sudo blkid /dev/sda2

GRUB2+ISO+Persistence機能で構成したLinuxシステム(BIOSモード対応)
-------------------------------------------------------------------------------------------

　Linuxをハードディスクにフルインストールせずに使う方法にLiveCDやLiveUSBという方法があります。USBメモリにフルインストールすれば、HDDやSSDにインストールするのと変わりませんが、LiveUSBはGRUB2やSyslinuxからISOを直接起動させることが出来るのでシステムの入れ替えはISOを入れ替えるだけで済むというメリットもあります。そこでUSBメモリでLinuxを運用する場合、「GRUB2+ISO+Persistence機能」の方がフルインストールよりもスマートなシステムを作ることが出来ます。

1.3つのパーティションを作成します。
　・FAT32でフォーマットし、GRUB2とLiveCDのISOを入れるパーティション

　・ext2/3/4でフォーマットし、ラベルを「casper-rw」とし、Persistence機能で読み書きするパーティション

　・ext2/3/4でフォーマットし、ラベルを「home-rw」とし、homeディレクトリとして使うパーティション

2.FAT32でフォーマットしたパーティションにGRUB2をインストールします。

　mountコマンドやGpartedを使ったり、デバイスをマウントした状態でファイルマネージャーで/mediaディレクトリを確認することでパーティションのデバイスファイル名を調べることが出来ます。

ここでは、マウントしたUSBメモリを「/dev/sdb」、そのデバイスファイル名を「/media/919B-EF43」としておきます。::

 sudo grub-install --no-floppy --root-directory=/media/919B-EF43 /dev/sdb
./boot/grubにgrub.cfgを作成します。これはGRUBのブートメニューの各項目を設定するものです。 LinuxディストリビューションのISOを「linux.iso」とします。

Ubuntu/Debian系ディストリビューションの場合
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
::

 menuentry "linux.iso" {
 loopback loop (hd0,1)/iso/linux.iso
 linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=/iso/linux.iso persistent --
 initrd (loop)/casper/initrd.lz
 }

3.FAT32のパーティションにisoフォルダを新規作成し、linux.isoを入れます。

4.PCを再起動させて、BIOSでUSBメモリを第一ドライブに指定してPCを再起動

5.GRUB2経由でlinux.isoをLiveCDとして起動させることが出来ます。出来無い場合はGURB2のインストール方法、grub.cfgの項目の書き方が間違っていないか確認してください。

6.Persistence機能が有効になっているLiveCDはcasper-rwやhome-rwのラベル名のパーティションにユーザーが変更したり、書き込んだりした内容が記憶出来るようになります。casper-rwのパーティションの構成はLinuxディストリビューションの「　/　」以下の構成と同じです。home-rwのパーティションはhomeディレクトリそのものです。

　「GRUB2+ISO+Persistence機能で構成したLinuxシステム」の利点は、「使い勝手はHDDフルインストールしたシステムに非常に近く、ISOの入れ替えだけで新しいシステムを作ることが出来る」ということです。Ubuntuにはたくさんのフレーバーがあるので、複数のフレーバーのISOを入れておけば、様々なフレーバーを手軽に試すことが出来るようになります。


GRUBを使ったUbuntu/Puppy Linux/FedraトリプルブートLiveUSBの作成方法
-------------------------------------------------------------------------------------------------

　USBメモリに入れたUbuntuのLiveCDのISOに直接アクセスして起動させるには、GRUBをインストール設定するだけで出来ます。

1.USBメモリに入れる場合は、USBメモリをFAT32でフォーマットしてください。Windowsを使ってもいいですし、Gpartedを使っても構いません。ターミナルを使う場合は以下のようになります(USBメモリが/dev/sdbとしてマウントされている場合)::

 sudo fdisk /dev/sdb
 sudo makedosfs -F 32 /dev/sdb1
2.パーティションを作成します。ここでは以下の構成にしています。

/dev/sdb1 - GRUB用(FAT32)

/dev/sdb2 - Ubuntu/Debian系ディストリビューション用(FAT32)

/dev/sdb3 - Puppy Linux用(FAT32)

/dev/sdb4 - Fedra用（ext3/ext4)

3.USBメモリにGRUBをインストールします。::

 sudo mkdir /mnt/sdb1
 sudo mount /dev/sdb1 /mnt/sdb1
 sudo grub-install --no-floppy --root-directory=/mnt/sdb1 /dev/sdb

4./dev/sdb2にUbuntu/Debian系のディストリビューションを入れます。ISOをそのまま入れることが出来ますし、UNetBootInを使ってインストールすることも出来ます。(ここではvalkyrie-spec2.5.isoとします）。

5./boot/grubにgrub.cfgを作成します。これはGRUBのブートメニューの各項目を設定するものです。

◇Ubuntu/Debian系ディストリビューションの場合::

 menuentry "valkyrie-spec2.5.iso" {
 loopback loop (hd0,2)/boot/iso/valkyrie-spec2.5.iso
 linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=/boot/iso/valkyrie-spec2.5.iso noeject noprompt quiet splash --
 initrd (loop)/casper/initrd.lz
 }

UNetBootInでインストールしている場合はchainloaderでsyslinuxと接続することが出来ます。::

 menuentry "valkyrie-spec2.5" {
 set root=(hd0,2)
 chainloader +1
 }

◇Puppy Linuxの場合

/dev/sdb3にPuppyのISOの内容をコピーします。::

 menuentry "puppy-4.31" {
 set root=(hd0,3)
 linux /vmlinuz
 initrd /initrd.gz
 }
◇Fedraの場合

/dev/sdb4にFedraのISOの内容をコピーします。

UUIDはblkidコマンドで調べてください。 ::

 menuentry "Fedra 15" {
 set root=(hd0,4)
 linux /isolinux/vmlinuz0 root=live:UUID=2f0cd3e5-7279-4b8a-af9f-ca89b19a84c2
 rootfstype=auto ro liveimg
 initrd /isolinux/initrd0.img
 }

シャットダウンや再起動の項目を追加したい場合は以下のようにします。::

 menuentry "Reboot"{
 reboot
 }
 menuentry "Shutdown"{
 halt
 }

これで再起動させてUSBメモリからブートさせれば、GRUBメニューが現れ、該当する項目を選べば、ISOを起動させることが出来ます。

isoディレクトリに複数のLiveCDを入れておき、grub.cfgの項目を増やしていけば、マルチブート可能なUSBメモリが出来ます。

6./mnt/sdb1をアンマウントする::

 sudo umount /mnt/sdb1

7.Gpartedなどで/dev/sdb2のラベル編集でbootのチェックを外します。bootにチェックが入っていると、/dev/sdb2のUNetBootinでインストールしたUbuntuが起動してしまうからです。

RAMキャッシュの設定方法
---------------------------------

Chromium系ブラウザにおけるRAMキャッシュの設定方法は以下のようになります。

ここではChromiumベースのブラウザ「SRWare Iron」を使っています。他のChromium系ブラウザでも設定方法は基本的に同じです。::

    ◇Windowsの場合
    ・ショートカットを右クリック→プロパティを開く
    ・リンク先を「C:\Program Files\SRWare Iron\iron.exe --disk-cache-dir="◯:\Chromium Disk Cache"」(◯はRAMディスクのドライブレター）とする。
    ◇LinuxなどのUNIX系OSの場合
    ・/usr/share/applicationsなどにあるSRWare Iron.desktopファイルをテキストエディタ（ユーザーディレクトリ以外にあるファイルはroot権限で開く）で開く。
    ・execの箇所に「iron --disk-cache-dir="/tmp"」（tmpfsを/tmpに設定している場合）と記述する

Firefoxのプルダウンメニューの項目が消えた場合の対処法
------------------------------------------------------------------------

Firefoxのプルダウンメニューの項目の文字が消えることがあります。これはシステム側のデフォルトフォント設定とFirefoxのフォント設定が競合しているからです。対処するには、Linuxの場合「.gtkrc-2.0」ファイルをテキストエディタで開き、フォントに関する設定を削除して保存することで対処することが出来ます。

Firefox,Google Chrome,Internet Exploror,Operaなどのブックマークを同期出来るサービス「XMarks」
-------------------------------------------------------------------------------------------------------------------------------

    `Xmarks <http://www.xmarks.com/>`_

複数のブラウザのブックマークや履歴を同期・バックアップ出来るクラウドサービスです。Xmarksでアカウントを取得後、各ブラウザにアドオンやエクステンションを追加することで同期出来るようになります。

Firefoxをソースコードからビルドして、debパッケージを作成、インストールする方法
---------------------------------------------------------------------------------------------------

::

    1.$sudo add-apt-repository ppa:mozillateam/firefox-stable && sudo apt-get update
    2.$apt-get source firefox
    3.ダウンロードしたファイルを解凍
    4.出来たフォルダの下にDebianフォルダがあるので移動
    5.Firefox,debパッケージに必要なツールをインストール
        $sudo apt-get build-dep firefox
    6.changelogでバージョン名を変更することが可能。mozconfigのテンプレートはmozconfig.iniなので、Firefoxのビルドコンフィグを変更したい場合はここにオプションを記述します。
    7.ビルドします。ユーザーディレクトリにdebファイルが大量に出来ます。
        $sudo su
        #debuild -us -uc
    8.debファイルを全て新規フォルダを作成して移動し、インストールすれば完成です。
        $sudo dpkg -i *.deb

Firefox 3.6 高速化　user.js
------------------------------------

::

    user_pref("general.useragent.extra.firefox","Firefox/3.6.10");
    user_pref("browser.cache.disk.parent_directory","/mnt/ramdisk");
    user_pref("browser.cache.disk.enable",false);
    user_pref("browser.cache.memory.enable",true);
    user_pref("browser.cache.memory.capacity",1024);
    user_pref("browser.cache.disk_cache_ssl",true);
    user_pref("browser.sessionhistory.max_total_viewers",0);
    user_pref("browser.tabs.showSingleWindowModePrefs",true);
    user_pref("browser.history_expire_days",7);
    user_pref("browser.history_expire_days_min",7);
    user_pref("browser.history_expire_sites",5);
    user_pref("browser.xul.error_pages.enabled",true);
    user_pref("content.interrupt.parsing",true);
    user_pref("content.max.tokenizing.time",3000000);
    user_pref("content.notify.interval",750000);
    user_pref("content.notify.ontimer",true);
    user_pref("content.maxtextrun",8191);
    user_pref("content.switch.threshold",100000);
    user_pref("config.trim_on_minimize",true);
    user_pref("content.notify.backoffcount",5);
    user_pref("javascript.options.jit.chrome",true);
    user_pref("javascript.options.jit.content",true);
    user_pref("network.http.pipelining",true);
    user_pref("network.http.pipelining.firstrequest",true);
    user_pref("network.http.pipelining.maxrequests",8);
    user_pref("network.http.proxy.pipelining",true);
    user_pref("network.http.max-connections",32);
    user_pref("network.http.max-connections-per-server",8);
    user_pref("network.http.max-persistent-connections-per-proxy",8);
    user_pref("network.http.max-persistent-connections-per-server",4);
    user_pref("network.http.request.timeout",300);
    user_pref("network.dns.disableIPv6",true);
    user_pref("nglayout.initialpaint.delay",0);
    user_pref("plugin.expose_full_path",true);
    user_pref("singed.applets.codebase_principal_support",true);
    user_pref("ui.submenuDelay",0);

Ubuntuの場合、user.jsを「/home/ユーザー/.mozilla/firefox/xxxxxxxx.default」に移動させ、Firefoxを起動させれば、高速化されます。

64bit版Ubuntu 9.10用のFirefoxを最適化ビルドする
-----------------------------------------------------------------

　64bit版Ubuntu 9.10用にFirefoxをプロセッサやOSに最適化してビルドします。

1.Mozilla FirefoxソースでFirefoxのソースをダウンロードし、homeフォルダに解凍すると、「mozilla-バージョン名」といったフォルダが出来ます。ここでは「mozilla-1.9.2」としておきます。

2.mozilla-1.9.2フォルダに移動し、「.mozconfig」というファイルを作成します。.mozconfigの詳細はMDCにあります。僕の.mozconfigの設定は以下のようになっています。::

    . ~/mozilla-xxx/browser/config/mozconfig
    mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/firefox_build
     ac_add_options --enable-optimaize="-O3 -msse3 -m3dnow -m64"

これで64bitかつSSE3、3D NOW!を利用した最適化が行われ、通常のFirefoxよりも描画が速くなります。「ac_add_options --enable-optimaize」はgccの最適化オプションに準拠しているので、gccのビルドオプションを参考にするといいでしょう。

3.「make -f client.mk build」を実行するとMakeファイルを自動的に作り、makeしてくれます。configure時にエラーが出たら、ビルドに必要なツールが足りないということなので、メッセージに合わせて随時ツールをインストールしてください。ITMEDIAに必要なツールの一覧があるので参考にしてください。ビルドにはしばらく時間がかかります。Phenom II X3 720 BEマシンで15分くらいかかりました。

4.完成したFirefoxは「mozilla-1.9.2/firefox_build/dist/bin」の中にあります。パッケージしたい場合は「firefox_build/browser/installer」へ移動し、「make」すると先ほどのdistフォルダに言語パックと共に生成されています。

FirefoxのデータベースをVACUUMして動作を軽くする
------------------------------------------------------------------

Firefoxは各種データベースをSQLiteで管理しています。使い続けると、「places.sqlite」が肥大化し、Firefoxの動作が緩慢になる原因になります。SQLiteには「VACUUM」というデータベースを最適化する方法があります。これを使うことでFirefoxのデータベースを最適化することが出来ます。

◇コマンド編

1.「ツール」⇒「エラーコンソール」を開きます

2.コード欄に以下を記述します::

    Components.classes["@mozilla.org/browser/nav-history-service;1"].getService(Components.interfaces.nsPIPlacesDatabase)

3.「コードを評価する」ボタンをクリックするか、Enterキーを押すとVACUUMを開始します。以下のメッセージが出たら、成功です。::

    [xpconnect wrapped (nsISupports, nsINavHistoryService, nsIGlobalHistory3, nsIGlobalHistory2, nsIDownloadHistory, nsIBrowserHistory, nsIBrowserHistory_MOZILLA_1_9_1_ADDITIONS, nsPIPlacesDatabase)]

◇アドオン編

以下のアドオンでも同様のことが出来ます。

・Vacuum Places

・SQLite Optimizer 0.6

・PlacesCleaner

Firefox3のブックマークデータをWebサイトに埋め込む方法
-----------------------------------------------------------------------

Firefox3のブックマークはJSONで保存することが出来ます。つまり、スクリプト言語やJSONパーサなどを使えば、ブックマークのデータをWebサイトに埋め込むことが出来ます。一番簡単にブックマークデータにアクセスする方法はJavaScriptを使うことです。

1.Firefox3のブックマークJSONファイルに「var bookmarks = 」を追加し、HTMLのscriptエレメントでロードする

2.「bookmarks.children[0].children[0].children[0].title;」などとすると、ブックマークの対象のサイトのタイトルを取得することが出来ます。これをinnerHTMLなどでHTMLに取り込むとサイトに表示出来る様になります。

もっと安全にJSONを取得したい場合はJSONパーサを使うのですが、同一ドメインで使うだけなら、上記の方法で十分でしょう。ちなみにJSONPにしたい場合は元のブックマークデータをコールバック関数で括って、読み込む際にコールバック関数を定義して、scriptエレメントでブックマークデータを読み込んでください。

◇JSONデータをWebサイトに埋め込む関数の例

::

    function importFirefoxBookmarks(id,x,y){
	      var bm_root = bookmarks.children[0];
	      var bma = [];
	      for(var i=2;i<20;i++){
		        bma.push(bm_root.children[i]);
	      }
	      var bmb = [];
	      for(var i=0;i<bma[x].children.length;i++){
		        bmb.push(bma[x].children[i]);
	      }
	      var bmc = [];
	      for(var i=0;i<bmb[y].children.length;i++){
		        bmc.push(bmb[y].children[i]);
	      }
	      for(var i=0;i<bmc.length;i++){
		        document.getElementById(id).innerHTML += bmc[i].title + "<br />"
				 + '<a href="' + bmc[i].uri + '" target="_blank">' + bmc[i].uri + '</a><br />';
	     }
    }

Webサイトやブログの表示速度を向上させる
--------------------------------------------------------

Webサイトやブログなどを公開している企業や個人は多いですが、最近、運営しているWebサイトやブログの表示が重いと感じる事があるのではないでしょうか。アフィリエイトサービスを使う事で、個人サイトでも企業やマスコミなどと似たような広告収入を得られる機会が増加している為、ASPと契約をしてネット広告をサイトやブログに貼っている人々は多いです。また、動画共有サイトで気になった動画を見つけたり、自分で投稿した動画を紹介したりする場合には、埋め込みコードを記事に貼り付けて投稿する事があるでしょう。

サイトやブログの表示が重くなる原因は、テキストよりも容量が遥かに大きい画像や動画をたくさん貼り付けるからです。アクセスしてきた人は、そのページに貼られている動画の埋め込みコードなどを通して動画や画像を全て読み込む形になってしまいます。その為、同時に複数のトランザクションが発生してネット回線をそれぞれの処理で分けあってしまう為、ページの表示が遅くなってしまいます。近年のネット広告は、Flashベースの物以外に画像とJavaScriptの組み合せで出来ている物、動画を再生する物などがあります。これらがたくさん貼り付けられていれば、サーバへの問い合わせが多くなってしまいます。

このような状況を簡単に解決する方法としては、画像や動画の数を減らし、代わりにそれらがある場所のリンクを掲載しておくというものです。特にYouTubeやDailyMotionなどの動画共有サイトやInstagramなどの写真投稿サイトの写真や動画をブログ記事に掲載したい時に効果的です。
ASPが提供するアフィリエイトプログラムの中には、テキストリンクを使えるようになっている事があります。バナー広告は派手に宣伝するのに便利ですが、画像や動画が使われていたり、自動的に広告を表示するようにスクリプトが組まれていたりしますので、どうしてもページが重くなる原因になります。テキスト広告は工夫をすれば、文言を変えずに宣伝する事が可能です。

画像コンテンツや動画コンテンツをリンクに変更する際には、それがどのような内容のリンクであるのかを明示しておきますと、アクセスしてきたユーザーは理解してコンテンツを見る事が出来ます。どうしても表現しにくい場合には、画像や動画を使えば効果的でしょう。

◇サイトやブログの表示高速化

・ブログパーツを減らす。

・アフィリエイト広告をテキスト広告に変更する。

・動画共有サイトや写真投稿サイトなどで気になった物を見つけた場合は、分かりやすいようにテキストを考えて、画像や動画を減らす。

・JavaScriptはBody要素の最下部に設置すると、ブロックされずにページが表示される。

・CSSは、head要素の中に記述する。

・JavaScriptやCSSは、外部ファイル化してページから呼び出す。

・HTMLで構築したページの要素が過剰に入れ子にならないように気をつける。

Ubuntu系Linuxディストリビューション向けの音質向上テクニックのまとめ
------------------------------------------------------------------------------------------

◇Ubuntu系情報

https://wiki.ubuntulinux.jp/UbuntuStudioTips

https://wiki.ubuntulinux.jp/UbuntuStudioTips/Application/JACK-PulseAudio

http://web1.kcn.jp/haruem/Ubuntu_audio_OS.html

`ＵｂｕｎｔｕでＪＡＣＫとＰｕｌｓｅＡｕｄｉｏを同時に使う <http://oka-ats.blogspot.jp/2016/02/oka01-rxqbidhqglvaownc.html>`_

`最強の Linux サウンドシステム (多分) <http://lugia.hatenablog.com/entry/20120422/1335099252>`_
`ALSA の設定ファイル .asoundrc の解説（和訳） <http://wikiwiki.jp/tetsuya/?asoundrc>`_

◇ArchLinux系情報

https://wiki.archlinuxjp.org/index.php/JACK_Audio_Connection_Kit

`PulseAudioトラブルシューティング <https://wiki.archlinuxjp.org/index.php/PulseAudio/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0>`_

`プロオーディオ <https://wiki.archlinuxjp.org/index.php/%E3%83%97%E3%83%AD%E3%82%AA%E3%83%BC%E3%83%87%E3%82%A3%E3%82%AA>`_

コマンドでJackとPulseの連携は出来るようになっていますが、ALSAを直接使うアプリケーションではまだ音が出ていません。

Qjackctlで予めpulseaudio-module-jackの設定を行っておきます。::

    $sudo apt-get install pulseaudio-module-jack

Qjackctlの「Setup...」→「Options」→「Execute script after Startup」に以下のコマンドを記述する。::

pactl set-default-sink jack_out

Ubuntu 16.04 LTS以降であれば、PulseAudioのdefault.daにモジュールを追加する記述は不要です。これを入れるとPulseAudioとJack共に起動後何秒かして落ちました。

この状態でPulseAudio起動状態で、Qjackctlを起動すれば、PulseAudioとJackとALSAが併用出来るようになります。

Qjackctlの代わりに、jack_cotrolを使えば、D-Bus経由でPulseAudioとの連携が出来ますが、ALSAを直接使うソフトウェアではALSAが使えなくなってしまいます。また、.asoundrcを使った場合、Ubuntu 16.04 LTS以降ではPulseAudioやALSAでの再生が出来ませんでした。

jack_controlを使ったコマンド例は以下の通りです。ALSAを直接利用するアプリケーションを使わなければ、これでもJackとPulseAudioの連携は可能です。自動起動するようにしておくと良いでしょう。::

    (sleep 5s && jack_control start && sudo schedtool -R -p 20 `pidof jackdbus`&& jack_control eps realtime true && jack_control ds alsa && jack_control dps device hw:0 && jack_control dps rate 44100 && jack_control dps nperiods 2 && jack_control dps period 64 && sleep 5s && /usr/bin/a2jmidid -e && sleep 5 && pactl load-module module-jack-sink channels=2 && pactl load-module module-jack-source channels=2 &&  sleep 3s && pacmd set-default-sink jack_out && pacmd set-default-source jack_in && sleep 3s && jack_wait -w && sleep 1s) &


◇amixerの設定コマンド::

    ミュートの切り替え
    amixer sset Master on
    amixer sset Master off

    音量変更
    amixer sset Master 10%+
    amixer sset Master 10%-
    amixer sset Master 60%

    現在の音量の取得

    amixer sget Master | egrep '\[.*%\]

xmonad用設定ファイル
---------------------------------

レイアウトは、ミラー＋タイルの構成がメインになっていて、マスターウィンドウを２つに分割し、ウィンドウが水平方向にレイアウトされるように設定しています。
mod+スペースの切り替えでタブ型のレイアウトに変更することができ、タブ型レイアウトはフルスクリーンレイアウトより利便性が高く、便利です。

◇xmonad.hs

::

 import XMonad
 import Data.Monoid
 import System.Exit
 import qualified XMonad.StackSet as W
 import qualified Data.Map        as M
 import XMonad.Config.Gnome
 import System.IO
 import XMonad.Actions.WithAll
 import XMonad.Actions.CycleWS
 import XMonad.Actions.Volume
 import XMonad.Hooks.ManageDocks
 import XMonad.Hooks.ManageHelpers
 import XMonad.Hooks.EwmhDesktops
 import XMonad.Hooks.UrgencyHook
 import XMonad.Hooks.SetWMName
 import XMonad.Hooks.FadeInactive
 import XMonad.Layout.LayoutHints
 import XMonad.Layout.ResizableTile
 import XMonad.Layout.ToggleLayouts
 import XMonad.Layout.Spiral
 import XMonad.Layout.DragPane
 import XMonad.Layout.Circle
 import XMonad.Layout.Cross
 import XMonad.Layout.Grid
 import XMonad.Layout.Magnifier
 import XMonad.Layout.ThreeColumns
 import XMonad.Layout.Accordion
 import XMonad.Layout.StackTile
 import XMonad.Layout.Spacing
 import XMonad.Layout.OneBig
 import XMonad.Layout.Tabbed
 import XMonad.Util.EZConfig
 import XMonad.Config.Desktop(desktopLayoutModifiers)
 import XMonad.Layout.Named
 import XMonad.Util.Run(spawnPipe)
 import XMonad.Actions.CopyWindow
 import Control.Monad (liftM2)
 import XMonad.Hooks.DynamicLog

 myFocusFollowsMouse :: Bool
 myFocusFollowsMouse = True
 myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "kupfer")
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,		       xK_b	  ), sendMessage ToggleStruts)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm              , xK_f     ), spawn "killall -USR1 fbpanel")
    , ((modm              , xK_g    ), spawn "pkill tint2 &amp;&amp; tint2")
    , ((modm,xK_F8),lowerVolume 3 &gt;&gt; return())
    , ((modm,xK_F9),raiseVolume 3 &gt;&gt;return())
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) &lt;- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) &lt;- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc &gt;&gt;= flip whenJust (windows . f))
        | (key, sc) &lt;- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) &lt;- [(W.view, 0), (W.shift, shiftMask)]]
 myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [((modm, button1), (\w -&gt; focus w &gt;&gt; windows W.swapMaster))
     ,((modm .|. shiftMask, button1), (\w -&gt; focus w &gt;&gt; kill))
    ]
 myLayout = desktopLayoutModifiers(mirtiled ||| tab)
 where
     full = Full
     tiled   = spacing 3 $ Tall nmaster delta ratio
     mirtiled   = spacing 3 $ Mirror(Tall nmaster delta ratio)
     tab = tabbed shrinkText defaultTheme
     threec = ThreeColMid nmaster delta ratio
     st = StackTile nmaster delta ratio
     cross = simpleCross
     nmaster = 2
     ratio   = 5/7
     delta   = 3/100
 myManageHook = composeAll
    [ className =? "Filezilla" --&gt; viewShift "6"
    ]
  where viewShift = doF . liftM2 (.) W.greedyView W.shift
 main = do
	xmproc &lt;- spawnPipe "xmobar ~/.xmobarrc"
	xmproc &lt;- spawnPipe "/opt/start_applications"
	xmonad  $ gnomeConfig
		{ terminal          = "xfce4-terminal"
       	,focusFollowsMouse  = myFocusFollowsMouse
       	,borderWidth        = 2
       	,modMask            = mod4Mask
       	,workspaces         = ["1","2","3","4","5","6"]
       	,normalBorderColor  = "#cdcdcd"
       	,focusedBorderColor = "#0000f0"
       	,keys               = myKeys
       	,mouseBindings      = myMouseBindings
       	,handleEventHook    = mempty
	 ,layoutHook = myLayout
       	,manageHook = manageDocks &lt;+&gt; myManageHook &lt;+&gt; manageHook gnomeConfig
       	,logHook = do
		       logHook gnomeConfig
    		}

Seesaa BLOGのソーシャルボタンが邪魔という人に適した設定方法
---------------------------------------------------------------------------------

最近のブログサービスは、ソーシャルボタンという物凄く要らない機能が搭載されています。

Seesaa BLOGにもデフォルトでTwitterやFacebookなどのSNS向けのソーシャルボタンが搭載されており、この画像を読み込むだけでも、余計にデータの送受信をしています。

そこで、このソーシャルボタンを消してしまいましょう。

Seesaa BLOGの管理画面の左のメニューの「設定」をクリックします。

次に詳細設定にある「ソーシャルボタン」という項目をクリックしますと、色々なSNSにチェックが付いているので、これを全て外し、保存します。

これだけで、鬱陶しいソーシャルボタンを一掃出来ました。

他のブログサービスにも、このような設定があると思いますので、「ソーシャルボタンは邪魔」という人々は、これらを排除すると良いです。

シェルスクリプトで知っておくと良い事
-----------------------------------------------

◎常にカレントディレクトリに設定する方法

スクリプトの最初に以下を書いておく。::

    dirname `$0`

$0は、実行しているスクリプト名を返し、dirnameはディレクトリ名を返します。

◎シェルスクリプトを実行ファイルに変更するコマンド

Linuxディストリビューションの中にはデフォルトでシェルスクリプトをクリックするとテキストエディタで中身が表示されるようになっています。

Windows実行ファイルのように、クリックでアプリケーションを動作させたいのであれば、shcというシェルスクリプトを実行可能なファイルにコンパイルする仕組みを活用します。

Ubuntuの場合は、以下のコマンドでインストール出来ます。::

    $sudo apt-get install shc

変換したいシェルスクリプトのファイル名が「xxx.sh」とすると、以下のコマンドでコンパイル出来ます。::

    $shc -v -r -T -f xxx.sh

xxx.xというのが実行ファイルですので、これをクリックすれば、アプリケーションが起動します。

ネット上の古いコンテンツを一括削除出来る便利なサービス
-----------------------------------------------------------------------

レンタルサーバを変更したり、他の会社のブログサービスやSNSに移行した場合、コンテンツを全て削除しても、古いコンテンツの情報が検索エンジンに残ってしまう事があります。

また、Twitterでつぶやいていたツィートが非常に多くなって、管理しにくくなった場合に要らなくなった物を一括で削除したいという事もあるでしょう。

そのような時に役立つのが、一括削除サービスです。

1.以前使っていたドメインやレンタルサーバなどで公開していた古いコンテンツ情報を削除させたい場合

https://www.google.com/webmasters/tools/removals


これを使ってもクローラーによってクローリングされなければ、なかなか直ぐには消えませんので注意してください。

登録した最初は「保留」になっていますが、クローラーが404を検知すれば、1日程度で検索結果ページの特定の項目が消えるそうです。

逆に、現在でもコンテンツが公開されている場合には、再度クローラーが情報収集をして検索結果ページに反映させますので、その場合は無理だと思ってください。

2.要らなくなったツィートを一括削除してくれるサービス

http://ysklog.net/tool/twitter-delete-tweet.html

Twitterのアプリとして提供されているサービスです。

Twitterは、色々と手軽につぶやき（ほとんど文句が多いと思うが）が出来るサービスですが、管理画面が今ひとつであり、つぶやきの一括削除をするのに非常に手間がかかります。

このサービスは、一括削除をしてくれますので、ユーザーにとっては古いつぶやきが要らなくなって、全部消したい時に役立ちます。

画像変換やIPアドレスなどを調べるのに便利なオンラインサービスとソフトウェア
-----------------------------------------------------------------------------------------------

◎JPEGフォーマットの画像の画質をほぼ劣化させずに、容量を落としたい

・ソースコード

https://github.com/google/guetzli

・バイナリ

https://github.com/google/guetzli/releases

Googleが開発したJPEGエンコーダ「Guetzli」は、libjpegと同等レベルの画質で、ファイル容量を20%〜30%減らす事が可能です。

バイナリをダウンロードして、Linuxの場合は、以下のコマンドで実行出来ます。::

    ./guetzli_linux_x86-64 yyy.jpg xxx.jpg

コマンド・入力ソース・出力ファイルの順でコマンドを入力します。

実行させましたが、確かに見た目は変わらずに、ファイル容量が121.4KBから117.7KBになっていました。

大きなファイルであれば、より効果を実感出来るかもしれません。

◎どこからアクセスされているのかをIPアドレスから知りたい

https://db-ip.com/

右上の検索ボックスにIPアドレスを入力して検索する事で地図と情報を表示する事が出来ます。

◎アニメーションGIFを編集したい

http://animizer.net/

アニメーションGIFがどのように作られているかによって、編集が上手く出来るかどうかが決まってきますが、手軽にアニメーションGIFを作成・編集する事が出来ます。

◎画像を出来るだけ劣化を少なくして拡大したい

http://waifu2x.udp.jp/index.ja.html

深層畳み込みニューラルネットワークを使った2次元画像向けの超解像システムです。

風景写真よりもイラストなどのように線がハッキリとしている物の方が効果は高いようです。

◎Webサイトやブログのアクセス状況を分析したい

https://www.google.com/intl/ja_jp/analytics/

Googleアナリティクスは、無料で使えるアクセス解析ツールです。

アクセス状況を分析してSEO対策を施す事で、Webサイトなどを検索エンジンに最適化していく事が出来ます。

慣れれば、SEO業者に頼む必要はありません。

◎クロールをリクエストしたい

https://www.google.com/webmasters/tools/submit-url?pli=1

新規作成したサイトやブログの存在を知らせるには、ディレクトリサービスを使うか、Search Consoleのようなサービスを使う必要があります。

SEO対策として、メタタグの適切な設置や主要なキーワードを使って適切なコンテンツを何十記事と公開した後に、Search Consoleを使って、クローラーにサイトやブログの位置を教えてあげましょう。

◎迷惑電話を調べたい

http://www.meiwaku.com/

どこからか知らない番号が携帯電話などに表示された場合、迷惑電話番号サーチズを使って検索をすれば良いでしょう。

迷惑電話と分かり、番号拒否機能を使えば、セールスに引っ掛かる事が無くなります。
