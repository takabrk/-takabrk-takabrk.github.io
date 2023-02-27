.. Valkyrie SRX documentation master file, created by
   sphinx-quickstart on Wed Feb  3 19:35:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Java Hacks
===========

Processing 3をEclipseで使う
---------------------------------------

::

   1.Eclipseの「Help」→「Install New Software」からhttp://proclipsing.googlecode.com/svn/tags/current_releases/proclipsingSite/を登録して、Proclipsingプラグインをインストール
   2.[Window]->[Preference] で [Preferences]ダイアログを開き、左側のリストから Proclipsing を選択する。
   3.[Processing Path] のテキストフィールドに Processing をインストールしたパスを設定して、Applyボタンを押し、[OK]ボタンをクリックする。
   4.パッケージエクスプローラ上で右クリックを行い、 [New]→[Other] で [New] ダイアログを開き、「Processing」フォルダを選択して、「Processing Project」を選んで、[Next]ボタンをクリックする。
   5.必要な項目を設定してプロジェクトを作成していく。
   6.dataフォルダは、srcディレクトリの中に入れて、パッケージエクスプローラ上で右クリックメニューを出して、更新させる。
   7.ビルドしたい場合には、メニュー→「Project」に「Processing Export」という項目が出来ているので、これを使ってビルドを行う。

Processing with EclipseでOpenGLを使う
------------------------------------------------------

ProcessingをEclipseで使う場合に困ることはOpenGLの使い方が分かりにくいことです。Linux環境においてOpenGLをProcessing with Eclipseで使う方法を紹介します。::

   1.Eclipseのworkspaceに任意のProcessing用フォルダを作成します。ここでは「processing」ディレクトリを作成したとします。
   2.processingフォルダにProcessingのサイトからLinux版のProcessingをダウンロードして解凍し、中身を全てprocessingフォルダに入れます。
   3.Eclipseのメニューバーの「Project」→「Properties」→「Java Build Path」をクリックし、「Libraries」タブをクリックして、core.jar、jogl.jar、opengl.jar、gluegen-rt.jarのパスを通します。
   4.追加したjogl.jarの項目を展開し、"ネイティブ・ライブラリのロケーション”にlibgluegen-rt.so、libjogl_awt.so、libjogl_cg.so、libjogl.soが含まれるディレクトリを指定します。
   ネイティブライブラリは/workspace/processing/modes/java/libraries/openglにあります。

これでProcesssing IDEのようにOpenGLを使ったProcessingアプリケーションを作成することが出来ます。

Swingで作成したGUIアプリケーションにProcessingアプリケーションを埋め込む方法
------------------------------------------------------------------------------------------------------

Swingで作成したGUIアプリケーションとProcessingアプリケーションは別々に開発します。以下はSwingでGUIを作成する例です。JFrameを継承して作成します。ここではGUIアプリケーション「xxx」、Processingアプリケーション「yyy」とします。Processingアプリケーションを組み込むのは簡単で、まず、yyyの変数（ここではvd)を定義します。次にyyyのインスタンスを作成、「vd.init()」でProcessingアプリケーションを初期化します。あとはJPanelに込み込むために「add」関数を使ってパネルに組み込んでいます。::

   import javax.swing.*;
   import javax.swing.table.DefaultTableModel;
   import processing.core.PApplet;
   import java.awt.*;
   import java.awt.image.*;
   import java.awt.event.*;
   import java.awt.Component;
   import java.awt.Container;
   import java.awt.BorderLayout;
   import java.awt.Dimension;
   import java.awt.Rectangle;
   import java.util.*;
   public class swing_gui extends JFrame{
   	yyy vd;
   //JPanel用の変数をここで設定しておくと、ActionListenerインターフェースを使ったイベント関数でエラーが出なくなる
   	JPanel p1;
   	JPanel p2;
   	JPanel p3;
   	public spider_gui(){
   		this.setTitle("Swing GUI");
   		this.setSize(new Dimension(1024,720));
   		this.setLocationRelativeTo(null);
   		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   		BoxLayout boxlayout = new BoxLayout(this.getContentPane(),BoxLayout.Y_AXIS);
   		this.setLayout(boxlayout);
   //Swingでメニューバーを作成するには以下のように書きます。
   		JMenuBar menubar = new JMenuBar();
   		JMenu menu1 = new JMenu("File");
   		JMenu menu2 = new JMenu("Edit");
   		menubar.add(menu1);
   		menubar.add(menu2);
   		JMenuItem menuitem1 = new JMenuItem("New");
   		JMenuItem menuitem2 = new JMenuItem("Open");
   		JMenuItem menuitem3 = new JMenuItem("Close");
   		menu1.add(menuitem1);
   		menu1.add(menuitem2);
   		menu1.add(menuitem3);
   		setJMenuBar(menubar);
   		JMenuItem menuitem21 = new JMenuItem("切り抜き");
   		JMenuItem menuitem22 = new JMenuItem("コピー");
   		JMenuItem menuitem23 = new JMenuItem("貼り付け");
   		menu2.add(menuitem21);
   		menu2.add(menuitem22);
   		menu2.add(menuitem23);
   //Swingでのパネルの設定の仕方は以下のように書きます。
   		p1 = new JPanel();
   		p1.setBackground(Color.RED);
   		p1.setPreferredSize(new Dimension(1024,25));
   		p1.setLayout(new GridLayout(1,3));
   		p2 = new JPanel();
   		p2.setBackground(Color.BLUE);
   		p2.setPreferredSize(new Dimension(512,150));
   		p3 = new JPanel();
   		p3.setBackground(Color.BLACK);
   		p3.setPreferredSize(new Dimension(512,620));
   		this.add(p1);
   		this.add(p2);
   		this.add(p3);
   //メニューバー以外でボタンを設定したい場合は以下のようにして書きます。
   		JButton btn = new JButton("application1 start");
   		btn.setPreferredSize(new Dimension(100,50));
   		btn.setForeground(Color.RED);
   		btn.setBackground(Color.BLACK);
   		btn.setFont(new Font("Serif",Font.PLAIN,18));
   		btn.addActionListener(new call_processing());
   		p1.add(btn);
   		JButton btn2 = new JButton("application2 start");
   		btn2.setPreferredSize(new Dimension(100,50));
   		btn2.setForeground(Color.RED);
   		btn2.setBackground(Color.BLACK);
   		btn2.setFont(new Font("Serif",Font.PLAIN,18));
   		btn2.addActionListener(new call_processing());
   		p1.add(btn2);
   //Swingで作成したテーブルを設置することも当然出来ます。
   		DefaultTableModel tableModel = new DefaultTableModel(columnNames,0);
   		JTable table = new JTable(tableModel);
   		for(int i=0;i<4;i++){
   			tableModel.addRow(tabledata[i]);
   		}
   		tableModel.addRow(tabledata2);
   		JScrollPane sp = new JScrollPane(table);
   		sp.setPreferredSize(new Dimension(500,100));
   		p2.add(sp);

   		JTextField text = new JTextField("",10);
   		text.setColumns(15);
   		text.setPreferredSize(new Dimension(100,50));
   		p1.add(text);
   	}
   //call_processingの設定。このクラスでProcessingで作成したアプリケーションを呼ぶことが出来ます。
   	class call_processing implements ActionListener{
   		public void actionPerformed(ActionEvent e){
   			String cmd = e.getActionCommand();
   			if(cmd.equals("application1 start")){
   				vd = new application1();
   				vd.init();
   				p3.add(vd);
   			}else if(cmd.equals("application2 start")){
   				wm = new application2();
   				wm.init();
   				p3.add(wm);
   			}
   		}
   	}
   //テーブルを作成します。
   	private String[][] tabledata = {
   			{"日本","3勝","0敗","1分"},
   			{"クロアチア","3勝","1敗","0分"},
   			{"ブラジル","1敗","2敗","1分"},
   			{"オーストラリア","2勝","2敗","0分"}
   	};
   	private String[] tabledata2 = {"イギリス","2勝","0敗","2分"};
   	private String[] columnNames = {"COUTRY","Win","Lost","Even"};
   //GUIを起動するメイン関数です。
   	public static void main(String args[]){
   		swing_gui frame = new swing_gui();
   		frame.setVisible(true);
   	}
   }
