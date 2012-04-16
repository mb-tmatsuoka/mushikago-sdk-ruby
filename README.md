Mushikago SDK for Ruby.
=======================

- **Homepage**:        [http://www.mushikago.org/](http://www.mushikago.org/)
- **Author**:          Toru Matsuoka
- **Copyright**:       2011
- **License**:         Apache License, Version 2.0
- **Latest Version**:  0.4.0
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

### hotaruを利用する

以下のコードで[hotaru](http://www.mushikago.org/hotaru/)を利用することができます。

    require 'mushikago'
    
    client = Mushikago::Hotaru::Client.new(:api_key => '<APIキー>', :secret_key => '<シークレットキー>')
    
    domain_name = 'sample_domain'
    
    # ドメイン作成
    client.domain_create(domain_name, 'english', :tags => ['negative', 'positive'])
    
    # テキスト登録
    client.text_put(domain_name, 'This is too bad.', ['negative'])
    client.text_put(domain_name, 'This is very good.', ['positive'])
    
    # 登録されたテキストの学習が完了するまでsleep
    sleep 1 until client.text_list(domain_name)['texts'].all?{|text| text['status'] == 'complete'}
    
    # クラス判定
    result = client.classifier_judge(domain_name, 'good bye!')
    puts result['tag']
    # => positive
    
    # 共起グラフ作成
    result = client.collocation_create(domain_name, ['negative', 'positive'])
    collocation_id = result['collocation_id']
    
    # 共起グラフの作成が完了するまでsleep
    sleep 1 until client.collocation_list(domain_name)['collocations'].all?{|col| col['status'] == 'error' || col['status'] == 'complete'}
    
    # 共起語取得
    result = client.collocation_get(domain_name, collocation_id, 'This')
    puts result['words']
    # => [{"word"=>"bad", "score"=>4.4986811569504646},
    #     {"word"=>"good", "score"=>4.4986811569504646},
    #     {"word"=>"too", "score"=>4.4986811569504646},
    #     {"word"=>"very", "score"=>4.4986811569504646},
    #     {"word"=>"is", "score"=>3.3137419313374643}]


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

- **Feb.20.12**: 0.4.2 release
  - tomboのcaptureオプション「delay_time」に対応
- **Feb.20.12**: 0.4.0 release
  - 新サービス「hotaru」対応
- **Feb.14.12**: 0.3.7 release
  - Multipartでアップロードするファイルの最後に改行が付与される件修正
- **Jan.27.12**: 0.3.6 release
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


