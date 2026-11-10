# NixOS 設定

NixOS の設定ファイル。

## インストール

- [インストールメディア作成](installation-media.md)

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
├── packages: システムのパッケージ
├── users: ユーザーアカウント
├── configuration.nix: システム設定のエントリーポイント
├── flake.lock: パッケージのロックファイル
└── flake.nix: flake の設定・設定全体のエントリーポイント
```
