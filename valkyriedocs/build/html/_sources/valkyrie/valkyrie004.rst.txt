カスタムカーネルについて
===================

http://takabrk.seesaa.net/article/449185431.html

This low latency kernel is for Ubuntu 16.04 LTS(64bit) and is aimed at processors after the Intel SandyBridge architecture by adding an aufs patch and CK2 patch,kernel_gcc patch to Linux Kernel.

カスタムカーネルの作成
-------------------------------

64bit OS「Phantom Valkyrie Linux」用のカスタムカーネルを作成しました。フルインストール環境とLiveDVD環境で動作しています。

Linuxカーネル4.11ベースでリアルタイムカーネルを作りたいのですが、まだRT Preempt(https://www.kernel.org/pub/linux/kernel/projects/rt/)のパッチが公開されていないようですので、取り敢えず、カーネルオプションでISDNやIEEE1394など明らかに現在の一般的なコンピューティングで使わないドライバとモジュールを外して、カーネルのファイル容量を減らしました。

カスタムカーネルの作成方法は、昔からあるmakeを使う方法で行っています。

1.Ubuntuパッチが適用されているカーネルソースをダウンロードする。::

    $apt-get source linux-image-$(uname -r)

あるいは以下の方法::

    $apt-get source linux-source-4.10.0

    $apt-get source linux-source-4.8.0


2.カーネルソースに合ったビルド環境をインストールする。::

    $sudo apt-get install build-essential kernel-package libqt4-dev pkg-config libncurses5-dev

    $sudo apt-get build-dep linux-image-$(uname -r)


3.現在使っているカーネルからカーネルコンフィグをコピーする。::

    $make oldconfig


4.コンフィグ設定ツールを起動させて、カーネルオプションを調整し、3で作成した「.config」ファイルに上書き保存する。::

    $make xconfig


5.Makefileを任意のテキストエディタで開き、「EXTRAVERSION = 」の部分に適当な数字や文字列を入れておくとバージョン管理がしやすくなります。文字列は先頭に「-」を入れておくと見易くなります。

6.ビルドを行う。::

    $sudo make-kpkg -j3 --initrd kernel_image kernel_headers


-jオプションの数字は、プロセッサのコア数＋1にしておくと効率的にビルドを行ってくれます。

7.無事にビルドが終われば、カーネルソースフォルダの上位ディレクトリにdebファイルが出来ていますので、そのディレクトリに移動してカーネルとヘッダファイルをインストールします。::

    $sudo dpkg -i *.deb


◇削除したモジュール

・Kernel Hacking関連全て

◇最適化

- Processer family -> Generic-x86-64

- Kernel Compression mode -> LZ4

- Preemption Model -> Preemptible Kernel(Low-Latency Desktop)

- Timer frequency -> 1000MHz

- Default I/O scheduler -> BFQ-SQ

- Compiler optimization level -> Optimized harder

- MuQSS on

- UKSM on

- Zen Interactive Tune on

- CPUFreq Governor -> ondemand


Linuxカーネルのソースコードとパッチ
--------------------------------------------------

1.カーネルソースコード

https://www.kernel.org/

2.公式パッチ

https://www.kernel.org/pub/linux/kernel/

3.UbuntuパッチとUbuntuカーネルバイナリ

http://kernel.ubuntu.com/~kernel-ppa/mainline/

4.リアルタイムカーネルパッチ

https://www.kernel.org/pub/linux/kernel/projects/rt/

5.Processor Familyの種類を増やすパッチ

https://github.com/graysky2/kernel_gcc_patch

6.BFQスケジューラやMuQSSなどを追加するCK1パッチ

http://ck-hack.blogspot.jp/

7.CK1パッチを個別にした物

http://ck.kolivas.org/patches/4.0/

8.Aufs

http://aufs.sourceforge.net/

9.Zen kernel

https://github.com/zen-kernel/zen-kernel

10.pf-kernel

https://pf.natalenko.name/

11.UKSM

https://github.com/dolohow/uksm

◇パッチ適用方法例::

    $patch -p1 < xxx.patch

◇xz圧縮されている場合::

    $xzcat ../patch-xxx.patch.xz | patch -p1

◇Aufsをgitから取得::

    $git clone 	git://github.com/sfjro/aufs4-standalone.git

    $cd aufs4-standalone

    $git checkout origin/aufs4.10

◇Zen Kernel SourceをGitから取得::

    $git clone https://github.com/zen-kernel/zen-kernel.git

    $cd zen-kernel

    $git checkout origin/4.10/master
