.. Valkyrie Linux documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Valkyrie Linux
===============

Valkyrie LinuxはUbuntu LTSをベースにした64bitオペレーティングシステムです。このOSのデスクトップ環境はOpenboxとTint2で構成しています。
このOSに付属しているカスタムカーネル「Noir Linux Kernel」は、リアルタイム性能とレスポンス性能を向上させます。ウィンドウマネージャーのOpenboxには角丸パッチを適用しています。

http://www.vsrx.work/article/418075361.html

推奨システム要件
----------------

Processor :
    Intel Core i,Pentium G/Celeron G,Atom SoC

    AMD Ryzen

Memory: 4GB and over

Storage: 128GB and over HDD/SSD/USB memory

Network: FTTH・ADSL・LTE・WiMAX2+ etc.

動作確認したマザーボード
---------------------------------

B150-COMBO(ASRock)

H97I-PLUS(ASUS)

C1007UN-D(GIGABYTE)

動作確認したスティックPC
-------------------------

STCK1A32WFC(Intel)

ベースにしたLinuxディストリビューション
---------------------------------------

Ubuntu 22.04.2 LTS

Kernel
------------

◎Noir linux Kernel 6.1.8
::
  ◇based kernel
    linux kernel 6.1

  ◇Applied patches
    - Built on the GCC 12.1.0
    - CPU scheduler -&gt; CFS
    - Default I/O scheduler -&gt; BFQ
    - Processor family -&gt; Generic X86_64
    - Kernel Compression mode -&gt; zstd
    - Preemption Model -&gt; Full Preemptible Kernel(Real Time)
    - CPU Timer frequency -&gt; 500Hz
    - RCU boost delay -&gt; 339
    - Timer tick handling -&gt; Full dynticks system
    - Default CPUFreq Governor -&gt; schedutil
    - CPU idle governor -&gt; TEO
    - vm_swappiness = 30
    - VM_READAHEAD_PAGES=8MB
    - dcache-cache_pressure=50
    - PCIe ACS support
    - OpenRGB support
    - Zen Interactive Tune support
    - Core scheduling for SMT ON
    - Clear Linux support
    - BBR2 support
    - AMD p-state support
PPA
-----------

::

    Ubuntu Japanese Team PPA
    Canonical kernel PPA
    Atom PPA
    BootRepair PPA
    Docker PPA
    Wine HQ PPA
    OBS Studio PPA
    Lutris  PPA
    LibreOffice PPA

OSスペック
-------------

::

    - Ubuntu 22.04.1 LTS based
    - default kernel : Ubuntu kernel 5.19.0 generic,optional : Custom kernel "Noir Linux kernel 6.1.8"
    - Openbox with Rounded Window patch
    - Tint2
    - original application "Viper Tools"
    - linux firmware 20220329.git68128
    - Mesa 22.0.5
    - dunst
    - xfce4-terminal,xfce4-taskmanager,xfce4-screenshooter,xfce4-power-managemer
    - Intel iHD Driver 21.1.0
    - jgmenu
    - pnmixer

収録しているアプリケーション
------------------------------

::

    - Firefox 109
    - emacs-nox 27.1,leafpad,glade
    - PipeWire
    - GIMP 2.10.30
    - GCC 12/11.2,Python 3.10.6,node.js,libllvm15
    - Wine 6.0.1
    - OBS Studio,Shotcut,Audacious,Audacity,soundconverter,Blender 3.4.1,ffmpeg,SMPlyer
    - Steam
    - gnumeric,abiword,KCalc
    - keepassxc
    - unetbootin,gparted,boot-repair,gnome disks
    - git 2.36.0
    - X11VNC,remmina
    - OpenJtalk
    - Arronax

アイコン
--------

::

    - Suru++

フォント
--------

::

    - Takao font
    - font noto-emoji
    - font noto cjk
    - font noto cjk extra
    - Cica

○オリジナルアプリ::
    Python製アプリケーション:Viper Tools

◯Webアプリ::
    DP-IP
    BROARDBAND  Speedtest
    Wifu2x
    printer settings


○キーボードショートカット::

     [Window Close Shortcut]
     Shift+Windows+C Close Window

     [Change Window Shortcut]
     Windwos+j prev
     Windows+k next
     Shift+Alt+Left SendToDesktopLeft
     Shift+Alt+Right SendToDesktopRight
     Windows+1 desktop1
     Windows+2 desktop2
     Windows+3 desktop3
     Windows+4 desktop4
     Windows+5 desktop5
     Windows+6 desktop6

     [Window Tilling]
     Windows+Left HalfLeftScreen
     Windows+Right HalfRightScreen
     Windows+Up HalfUpperScreen
     Windows+Down HalfLowerScreen
     Window+z ToggleMaximize
     Windows+x Iconify
     
     [Volume Shortcut]
     Windows+u volume up
     Windows+i volume down

     [right ckick menu of Openbox]
     Ctrl+m

     [Apps]
     Windows+Enter Open Terminal
     WIndows+e Open Emacs

インストール方法
================

1.ISOをダウンロード（OneDriveのアカウントが無くてもダウンロードは出来ます。右クリックメニューで「ダウンロード」の項目を選択して下さい。）

2.UNetbootinでUSBメモリーにインストールディスク(Live USB)を作成。

https://unetbootin.github.io/

3.Live USBをパソコンのUSBポートに挿入して、UEFIからLive USBで起動出来るように、USBメモリーから起動出来るようにする。（メーカーロゴが出ている時にF11キーなどを押す。）

4.Live USBでシステムを起動。ネットに接続しておきます。

5.右クリックメニューの「Install Valkyrie Linux」という項目をクリックすると、インストーラーが起動します。これを使って、インストール作業を行います。もし、ブートローダー「Grub2」のインストールが失敗した場合は、LiveUSBのシステム再起動を行って、右クリックメニューからboot-repairを使ってインストールする事が出来ます。

6.OSのインストールが終わった後に出てくるダイアログで「試用を続ける」を選択する。選択後に自動的にboot-repairが起動。

Boot Repairの使い方
===================

1.「高度なオプション」→「GRUBのオプション」→「SecureBoot」のチェックを外して、適用ボタンを押す。

2.GRUBをインストールしたら、システムの再起動（エラーが出ていてもGrub2はインストールされているので問題無く起動出来ます。）。
homeディレクトリを別にした状態で、再インストールをしている時は、/etc/skelの下にあるファイルやフォルダを全てユーザーディレクトリにコピーしなければ反映されません。

セキュアブートの無効化
======================

1.パソコンを起動させた時にメーカーのロゴが表示されるので、この時にF2キーかDeleteキーを押す。

.. image:: ../_images/uefi001.jpg

2.UEFIに入るので、詳細モードに変更する。（使っているマザーボードによって異なります。）

.. image:: ../_images/uefi002.jpg

3.セキュリティ関連の項目にセキュアブートの設定項目があるので、これを選びます。

.. image:: ../_images/uefi003.jpg

4.保存して再起動させると、セキュアブートが無効化されてシステムを起動する事が出来ます。

64bit OS「Valkyrie Linux」の特長
==================================

* デスクトップ環境は、LXQtを採用しています。

  デスクトップ環境がLXQtを採用していて、ウィンドウマネージャーはOpenboxです。デスクトップ環境のXfceなどから様々なアプリケーションを使っています。また、fbpanelやgmrunやnitrogenもデスクトップの構築に使っています。

  メモリー使用量を減らす事で、アプリケーションを使う時に必要なメモリーをより多く確保する事が出来ます。

* Linuxカーネルは、最新のLinuxカーネルベースの高レスポンス性が高いカスタムカーネルを搭載。

* Mesa 21の導入により、WineやPCSX2などで3Dゲームを動作させた時のパフォーマンスが大幅に向上しています。

* VDAPU及びVAAPI対応ドライバを採用している為、動画支援機能で低CPU負荷で動画を再生出来ます。

* サウンドは、PulseAudioとJack Audio Connection Kitをプラグイン経由で出力する仕組みになっています。

  また、Openboxの右クリックメニューからPulseAudioやJack Audio Connection Kitを起動・停止させられ、両方のサウンドサーバの併用も可能です。

* Pythonとシェルスクリプトで開発したオリジナルアプリケーション「Viper Tools」を搭載。

  リマスター機能やカスタムカーネルビルド機能、アプリケーションのインストール、人工知能プログラムによる文書作成と音読、宝くじなどの予想機能、画像・動画の変換機能などを有しています。

* Ubuntuの長期サポート版（LTS）のリポジトリと共有していますので、Main,RestrictedのコンポーネントをUbuntuの公式サポートで最新の状態に維持しています。更にPPAから最新のバージョンのアプリケーションを導入しています。

* Specific Site Browser機能で人気のWebアプリケーションをデスクトップアプリケーションのように使えます。

* PSPやPS2やPSのゲームエミュレーション、PlayOnLinux+Wineによる古いWindowsアプリケーションの利用が可能です。

* GIMPやAvidemuxやHandbrakeなどWindowsやLinuxなどでお馴染みのアプリケーションをフル装備しています。最初からプログラミング・オフィス文書作成・イラストレーション・画像編集・動画エンコード・動画編集・音楽再生・3Dモデリング・オンラインサービスの利用する事が可能です。

* UEFIモードでLiveUSBやハードディスクへのフルインストールでの起動が出来るようになっていますので、ほとんどのマザーボードに対応

* WebブラウザにはChromium Browser、WebサーバのApacheなどを装備し、Web開発環境を整えています。

* Atom、EmacsやLeafpadなど複数のテキストエディタを搭載し、PythonやPHPやJavaなどのプログラミング言語でプログラミングを行える環境を整えています。

* メインサイトとの連携

* 日本語入力環境にMoscとFcitxを採用

Valkyrie Linuxの高速化と最適化
==============================

64bit OS「Valkyrie Linux」は、LTS版Ubuntuをベースに数多くの高速化・最適化策を講じています。

Ubuntu LTSをベースにして開発したオリジナル64bit OS「Valkyrie Linux」には、様々な高速化テクニックを導入しています。

1.Ubuntuパッチが当たっているLinuxカーネルのソースコードを使って、最適化ビルドしたカスタムカーネルの導入

Linuxカーネルを更に最適化する

64bit OS「Valkyrie Linux」用のカスタムカーネルを作成

2.デスクトップ環境をOpenbox+fbpanel+Xfce/LXDE/GNOME用アプリで構成

3.prelink、preloadでアプリケーションのキャッシュデータを使って先読み

4.tmpfsでRAMDiskをブラウザのキャッシュ場所として活用

5./etc/sysctl.confの最適化

6./etc/init.d/rcに「CONCURRENCY=shell」を設定して、システム起動時のモジュールの並列起動

7.VAAPIとVDPAUの導入で動画支援機能の利用(mesa-va-drivers、mesa-vdpau-drivers)

8.ccacheでGCCによるコンパイルの高速化

9.Emacsをnox版で使う

Valkyrie Linuxの高音質化
========================

PulseAudioとJACK Audio Connection Kitをモジュールで接続し、Openboxの起動スクリプトからこれらを起動させたり、PulseAudioのデーモンをRAMDISKに配置したりして高音質化を図る事が出来ます。

高音質化部分は以下の通りです。::

    #JACK+PulseAudio
    sleep 5;jack_control start &
    sudo schedtool -R -p 49 `pidof jackdbus`
    jack_control eps realtime true
    jack_control ds alsa
    jack_control dps device hw:0
    jack_control dps rate 96000
    jack_control dps nperiods 2
    jack_control dps period 1024
    sleep 5;pactl load-module module-jack-sink channels=2
    pactl load-module module-jack-source channels=2
    sleep 3;pacmd set-default-sink jack_out
    pacmd set-default-source jack_in

   sleep 2;ln -s /usr/bin/pulseaudio /tmp &
   sleep 10;/tmp/pulseaudio --start &

Valkyrie Linuxのインストールの時にGRUBをインストールするのに失敗した場合の対処法
==============================================================================

EFIパーティションの状況によって、システムインストール時にGRUBが正常にインストールされない事があります。
その時には、Valkyrie Linuxに収録しているboot-repairを使ってGRUBをインストールする事が出来ます。::

       1.右クリックメニューでboot-repairを選択します。
       2.boot-repairが起動したら、「高度なオプション」を選択し、適用を押します。
       3.GRUBのインストールが行われます。最後に正常にインストール出来なかったという内容のメッセージが表示されますが、そのまま、システムを再起動させます。
       4.正常にシステムが起動出来るようになっています。
