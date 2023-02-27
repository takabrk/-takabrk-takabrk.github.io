.. Phantom Valkyrie Linux documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

コマンドランチャー「gmrun」の使い方
==================================

ctrl+spaceでgmrunを起動出来ます。

アプリケーションの名前を打って、Enterを押すとアプリケーション起動。Tabキーでキーワード補完を行ってくれます。

一時的にLinuxカーネルのI/Oスケジューラーを変更する方法
==========================================

Linuxカーネルには、様々なI/Oスケジューラーが用意されています。カーネルをソースコードからビルドする時に、I/Oスケジューラーを設定しておくのが一般的ですが、現在利用しているカーネルで一時的にI/Oスケジューラーの変更をしたい時には、以下のコマンドを使うと良いでしょう。

sudo -- sh -c 'echo cfq > /sys/block/sda/queue/scheduler'

「cfq」の部分を「deadline」「noop」「bfq」という風に変更するだけです。

確認のコマンドは以下の通りです。

cat /sys/block/sda/queue/scheduler


一方で、永続的に設定変更をしたいのであれば、Grubの設定を変更します。Ubuntu系Linuxディストリビューションでは、/etc/default/gurbの「GRUB_CMDLINE_LINUX_DEFAULT=""」に以下のコマンドを追加します。

elevator=deadline

deadlineの部分をcfqやbfq、deadlineに変更すれば、アルゴリズムを好きなように変更する事が出来ます。

他のコマンドも記述する場合は、半角スペースで区切っていきます。

サウンドサーバの切り替え
==================

   Phantom Valkyrie Linuxでは、ALSAに直接アクセスしてサウンドを出しています。一方で、PulseAudioやJack Audio Connection Kitといったサウンドサーバも搭載しており、OpenBoxの右クリックメニューで起動・停止などが出来ます。

   また、PulseとJackは、pulseaudio-module-jackを通して連携が出来るようになっています。この連携機能を使うには、PulseAudioを起動させた後に、Jackを起動させます。

VirtualBoxの音の出し方
=======================

   ALSAだけでサウンドを出していますが、VirtualBoxでホストをALSAに設定しても音が出ません。
   その為、VirtualBoxのホストで設定する際には「PulseAudio」のままにして、Openboxの右クリックメニューからPulseAudioを起動させてからVirtualboxを起動させてください。

ALSAの音量設定の保存方法
======================

   LinuxでのサウンドドライバはALSAですが、システム起動音などを調整して、その音量を永続的に保ちたい場合があります。alsactlというツールを使う事で音量設定の保存が可能です。

   1.alsamixerで音量を調整

   $alsamixer


   2.alsactlで音量設定を保存

   $sudo alsactl store

PulseAudioとJack Audio Connection KItとの連携
=====================================

   コマンドでJackとPulseの連携は出来るようになっていますが、ALSAを直接使うアプリケーションではまだ音が出ていません。
   Qjackctlで予めpulseaudio-module-jackの設定を行っておきます。

   $sudo apt-get install pulseaudio-module-jack

   Qjackctlの「Setup...」→「Options」→「Execute script after Startup」に以下のコマンドを記述する。

   pactl set-default-sink jack_out

   Ubuntu 16.04 LTS以降であれば、PulseAudioのdefault.daにモジュールを追加する記述は不要です。これを入れるとPulseAudioとJack共に起動後何秒かして落ちました。

   この状態でPulseAudio起動状態で、Qjackctlを起動すれば、PulseAudioとJackとALSAが併用出来るようになります。
   Qjackctlの代わりに、jack_cotrolを使えば、D-Bus経由でPulseAudioとの連携が出来ますが、ALSAを直接使うソフトウェアではALSAが使えなくなってしまいます。また、.asoundrcを使った場合、Ubuntu 16.04 LTS以降ではPulseAudioやALSAでの再生が出来ませんでした。
   jack_controlを使ったコマンド例は以下の通りです。ALSAを直接利用するアプリケーションを使わなければ、これでもJackとPulseAudioの連携は可能です。自動起動するようにしておくと良いでしょう。

   (sleep 5s && jack_control start && sudo schedtool -R -p 20 `pidof jackdbus`&& jack_control eps realtime true && jack_control ds alsa && jack_control dps device hw:0 && jack_control dps rate 44100 && jack_control dps nperiods 2 && jack_control dps period 64 && sleep 5s && /usr/bin/a2jmidid -e && sleep 5 && pactl load-module module-jack-sink channels=2 && pactl load-module module-jack-source channels=2 && sleep 3s && pacmd set-default-sink jack_out && pacmd set-default-source jack_in && sleep 3s && jack_wait -w && sleep 1s) &


amixerの設定コマンド
==================

   ミュートの切り替え

   amixer sset Master on

   amixer sset Master off

   音量変更

   amixer sset Master 10%+

   amixer sset Master 10%-

   amixer sset Master 60%

   現在の音量の取得

   amixer sget Master | egrep '\[.*%\]

SMPlayer+MPV+youtube-dlで動画共有サイトの1080p60fps動画をGPUの動画支援機能で動作させる
========================================================================

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

   $sudo apt-get install smplayer mpv youtube-dl

   ◇設定

   ・「全般」→「全般」→「MPlayer/mpvの実行ファイル」のパスを入力する

   ・「全般」→「出力ドライバー」を「vdpau」にする。「直接描画」「ダブルバッファー」「スクリーンセーバーを無効にする」にチェックを入れる

   ・「全般」→「オーディオ」をpulseかalsaを選択する。

   ・「パフォーマンス」→「ハードウェアデコード」を「vdpau」に変更

   ・「ネットワーク」→「Youtube（およびその他のサイト）」で「Youtubeの内部サポートを有効にする」のチェックを外す。「MPVのストリーミングサイトへの対応を有効にする」にチェックを入れる。

   SMPlayer 17.4以降は以下のように「mpv+youtube-dl」を選択するだけで良くなった。

   ・「詳細設定」→「MPlayer/mpvのオプション」に「--ytdl-format=bestvideo+bestaudio」を追加。これでyoutubeの動画で1080p60fpsの物まで再生が可能になりますが、Dailymotionなどの動画も再生するのであれば、このオプションを付ける事で再生出来なくなってしまうので注意が必要です。

   その原因は、VP9でエンコードした動画を指定しているようですので、VP9でエンコードされた動画を指定しないように設定すれば、Youtube以外の動画サイトの動画も再生出来るようになります。以下の例では、1080p以上の動画を観ない設定も同時に行っています。

   コマンドは、「--ytdl-format=bestvideo[height<=1080][vcodec!=VP9]+bestaudio/best」

Beta版ChromiumでWidevineとGoogle APIを使えるようにする
=============================================

   1.Phantom Valkyrie Linuxには、Chromium beta channel PPAを追加していますが、デフォルトではオフになっています。Synapticパッケージマネージャーの「設定」→「リポジトリ」→「他のソフトウェア」にある「http://ppa.launchpad.net/saiarcot895/chromium-beta/ubuntu」にチェックを入れて、再読み込みを行えば、Beta版Chromiumがインストール出来るようになります。

   Widevineは、有料オンデマンドサービスで公開されている映像をChromiumで視聴する場合に必要なプラグインです。

   2.https://www.google.co.jp/chrome/browser/desktop/

   Google Chromeのdebファイルをダウンロードします。

   3.ダウンロードしたdebファイルをアーカイブマネジャーで開きます。

   4.data.tar.xzを開きます。

   5.data.tar.xzを開きますと、このルートディレクトリの直下に/opt/google/chromeのディレクトリまで移動して、libwidevinecdm.soとlibwidevinecdmadapter.soを展開します。

   6.取り出したlibwidevinecdm.soとlibwidevinecdmadapter.soを現在使っているシステムの/usr/lib/chromium-browserに上書き保存します。::

       $sudo cp -a libwidevinecdm.so /usr/lib/chromium-browser

       $sudo cp -a libwidevinecdmadapter.so /usr/lib/chromium-browser


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
