# リファクタリング、バグ、安全性
: 全体的に名前の変更や関数の切り出しを行いました。  
: 関数はextesionで切り出してviewDidloadがわかりやすい感じにしました。  
: UIの設定は他でも使えそうなものはextesionに追加して使用しました。  
: 気になったエラーや不要なvcの呼び出しなどを対処しました  
: 変な部分での!はguard let で対応しました  


# アーキテクチャ,VCを軽くする
: cocoaMVC を意識しました。  
: GithubAPI とRepositoryModelを作成し,repositoryをModelに変換して使用しています。  
: TableViewDataSorceは別ファイルに切り出しました。  


# テストコード
: 簡単なユニットテスト を書きました  
: jsonのAny型の扱い方、どう書くか分からない部分があり、できるところだけ書きました。  

# UIの変更点
: SearchBarをnavigationBarにセット  
: 全体的にリッチな感じにしました。  

上記の変更にあたり、元々のTableViewやSearchControllerを削除し、新しくViewControllerを作成、カスタムセル を作成しました。  

# 新機能
: 最初の画面にガイドを追加　(ここに表示されます、上から検索できます)　みたいな  
: 検索にヒットしなかった時にヒットしなかったことを表示  

上記の変更のためにそれぞれのカスタムセル を作成し、TableViewCellの種類をenumで持つようにして表示しました。  
enumで設定した理由としては、後からの順番やロジックの変更が簡単になるからです。（例えば間に広告を入れたいとか）  


# 心配な部分
: エラーハンドリング（使用タイミングが分からずResult などはできていません。）  
: URLSessionや非同期処理の部分がどう切り出すのか,cocoaMVC になっているのかが分からず　中途半端かもしれないです。  
  
## --------------------------------  

#株式会社ゆめみ iOS エンジニアコードチェック課題

## 概要

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に iOS エンジニアを希望する方に出す課題のベースプロジェクトです。本課題が与えられた方は、下記の概要を詳しく読んだ上で課題を取り組んでください。

## アプリ仕様

本アプリは GitHub のリポジトリーを検索するアプリです。

![動作イメージ](README_Images/app.gif)

### 環境

- IDE：基本最新の安定版（本概要作成時点では Xcode 11.4.1）
- Swift：基本最新の安定版（本概要作成時点では Swift 5.1）
- 開発ターゲット：基本最新の安定版（本概要作成時点では iOS 13.4）
- サードパーティーライブラリーの利用：オープンソースのものに限り制限しない

### 動作

1. 何かしらのキーワードを入力
2. GitHub API（`search/repositories`）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
3. 特定の結果を選択したら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示

## 課題取り組み方法

Issues を確認した上、本プロジェクトを [**Duplicate** してください](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)（Fork しないようにしてください。必要ならプライベートリポジトリーにしても大丈夫です）。今後のコミットは全てご自身のリポジトリーで行ってください。

コードチェックの課題 Issue は全て [`課題`](https://github.com/yumemi/ios-engineer-codecheck/milestone/1) Milestone がついており、難易度に応じて Label が [`初級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A初級+milestone%3A課題)、[`中級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A中級+milestone%3A課題+) と [`ボーナス`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3Aボーナス+milestone%3A課題+) に分けられています。課題の必須／選択は下記の表とします：

|   | 初級 | 中級 | ボーナス
|--:|:--:|:--:|:--:|
| 新卒／未経験者 | 必須 | 選択 | 選択 |
| 中途／経験者 | 必須 | 必須 | 選択 |

課題が完成したら、リポジトリーのアドレスを教えてください。
