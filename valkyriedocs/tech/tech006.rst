.. Valkyrie SRX documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

PHP Hack
===============

Smarty 3.1ではプラグインの追加方法が変更されているので注意
-------------------------------------------------------------------------------

PHPテンプレートエンジン「Smarty」では、プラグインの自作が出来ますが、従来の方法は http://www.smarty.net/docs/ja/variable.plugins.dir.tpl のように、 SMARTY_DIR 直下の pluginsや新規に作成したフォルダに自作プラグインを放り込む事で以下のように、plugins_dir[]メソッドを使ってパスを指定すれば使えました。::

 <?php
  $smarty->plugins_dir[] = 'includes/my_smarty_plugins';
 ?>
しかし、Smarty 3.1からは、自作プラグインの導入方法が変更されています。

上記の方法で追加してプログラムを動作させると、以下のようなエラーが表示されます。::

   Notice: Indirect modification of overloaded property Smarty::$plugins_dir has no effect

Smarty 3.1でのプラグインの追加は、setPluginsDirメソッドやaddPluginsDirメソッドを使います。

例えば、/var/www/xxxというディレクトリに自作プラグインを放り込みたい場合には、以下のようにパスを追加してあげれば、エラーメッセージが出なくなります。::

    $smarty->addPluginsDir(array('/var/www/xxxx'));

以下のリファレンスページを参考にすれば良いです。

http://www.smarty.net/docs/en/api.add.plugins.dir.tpl

http://www.smarty.net/docs/en/api.set.plugins.dir.tpl

これで、Smarty 3.1でも自作プラグインを他のディレクトリで管理出来るようになりますね。

PHPで出力したHTMLなどをファイルとして保存する
--------------------------------------------------------------

PHPで生成したHTMLやテキストはecho文やprint文で出力が出来ます。

この標準出力されたHTMLやテキストをファイルとして保存する為には、ob_get_contents関数でバッファを作って、これをfopen関数とfwrite関数を使ってファイルとして保存します。::


        <?php
            ob_start();  //バッファリング開始
            header("Content-type:text/html;charset=UTF-8") ;
        ?>

        //HTML文
        //途中PHPスクリプトを記述しても良い

        <?php
            $data = ob_get_contents();

            ob_end_clean();   //バッファリング終了

            $f=fopen("xxx.html","w"); //書き込みモードで書き込むファイルxxx.htmlを開く

            fwrite($f,$data); //バッファされた内容を書き込む

            fclose($f);

            echo $data;   //バッファ内容表示
        ?>

【CakePHP】Warning: _cake_core_ cache was unable to write ‘cake_dev_ja’ to File cache in
------------------------------------------------------------------------------------------------------------------------------

/app/tmp/cache

/app/tmp/logs

/app/tmp/cache/persistent/

/app/tmp/cache/models/

のパーミッションを777に変更

chmod -R 777 app/tmp
