# スライド作成のガイド

本リポジトリでの、スライド作成に関するガイドです。

## 注意事項

本リポジトリは、パブリックなGitHubリポジトリです。**機密情報などを含むスライドは、pushしないでください。**

## ワークスペースを作成する

```sh
.
└── src/<スライド用のディレクトリ名>/
    ├── images/ # 画像を格納するディレクトリ
    └── index.md
```

## ローカルでプレビュー・変換する

[Marp CLI](https://github.com/marp-team/marp-cli)が必要です。

### Commands

```sh
# Serverモードでプレビュー
make browse

# HTMLに変換
make html

# PDFに変換
make pdf

# distディレクトリをクリア
make clean
```

## スライドの公開

mainブランチにpushすると、GitHub Actionsが自動でスライドを公開します。

- 詳細：[.github/workflows/publish.yml](.github/workflows/publish.yml)

`dist/`配下に、htmlに変換したスライドと画像が格納され、`dist/`配下がGitHub Pagesで公開されます。
画像は、必ず、`images/`に格納してください。

```sh
.
├──src/<スライド用のディレクトリ名>/
│  ├──images/
│  └──index.md
└──dist/<スライド用のディレクトリ名>/ # src/を元に自動生成される(Git管理外)
   ├──images/
   └──index.md
```

[KoharaKazuya/marp-cli-action](https://github.com/KoharaKazuya/marp-cli-action)を使用しています。

## GitHub Pages一覧

Markdown形式でGitHub Pagesのリンクをリストアップできます。

```sh
./ls-pages.sh
```

## Marpについての参考リンク

- [Marp CLI](https://github.com/marp-team/marp-cli)
- [画像の入れ方](https://zenn.dev/cota_hu/books/marp-beginner-advanced/viewer/create-2)
- [マイナー機能いろいろ](https://zenn.dev/yhatt/scraps/d6004a2455e573)
