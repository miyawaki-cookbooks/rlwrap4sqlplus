rlwrap4sqlplus Cookbook
=======================
SQL*Plusにreadline機能を追加する。

次の処理を行う。
* EPELリポジトリをインストール
* rlwrapをインストール
* LOGIN SHELLがkshならば、~oracle/.profileにsqlplusのエイリアスを追加
* LOGIN SHELLがbashならば、~oracle/.bash_profileにsqlplusのエイリアスを追加

Requirements
------------
CentOS6.6にて動作確認をしています。

* oracleユーザが作成されていること。
* sqlplusコマンドがインストールされていること。(MUSTではないが、意味がない）

#### 依存パッケージ
* `yum`

Barksfileにyumを追加してください。

e.g.

	source "https://supermarket.getchef.com"
	
	cookbook "oracle"
	cookbook "yum"

Attributes
----------
なし

Usage
-----
run_listに必要なCookbookとともに記述する。

	run_list "recipe[oracle]",
	         "recipe[oracle::logrotate_alert_log]",
	         "recipe[oracle::logrotate_listener]",
	         "recipe[oracle::createdb]",
	         "recipe[rlwrap4sqlplus]"

License and Authors
-------------------
Authors:: YAMAMOTO,Miyawaki,Tamie.
