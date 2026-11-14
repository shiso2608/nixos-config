# メンテナンス

## 目次

- [アップデート](#アップデート)
- [プロファイル (世代) 管理](#プロファイル-世代-管理)
- [設定参照](#設定参照)

## アップデート

1. 設定ディレクトリへ移動する

```bash
cd ~/nixos-config
```

2. `flake.lock` を更新する

```bash
nix flake update
```

3. ステージングする

```bash
git add .
```

4. アップデートする

- ドライランで警告、エラーが発生しないかを確認する

```bash
nix-dry-build
```

```bash
nix-dry-activate
```

- アップデートを実施する

```bash
nix-boot
```

5. PC を再起動する
6. コミットする

```bash
git commit
```

7. GitHub にプッシュする

```bash
git push
```

## プロファイル (世代) 管理

- プロファイルリストを確認する

```bash
nix-list
```

- ガベージコレクションのタイマーを確認する

```bash
systemctl list-timers
```

> [!TIP]
> UNIT の **nix-gc.timer** がガベージコレクションのタイマー。  
> NEXT: **次回実行日時**, LAST: **前回実行日時**。

## 設定参照

- [コマンドエイリアス](../home/common.nix)
- [ガベージコレクション](../core/garbage-collection.nix)
