.. Valkyrie SRX documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Python Hacks
===============

UbuntuでPythonのバージョンをPython3をメインにする
-----------------------------------------------------------------------

Ubuntuでバージョンを切り替えるには、以下のコマンドを入力して実行を行えば良いでしょう。::

    sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.4 2

バージョンを切り替えたい場合には次のコマンドを実行します。::

    sudo update-alternatives –config python

Pythonを使う際に便利なライブラリとテクニック
---------------------------------------------------------

◎Pythonドキュメント

https://www.python.org/doc/

プログラミング言語「Python」の公式サイトに掲載されている言語ドキュメントです。

Pythonの文法は、非常に覚える事が少なくなっている一方で、ライブラリは非常に多いです。

まず、文法を理解する事が大切であり、使っていて忘れてしまった内容を思い出したい時に、このリファレンスを活用すれば便利です。

書籍を買わなくても、ここで大体の情報は得られるはずです。

◎Python2からPython3に移行したい

http://docs.python.jp/2/library/2to3.html

Python3には、Python2からPython3に移行する為のツールを使う事で、取り敢えずは移行が可能です。

動作しない可能性もありますので、バックアップをとってから、このツールを使ってみると良いでしょう。

◎ブラウザでコードを試す事が出来るサービス

https://paiza.io/

このサービスは、Pythonを実行する環境が無くても、ブラウザ上でPythonのコードを試す事が出来ます。

ちょっとした思いつきでコードを試してみたい時に便利です。

◎機械学習

http://scikit-learn.org/stable/

Scikit Learnは、クラスタリングなどを行うのに必要な処理を一括して請け負ってくれるライブラリです。

ScipyやNumpyをベースに開発されており、必要な事が出来る定番ライブラリの一つです。

http://www.deeplearning.net/software/theano/

Pythonでディープラーニングを行いたい時に使う定番のライブラリの一つです。

行列計算などが実装されていますので、高度な処理が可能です。

https://www.tensorflow.org/

Googleが開発したディープラーニング向けのライブラリ。

Theanoに次ぐディープラーニングライブラリとして人気があります。

http://chainer.org/

ニューラルネットワーク向けのライブラリです。

http://pybrain.org/

ニューラルネットワークに強いライブラリ。

http://pyml.sourceforge.net/

SVM・再近傍法・リッジ回帰などが得意なライブラリ。

http://deeplearning.net/software/pylearn2/

画像の認識処理などをしたい時に役に立つライブラリ。

◎Get folder path from FileChooserButton in Python

http://stackoverflow.com/questions/31872243/get-folder-path-from-filechooserbutton-in-python

◎Creating a Time-Lapse Camera with the Raspberry Pi and Python

http://trevorappleton.blogspot.jp/2013/11/creating-time-lapse-camera-with.html

◎Python2とPython3が混ざっている環境で、Python3でスクリプトを動作させたい::

    $python3 xxxx.py

pythonコマンドの代わりに、python3コマンドを使う。

◎Java環境向けの実行環境「Jython」

http://www.jython.org/

スクリプトエンジンをJavaで開発されていて、Javaの代わりに使える言語で、Javaのライブラリを呼び出せます。

Processingにもモードがプラグインで提供されていて、Jythonの文法でプログラムを書く事が出来ます。

◎.NET環境向けの実行環境「Iron Python」

http://ironpython.net/

.NET Framework環境で動作する、C#でスクリプトエンジンが開発された言語です。

C#の代わりに使える言語であり、.NET Framworkで提供されたAPIを呼び出して使う事が可能です。

◎Goで開発されたPython実行環境「Grumpy」

https://github.com/google/grumpy

https://opensource.googleblog.com/2017/01/grumpy-go-running-python.html

::

    Wednesday, January 4, 2017

    Google runs millions of lines of Python code. The front-end server that drives youtube.com and YouTube’s APIs is primarily written in Python, and it serves millions of requests per second! YouTube’s front-end runs on CPython 2.7, so we’ve put a ton of work into improving the runtime and adapting our application to work optimally within it. These efforts have borne a lot of fruit over the years, but we always run up against the same issue: it's very difficult to make concurrent workloads perform well on CPython.

◎Pythonの高速化

◇JITコンパイラが実装された実行環境「PyPy」

http://pypy.org/

::

    PyPy is a fast, compliant alternative implementation of the Python language (2.7.12 and 3.3.5). It has several advantages and distinct features:

    Speed: thanks to its Just-in-Time compiler, Python programs often run faster on PyPy. (What is a JIT compiler?)

    “If you want your code to run faster, you should probably just use PyPy.” — Guido van Rossum (creator of Python)

    Memory usage: memory-hungry Python programs (several hundreds of MBs or more) might end up taking less space than they do in CPython.

    Compatibility: PyPy is highly compatible with existing python code. It supports cffi and can run popular python libraries like twisted and django.

    Stackless: PyPy comes by default with support for stackless mode, providing micro-threads for massive concurrency.

    As well as other features.

Pythonで開発されたJITコンパイラを実装したスクリプトエンジンであり、CPythonよりも高速な処理を実現しているのが特徴です。

◇Cython

http://cython.org/

    About Cython
    Cython is an optimising static compiler for both the Python programming language and the extended Cython programming language (based on Pyrex). It makes writing C extensions for Python as easy as Python itself.
    Cython gives you the combined power of Python and C to let you
    write Python code that calls back and forth from and to C or C++ code natively at any point.
    easily tune readable Python code into plain C performance by adding static type declarations.
    use combined source code level debugging to find bugs in your Python, Cython and C code.
    interact efficiently with large data sets, e.g. using multi-dimensional NumPy arrays.
    quickly build your applications within the large, mature and widely used CPython ecosystem.
    integrate natively with existing code and data from legacy, low-level or high-performance libraries and applications.
    The Cython language is a superset of the Python language that additionally supports calling C functions and declaring C types on variables and class attributes. This allows the compiler to generate very efficient C code from Cython code. The C code is generated once and then compiles with all major C/C++ compilers in CPython 2.6, 2.7 (2.4+ with Cython 0.20.x) as well as 3.2 and all later versions. We regularly run integration tests against all supported CPython versions and their latest in-development branches to make sure that the generated code stays widely compatible and well adapted to each version. PyPy support is work in progress (on both sides) and is considered mostly usable since Cython 0.17. The latest PyPy version is always recommended here.
    All of this makes Cython the ideal language for wrapping external C libraries, embedding CPython into existing applications, and for fast C modules that speed up the execution of Python code.

C言語によるPython向けの拡張モジュールを作成するのに適した言語。

C言語の関数や変数の型やクラスの宣言などを使えるのが利点です。

Pythonの文法で型宣言などが出来るようになっていますので、C言語で一から作るよりも開発がしやすいというのが特徴です。

また、C言語のコードに変換してコンパイルを行いますので、コンパイルした物は、C言語のソースコードをコンパイルした物とほぼ同等レベルの速度で実行が可能になっています。

◎Python+シェルスクリプトでシェルスクリプトの弱点を補強する

シェルスクリプトはUNIX系のOSでファイル操作などのネイティブな処理が出来る為、Linuxなどを使っている場合には重宝するスクリプトシステムです。

しかし、このシェルスクリプトにも現代的な機能が無い場合があり、代表的な物としてはfor文があります。

近年では、Linuxのネイティブな機能操作を行う為の機構は、シェルスクリプトだけでなく、PythonやPerlやRubyなどの軽量言語があります。

軽量言語では、シェルスクリプトなどのOS特有の機能にアクセスする為のモジュールが用意されている事が多く、Pythonでは、osモジュールやshutilモジュールなどがあります。

これでシェルスクリプトをPythonスクリプトに埋め込み、Pythonとシェルスクリプトの良い部分を使って高度なプログラミングを行えるようになります。

簡単な例として、リストでアプリケーションの名称を保持し、Pythonのfor文とosモジュールとシェルスクリプトで纏めてインストールする場合にはこのように出来るでしょう。

::

    import os
    list1 = ["aaaa","bbbb","cccc","dddd","eeee"]
    for i in list1:
        os.system("sudo apt-get install %s" % (i))

これは、「sudo apt-get install aaaa bbbb cccc dddd eeee」と同義です。

しかし、リストlist1でアプリケーションの管理が出来ますので、変更したい時に変更しやすいといったメリットがあります。

Pyrhonとシェルスクリプトは、現在公開されているLinuxディストリビューションなどで装備されていますので、工夫をする事によって多彩な処理が出来るようになり、シェルスクリプトで用意されていないfor文を自在に使えるようになります。

os.systemは、Python2で使われていた方法であり、Python3になってからは、シェルスクリプトの呼び出しは、別のモジュールとメソッドを使う必要があります。

::

    import subprocess

    list1 = ["aaaa","bbbb","cccc","dddd","eeee"]

    for i in list1:
        subprocess.call("sudo apt-get install %s" % (i),shell=True)

os.systemの代わりに、subprocess.callを使います。

Pythonでシェルスクリプトを使う時に気をつけるべき事は、ディレクトリ移動です。

シェルスクリプトの場合には、「cd xxxx」で移動が出来ますが、これをPythonのos.systemに入れてしまいますと動作しません。

その代わり、osモジュールには、階層移動用のメソッドが用意されています。

Pythonでディレクトリ移動を行うには、「os.chdir("xxxx")」という風にしますと出来ます。

シェルスクリプトのmkdirは、Pythonでは「os.mkdir」を使います。

再帰的に階層を作りたい場合にはos.mkdirsを使えば良いでしょう。

権限を持っている人を変更するにはos.chown、モードを変更するには、os.chmodを使っていきます。

メソッドの名称は、比較的シェルスクリプトに準じていますので、どのような機能を持っているのかは分かりやすいでしょう。

::

    os.chdir("xxxx")
    os.chmod("yyyy")
    os.chown("zzzz")
    os.mkdir("aaaa")

    etc.

◎Pythonのショートコード

1.forループの部分をリスト内包表記にする::

    for i in [1,2,3,4,5,6]:
        print(i)

これをリスト内包表記にすると以下のようになり、一行で書けるようになります。::

    a = [print(i) for i in [1,2,3,4,5,6]]

2.比較演算子の省略::

    a = [print(i) for i in [1,2,3,4,5,6] if(i <= 3)]

比較演算子を一つ減らすには以下のようにします。::

    b = [print(i) for i in [1,2,3,4,5,6] if(i < 4)]

3.三項演算子

JavaScriptでは、「変数 = 条件 ? 真 : 偽」というスタイルで三項演算子が使えましたが、Pythonでも書き方が少し違いますが三項演算子が使えます。::

    a=float(10)
    b=12
    if a/b < 0:
        c = print("True")
    else:
        c = print("False")

三項演算子にすると以下の通りです。::

    a=float(10)
    b=12
    c = print("True") if a/b < 1 else print("Flase")

リスト内包表記と同じようにコードを一行で書きたい時に役立ちます。

4.Python2限定のreprリテラル

他のタイプから文字列に変更したい場合には、strメソッドを使いますが、Python2ではreprリテラルを使えます。

しかし、将来的にPython3に環境を移したい時にはreprリテラルを使わない方が良いでしょう。

reprリテラルは、Python3では削除されているからです。::

    str(890)

reprリテラルでは以下のように表現する事が出来ます。::

    `890`

5.モジュールを呼び出す時にエイリアスを使う

Pythonでは、モジュールを呼び出す時に、エイリアスを使う事でモジュールへのアクセスがしやすくなります。::

    import numpy as np

Numpyという数学モジュールを呼び出す時に、慣例になっている呼び出し方です。

Numpyのモジュールを使う時には、npでモジュールにアクセスして、Numpyのメソッドを使っていく事になります。

Python3でシェルスクリプトを使う時に利用する「subprocess.call」は、モジュール名が長いので、モジュールを呼び出す時にエイリアスを使っておけば、文字数を減らせるのが分かります。::

    import subprocess as sp
    sp.call("sudo apt-get install xfce4-terminal",shell=True)

6.メソッドを使う時に変数に格納する

例えば、以下のコードがあるとします。::

    self.tree = Gtk.Builder()
    self.window = self.tree.get_object("button1")

「self.tree.get_object」の部分が冗長的であり、このようなメソッドを何箇所も書く場合、面倒になります。

その為、この部分を変数に格納してしまえば、同じ処理を繰り返す時に入力するべき文字数が大幅に減らせます。

ブログラムもスッキリとしますので見易くなるでしょう。::

    self.tree = Gtk.Builder()
    treeObj = self.tree.get_object
    self.window = treeObj("button1")

7.lambda式を使った関数のショートコード化

関数は、def文を使って複数行にわたって記述していく事になります。

以下は任意の数字iをn乗する関数です。::

    def square(i,n):
        return i**n

これをlambda式で表現しますと、以下のようになります。::

    square = lambda i,n:i**n

一行で表現する事が出来ました。

◎キャッシュ無しによるPIPを使ったライブラリのインストール法

PIPは、Pythonのパッケージ管理システムです。

通常「pip install xxx」というようにコマンド入力をして使いますが、この方法の場合、Wheelキャッシュが蓄積されたり、キャッシュに反応して新しいバージョンに上げる事が出来ない事があります。

キャッシュ無しでライブラリをインストールするには、以下のようにコマンド入力をします。::

    $sudo su
    $pip install --no-cache-dir install -I xxx

◎PIPでインストールしたmatplotlibがエラーを出す

matplotlibをインポートするとエラーが出る時が度々あります。

対策としては以下のコマンドを実行してください。::

    $sudo su
    #pip2 install numpy python-dateutil pytz pyparsing six --force-reinstall --upgrade --no-cache-dir
    #pip3 install numpy python-dateutil pytz pyparsing six --force-reinstall --upgrade --no-cache-dir


◎【Python】ホームディレクトリの取得方法

Pythonでプログラムを書いていますと、ホームディレクトリに置いているファイルを読み書きしたい場合があります。その時に、Pythonでホームディレクトリを取得することが出来ます。以下がその方法です。::

    import os
    os.environ[‘HOME’]

「/home/xxx/.config」というパスを取得したい場合には、以下のようになります。::

    os.environ['HOME’]+“/.config”

◎BeautifulSoupを使ってHTMLファイルを辿っていく例

特定のURLのHTMLからthタグの値やtdタグの値を取得してリストrlaやrlbに入れる::

    from BeautifulSoup import BeautifulSoup
    rla = []
    rlb = []
    soup = BeautifulSoup(open(url))
    for table in soup("table"):
        for tbody in table("tbody"):
            for tr in tbody("tr"):
                for th in tr("th"):
                    rla.append(th.renderContents())
                for td in tr("td"):
                    rlb.append(td.renderContents())

◎「"0011","0021","0031"・・・」というような数字のリストを作る例::

    sl = ["00"+str(i)+"1" for i in range(5)]

◎ネット上のHTMLを取得する例::

    import os,urllib2
    url_base = "http://xxx.com"
    def download_html():
        if not os.path.isdir("data"):
            os.mkdir("data")
            os.chdir("../")
        else:
            os.chdir("data")
        nnum =(["num"+i for i in range(6)])
        print url_base
        print nnum
        opener = urllib2.build_opener()
        opener.addheaders = [('User-agent','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.132 Safari/537.36')]
        for i in nnum:
            try:
                html = opener.open(url_base+"/%s.html" % (i))
                print url_base/%s.html" % (i)
                with open(i+".html","w") as lf:
                    lf.write(html.read())
                lf.close()
            except Exception,e:pass
        os.chdir("../")
        return sorted(set([i for i in os.listdir("data")]))

◎テキストファイルの一部を書き換える例

xxx.txtというテキストファイルの中の一部分を書き換えます。 aaaは正規表現、bbbは書き換える内容です。::

    f=open("xxx.txt")
    lines = f.readlines()
    f.close()
    fs=open("xxx.txt","w")
    for line in lines:
        fs.write("%s" % (re.sub("aaa","bbb",line)))
        print line[:-1]
    fs.close()

OSの情報をPythonでダイアログ表示させる方法
-------------------------------------------------------------

OSの情報をPythonでダイアログ表示させるには、Tkとsubprocessモジュールを使えば、実現出来ます。::

    #!/usr/bin/env python
    #-*- coding:utf-8 -*-

    import subprocess as sp
    import tkMessageBox as msb

    def information():
        cmd1 = "cat /etc/lsb-release"
        cmd2 = "uname -r"
        ret1 = sp.check_output(cmd1.split(" "))
        ret2 = sp.check_output(cmd2.split(" "))
        msb.showinfo("About Valkyrie SRX",ret1+ " " + ret2)
    if __name__ == "__main__":
        information()

cmd1とcmd2は、シェルコマンドを入れておきます。シェルの出力結果を文字列として取得するのが、subprocess.check_outです。後は、tkMessageBox.showinfo を使ってダイアログ表示させます。

並列処理で無名関数を使う
-----------------------------------

http://stackoverflow.com/questions/35244577/is-it-possible-to-use-an-inline-function-in-a-thread-call

::

    You can use a lambda function in Python 3.x

    import threading

    threading.Thread(target=lambda a: print("Hello, {}".format(a)), args=(["world"]))
    You should probably take a look at this SO question to see why you can't use print in Python 2.x in lambda expressions.

    Actually, you can fit many function calls into your lambda:

    from __future__ import print_function # I'm on Python 2.7
    from threading import Thread

    Thread(target=(lambda: print('test') == print('hello'))).start()
    That will print both test and hello.

Pythonで数種類の処理を並列で行う場合に便利なモジュールがthreadingモジュールです。呼び出し方は以下のようになります。この場合は、Threadメソッドの呼び出しは「threading.Thread」となります。::

    import threading

もし、プログラムの中で、Threadメソッドだけを記述したい場合には、以下のように呼び出します。::

    from threading import Thread


◇引数を用いる場合
::

    Thread(target=lambda a: print("Hello, {}".format(a)), args=(["world"])).start()

引数aに与える値はargsで設定します。

◇引数を使わない場合
 ::

    Thread(target=lambda : subprocess.call("xxx",shell=True)).start()

subprocess.callなどでシェル経由でプログラムを動作させる場合に便利です。何れの場合も、工夫をすれば、一文で処理の設定が出来ます。

PIP経由でmatplotlibをインストールしても可視化してくれない場合の対処法
--------------------------------------------------------------------------------------------

matplotlibは、データを可視化してくれる便利なライブラリです。

しかし、PIP経由でインストールしてshowメソッドを使っても表示してくれない事があります。この原因は、matplotlibがpython-tkに依存している為ですので、python-tkをインストールしてからmatplotlibを再インストールすれば、可視化が出来るようになります。::

    $sudo apt-get install python-tk python3-tk

    $sudo pip2 install --no-cache-dir -I matplotlib

    $sudo pip3 install --no-cache-dir -I matplotlib

PIP経由でstatsmodelsがインストールが出来ない時の対処法
----------------------------------------------------------------------------

Pythonで線形回帰を行う時に便利なのがstatsmodelsというライブラリです。

しかし、PIPでインストールすると以下のようなエラーが出る事があります。::

    statsmodels/nonparametric/_smoothers_lowess.c:8:22: fatal error: pyconfig.h: そのようなファイルやディレクトリはありません
    compilation terminated.
    error: command 'x86_64-linux-gnu-gcc' failed with exit status 1

    ----------------------------------------

     Command "/usr/bin/python3 -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-chrasx4k/statsmodels/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-bbtim_8d-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-chrasx4k/statsmodels/

GCCでコンパイルする時に必要な物が足りていないという事です。

必要な物は以下のコマンドでインストールする事が出来ます。::

    $sudo apt-get install python-dev python3-dev libxml2-dev libxslt-dev

これらのライブラリをインストールしてから、PIPでstatsmodelsをインストールすれば、使えるようになります。::

    $sudo pip2 install --no-cache-dir statsmodels

    $sudo pip3 install --no-cache-dir statsmodels

WSGIアプリケーションをCGIプログラムとして動作させる
--------------------------------------------------------------------

WSGIは、Pythonにおいて、Javaのサーブレットのような仕組みを実現させるものです。PythonだけでWebサーバ経由でWSGIアプリケーションを動作させる事が可能であり、Apacheにmod_wsgiモジュールを組み込んでいれば、Apache上でWSGIアプリケーションが動作します。
一方で、サーバにはmod_wsgiが組み込まれていない事がありますので、代わりにCGIプログラムとしてWSGIアプリケーションとして動作させる事が出来ます。 以下のようなスクリプトファイルがあったとします。::

   #!/usr/bin/env python
   #-*- coding:utf-8 -*-

   import datetime

   d = datetime.datetime.today()

   time = '%s年%s月%s日 %s時%s分%s秒\n' % (d.year, d.month, d.day, d.hour, d.minute, d.second)

   def application(environ, start_response):
       status = '200 OK'
       response_headers = [('Content-type', 'text/plain')]
       start_response(status, response_headers)
       return [time]

WSGIアプリケーションファイルの下部に以下の3行を付け加えます。::

   if __name__ == '__main__':
       from wsgiref.handlers import CGIHandler
       CGIHandler().run(application)

Beautiful Soupを使ってHTMLを組み立てる
-------------------------------------------------------

PythonのHTMLパーサ「Beautiful Soup」を使ってHTMLを組み立ててみました。 Beautiful Soupが入っているフォルダは、PIPを使わずに、テストページと同じディレクトリに設置しています。 htmlタグやbodyタグなど基本的な要素は予めhtml変数に持たせています。 insertメソッドで要素を追加、Tag関数で追加したい要素の指定、NavigableStringで文字列の追加を行っています。::

   #!/usr/bin/env python
   #-*- coding:utf-8 -*-
   import os,sys,urllib2
   from bs4 import BeautifulSoup,Tag,NavigableString

   html = """<!DOCTYPE html>
   <html lang="ja">
   <head>
   </head>
   <body></body>
   </html>
   """

   soup = BeautifulSoup(html)
   soup.head.insert(0,Tag(soup,"title"))
   soup.title.insert(0,NavigableString("テストページ"))
   soup.head.insert(0,Tag(soup,"style"))
   soup.head.style.string = """
   body{
       background:#000000;
   }
   .baselayer{
       width:720px;
       height:600px;
       background:#ffffff;
       margin : 0 auto;
   }
   .test{
      width:100%;
      height:500px;
      margin:0;
      padding:0;
   }
   footer{
       background-color:#ff0000;
       height:100px;
   }
   """

   soup.body.insert(0,Tag(soup,"div"))
   soup.body.div["class"] = "baselayer"
   soup.body.div.insert(0,Tag(soup,"header"))
   soup.body.div.header.insert(0,Tag(soup,"a"))
   soup.body.div.header.a["href"] = "http://nightmare.osdn.jp"
   soup.body.div.header.a["target"] = "_blank"
   soup.body.div.header.a.string = "Top"
   soup.body.div.insert(1,Tag(soup,"nav"))
   soup.body.div.insert(2,Tag(soup,"article"))
   soup.body.div.insert(3,Tag(soup,"footer"))
   soup.body.div.footer.string = "Copyright@taka"
   soup.body.div.article.insert(0,Tag(soup,"p"))
   soup.body.div.p["class"] = "test"
   soup.body.div.p.insert(0,NavigableString("BeuatifulSoupを活用しています。"))

   f= open("test11.html","w")
   f.write(soup.prettify())
   print soup.prettify()
   f.close()

Pythonライブラリ/モジュール
------------------------------------

   `Pyglet <http://www.pyglet.org/>`_

   画像・動画・音楽・音声を再生するために使用するモジュール

   `Numpy <http://www.numpy.org/>`

   数学を扱うためのライブラリ

   `matplotlib <http://matplotlib.org/>`_

   グラフを扱うライブラリ。アニメーションさせることも出来る。

   `PIL(Python Imaging Library) <http://www.pythonware.com/products/pil/>`_

   画像処理を行うライブラリ。フィルタを適用したり、トランスフォームを行うことが可能。

withの使い方
------------------

::

   f = open("sample.txt","w")
   f.write("xxx")
   f.close()

上のコードをwithは以下のような使い方をすることが可能です。::

   with open("samplle.txt","w") as f:
   	f.write("xxx")

特定のキーを指定してリストをソートする
--------------------------------------------------

以下のようなリストがあるとする。::

   tdata = [(5,3),(1,2),(4,5),(2,1),(3,6)]

これを各要素の二つ目の引数でソートをしたい場合は次のようにします。::

   tdata.sort(cmp=lambda x,y:cmp(x[1],y[1]))

降順にするには次のようにします。::

   tdata.sort(cmp=lambda x,y:cmp(x[1],y[1]),reverse=True)

また、より簡単に高速にソートするには次のようにします。::

   sorted(tdata,key=itemgetter(1)) #昇順
   sorted(tdata,key=itemgetter(1),reverse=True)　#降順

SQLiteで作成したテーブルのデータをPythonのリストにする方法
-------------------------------------------------------------------------------

社員というテーブルに(名前,社員番号、年齢、社員ID)というインデックスを作ります。Pythonのsqlite3モジュールを使って作成してもいいですが、確実にデータベースを作成したいなら、GUI操作出来るソフトウェアの導入をお薦めします。
Firefoxには「sqlite-manager」というアドオンを使うとPHPのphpMyAdminのような操作でSQLiteで作成したデータベースのデータ管理がやりやすくなります。::

   import sqlite3
   def db2file():
   	con = sqlite3.connect("data.sqlite")
   	c = con.cursor()
   	c.execute("select * from 社員")
   	kdata = []
   	for i in c:
   		kdata.append(i)
   	return kdata

kdataの各要素はデータベースのデータがそのままタプルになっています。これでPythonでデータを操作出来ます。
もし、kdataの各要素を加工したい場合は以下のようにして各要素をリスト型にしてください。::

   kdata2 = [list(i) for i in kdata]

数字の各桁の数字を算出する方法
------------------------------------------

数字の各桁の数字を算出するには以下のようにします。ここでは「3125」という数字があるとします。::

   3125/1000 #千の位
   3125%1000/100 #百の位
   3125%1000%100/10 #十の位
   3125%1000%100%10 #一の位

除法の結果で小数点の切り捨てを回避する方法
----------------------------------------------------------

Pythonでは除法を使うと、結果の小数点が切り捨てられます。これを回避したい場合（確率計算などをする場合など）は以下のようにします。::

   float(4)/100
   4.0/100

これらの結果は「0.04」となります。

ループを使って各桁の組み合わせで数字を作る方法
--------------------------------------------------------------

百の位、十の位、一の位の各桁のリストがある場合、これらを使って3桁の数字のリストを作るには以下のようにします。::

   num1 = [4,5,6,1,2,3]
   num2 = [1,2,3,4,5,6]
   num3 = [9,4,6,7,8,3]
   numx = []
   for i in num1:
   	for j in num2:
   		for k in num3:
   			numx.append(i*100+10*j+k)

確実にリストから要素を取り除く方法
--------------------------------------------

ループ内でremoveメソッドなどでリストから要素を取り除くと「list out of range」などというエラーメッセージが出ることがあります。
これを回避するには以下のように書くとうまくいきます。
num1,num2というリストがあるとき、num2からnum1と同じ要素を取り除く場合、以下のようにtry～except文を使います。::

   for i in num1:
   	try:
   		num2.remove(i)
   	except:num2

1要素がタプルになっているリストをlambda式を使った降順にソートする
--------------------------------------------------------------------------------------

unma = [(4,4),(3,1),(6,0),(5,3),(1,10),(2,3),(3,8)]を各タプルの第1項で降順ソートするには以下のようにします。::

   unma.sort(cmp=lambda x,y:cmp(x[0],y[0]),reverse=True)

また、第2項で降順ソートするには以下のようにします。::

   unma.sort(cmp=lambda x,y:cmp(x[1],y[1]),reverse=True)

Pythonのバージョンを切り替える
------------------------------------------

Pythonのバージョンを切り替えるには、「/usr/local/bin」の直下にあるpython-config,pythonを切り替えたいバージョンのシンボリックリンクに変更することで出来ます。元のPythonやpython-configは「/usr/bin」にあります。

Pythonの標準関数を無効化するスクリプト
-----------------------------------------------------

「__builtins__ = 0」と打ち込むだけで、Pythonの標準関数を無効化することが出来ます。

Pythonのリスト内包表記::

   nums_mini = [0,1,2,3,4,5]
   nc = []
   for i in range(len(nums_mini)):
    nc.append(nums_mini.count(nums_mini[i]))

これはnums_miniというリストの各要素の出現数を数え、空のリストncの中に加えていき、リストncを生成しています。これをリスト内包表記で表すと簡潔にすることが出来ます。::

   nc = [nums_mini.count(nums_mini[i]) for i in range(len(nums_mini))]

またループの中に条件をつけて条件に合致した場合に要素を取り出すときにもこのリスト内包表記で一行で表すことが出来ます。::

   dc = []
   for i in range(len(num_list)):
    if num_list[i][1] == dc_num:
     dc.append(num_list[i])

これをリスト内包表記で表すと以下のようになります。::

   dc = [num_list[i] for i in range(len(num_list)) if num_list[i][1] == dc_num]

条件がfor文の後ろに来ています。ブロックを使う時には「:」を使いますが、リスト内包表記では省略することが出来ます。慣れると非常にコンパクトなスクリプトを書くことが出来るようになります。また、ループが入り子になっている場合は内包表記を使うと綺麗に表現することが出来ます。この時、リストのように改行しても問題ありません。::

   g3 = []
   for i in range(len(una10)):
   	if una10[i][1] > g_num:
   		for j in range(10):
   			g3.append(una10[i][0]*10+j)

   g3 = [(una10[i][0]*10+j)
                                    for i in range(len(una10))
                                    if una10[i][1] > g_num
                                    for j in range(10)]

ProcessingのプログラムをJythonに移植するためのテンプレート
------------------------------------------------------------------------------

   #Swingを読み込む
   from javax.swing import JFrame
   #Processingの「lib」フォルダにあるcoreライブラリを読み込む
   from processing.core import PApplet

   #クラスを設定
   class Sketch(PApplet):
       def __init__(self):
           pass
   #空のフィールドを呼ぶ
       def getField(self, name):
           return self.class.superclass.getDe
   claredField(name).get(self)

   #Processingの「setup」部分を記述
       def setup(self):
           self.size(320, 240)

   #Processingの「draw」部分を記述
       def draw(self):
   　　　　self.～
   #アプレット実行関数
   def run(applet):
       frame = JFrame(title="Processing",
                      resizable = 1,
                      defaultCloseOperation=JFrame.EXIT_ON_CLOSE)
       frame.contentPane.add(applet)
       applet.init()
       frame.pack()
       frame.visible = 1

   if __name__ == '__main__':
       run(Sketch())

ライブラリの呼び出し方はProcessingのJavaモードに準拠しているようです。後はJythonの文法でProcessingのプログラムを書いていくことが出来ます。Processingの関数には必ず「self」を追記する必要があります。また、事前にSwing、Processingのcoreライブラリを呼び出す必要があります。coreライブラリは環境変数のPathで関連付けておく必要があります。JythonファイルはShift-JISで保存してください。

Beautiful Soupを使ってHTMLを組み立てる
---------------------------------------------------------

PythonのHTMLパーサ「Beautiful Soup」を使ってHTMLを組み立ててみました。

Beautiful Soupが入っているフォルダは、PIPを使わずに、テストページと同じディレクトリに設置しています。

htmlタグやbodyタグなど基本的な要素は予めhtml変数に持たせています。

insertメソッドで要素を追加、Tag関数で追加したい要素の指定、NavigableStringで文字列の追加を行っています。::

 #!/usr/bin/env python
 #-*- coding:utf-8 -*-
 import os,sys,urllib2
 from BeautifulSoup.BeautifulSoup import BeautifulSoup,Tag,NavigableString

 html = """&lt;!DOCTYPE html&gt;<br>&lt;html lang="ja"&gt;<br>&lt;head&gt;<br>&lt;/head&gt;<br>&lt;body&gt;&lt;/body&gt;<br>&lt;/html&gt;
 """

 soup = BeautifulSoup(html)
 soup.head.insert(0,Tag(soup,"title"))
 soup.title.insert(0,NavigableString("テストページ"))
 soup.head.insert(0,Tag(soup,"style"))
 soup.head.style.string = """
 body{
    background:#000000;
 }
 .baselayer{
    width:720px;
    height:600px;
    background:#ffffff;
    margin : 0 auto;
 }
 .test{
   width:100%;
   height:500px;
   margin:0;
   padding:0;
 }
 footer{
    background-color:#ff0000;
    height:100px;
 }
 """
 soup.body.insert(0,Tag(soup,"div"))
 soup.body.div["class"] = "baselayer"
 soup.body.div.insert(0,Tag(soup,"header"))
 soup.body.div.header.insert(0,Tag(soup,"a"))
 soup.body.div.header.a["href"] = "http://nightmare.osdn.jp"
 soup.body.div.header.a["target"] = "_blank"
 soup.body.div.header.a.string = "Top"
 soup.body.div.insert(1,Tag(soup,"nav"))
 soup.body.div.insert(2,Tag(soup,"article"))
 soup.body.div.insert(3,Tag(soup,"footer"))
 soup.body.div.footer.string = "Copyright@taka"
 soup.body.div.article.insert(0,Tag(soup,"p"))
 soup.body.div.p["class"] = "test"
 soup.body.div.p.insert(0,NavigableString("BeuatifulSoupを活用しています。"))

 f= open("test11.html","w")
 f.write(soup.prettify())
 print soup.prettify()
 f.close()
