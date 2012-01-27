Mushikago SDK for Ruby.
=======================

- **Homepage**:        [http://www.mushikago.org/](http://www.mushikago.org/)
- **Author**:          Toru Matsuoka
- **Copyright**:       2011
- **License**:         Apache License, Version 2.0
- **Latest Version**:  0.3.5
- **Release Date**:    January 27th 2012


概要
----

[株式会社マイニングブラウニー](http://www.miningbrownie.co.jp/)が提供する[mushikago web service](http://www.mushikago.org/)を、Rubyから扱うためのライブラリです。


機能一覧
--------

**1.tomboを利用する**: [tombo](http://www.tombo.ne.jp/)は、APIを通してWebサイトのキャプチャ画像を取得するサービスです。
キャプチャ画像にはタグをつけて管理することができます。
キャプチャ画像は非同期で取得され、サーバの混雑具合によってリクエストから取得まで最大1時間の時間差があります。

**2.mitsubachiを利用する**: [mitsubachi](http://www.mushikago.org/mitsubachi/)はウェブサイトをクローリングするためのクラウドプラットフォームサービスです。
環境構築などの準備を一切必要とせず、ユーザーは簡易なスクリプトをmitsubachiサーバにアップロード するだけで、ウェブ上の欲しい情報を高速に収集し保存します。ユーザーは、少しの技術力とアイデアを持っていれば、新たなクローラビジネスを始める事ができます。


インストール方法
----------------

Mushikago SDK for Rubyはgemを使ってインストールします。

    $ gem install mushikago-sdk

(root権限が必要な場合は`sudo`を使ってください。)


使い方
------

### tomboを利用する

以下のコードで[tombo](http://www.tombo.ne.jp/)を利用することができます。

    require 'mushikago'

    client = Mushikago::Tombo::Client.new(:api_key => '<APIキー>', :secret_key => '<シークレットキー>')

    ########
    # Captureメソッド
    ret = client.capture('http://www.tombo.ne.jp/', {:tags => ['service'], :thumbnail => true})
    p ret.meta
    p ret.response
    # => {"message"=>"OK", "status"=>200} 
    # => {"image_url"=>"http://img.tombo.ne.jp/tombo-sample/7e11d3fd-7865-4ab9-80fb-b0fc8f362614.jpg", ...

    ########
    # Capturesメソッド
    ret = client.captures
    p ret.meta
    p ret.response
    # => {"message"=>"OK", "status"=>200} 
    # => {"total"=>134, "images"=>[{"image_id"=>"ea7998d3-f8b6-4505-ae22-fc986439c569", "thumbnail_size"=>5120, ....

    ########
    # deleteメソッド
    ret = client.delete('xxxxxxxx')
    p ret.meta
    p ret.response
    # => {"message"=>"OK", "status"=>200} 
    # => {"id"=>"xxxxxxxx"}

    ########
    # infoメソッド
    ret = client.info
    p ret.meta
    p ret.response
    # => {"message"=>"OK", "status"=>200} 
    # => {"disk_usage"=>25372565, "image_num"=>133, "api_count"=>499}

### mitsubachiを利用する

以下のコードで[mitsubachi](http://www.mushikago.org/mitsubachi/)を利用することができます。
スクリプトファイルの記述方法は[ドキュメント](http://www.mushikago.org/mitsubachi/dev/doc/deploy/)を参照して下さい。

    require 'mushikago'
    
    client = Mushikago::Mitsubachi::Client.new(:api_key => '<APIキー>', :secret_key => '<シークレットキー>')
    
    project_name = 'sample_project'
    
    # プロジェクト作成
    client.project_create(project_name)
    
    # スクリプトファイルデプロイ
    client.script_deploy(project_name, 'sample.rb')
    
    # クロール開始
    client.http_fetch(project_name, 'http://www.mushikago.org/', 'sample.rb')
    
    # クロール終了まで待機
    sleep 1 until client.project_queues(project_name)['count'] == 0
    
    # クロールログ確認
    log_files = client.resource_list(project_name, :filter => 'log/stdout')
    
    # ログファイルURL取得
    log_files['files'].each do |file|
      ret = client.resource_get(project_name, file['name'])
      puts ret['url']
    end

#### APIキーとシークレットキーの設定方法

APIキーとシークレットキーは以下の方法でも設定することができます。

**YAMLファイルを利用する場合**

以下のYAMLファイルを用意します。

<pre class="code">
api_key:&lt;APIキー&gt;
secret_key:&lt;シークレットキー&gt;
</pre>

以下のコードでYAMLファイルを読み込んで使用してください。

    require 'rubygems'
    require 'mushikago'

    Mushikago.config.load(YAML.load(File.read('config.yml')))

    client = Mushikago::Tombo::Client.new

**環境変数を利用する場合**

環境変数MUSHIKAGO_API_KEYとMUSHIKAGO_SECRET_KEYにそれぞれAPIキーとシークレットキーの設定を行います。

<pre class="code">
$ export MUSHIKAGO_API_KEY=&lt;APIキー&gt;
$ export MUSHIKAGO_SECRET_KEY=&lt;シークレットキー&gt;
</pre>

    require 'rubygems'
    require 'mushikago'

    client = Mushikago::Tombo::Client.new


変更履歴
--------

- **Jan.27.12**: 0.3.5 release
  - resource_get,script_getに:with_bodyオプション追加
- **Jan.27.12**: 0.3.4 release
  - 数字を含むリクエストの不具合に対応
- **Jan.26.12**: 0.3.2 release
  - mitsubachiに対応
- **Sep.13.11**: 0.2.3 release
  - captureメソッドのuseragentに対応
- **Sep.8.11**: 0.2.1 release
  - ライセンスをApache License, Version 2.0に変更
- **Sep.6.11**: 0.1.8 release
  - Mushikago SDK for Ruby新規作成
  - Tombo サポート

