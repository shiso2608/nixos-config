# NixOS 設定

NixOS の設定ファイル。

## インストール

1. [インストールメディア作成](installation-media.md)
2. [インストール](install.md)
3. [環境の再構築](rebuild_the_environment.md)

## ディレクトリ構造

```
.
├── core: システムの主要設定
├── desktop: デスクトップ環境
├── docs: ドキュメント
├── hardware: ハードウェア
├── home: ユーザー固有の設定
│   ├── desktop: デスクトップ環境の設定
│   └── packages: ユーザー固有のパッケージ・設定
├── images: ドキュメントに使用する画像
├── packages: システムのパッケージ
├── users: ユーザーアカウント
├── configuration.nix: システム設定のエントリーポイント
├── flake.lock: パッケージのロックファイル
└── flake.nix: flake の設定・設定全体のエントリーポイント
```
