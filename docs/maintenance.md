# メンテナンス

## 目次

- [アップデート](#アップデート)
- [プロファイル管理](#プロファイル管理)

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

- ドライランでエラーが発生しないかを確認する

```bash
nh os boot --dry
```

- アップデートを実施する

```bash
nh os boot
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

## プロファイル管理

> [!NOTE]
> ガベージコレクションには **NH** を使用している。  
> 設定は [core/nh.nix](../core/nh.nix) を参照。

- 世代リストを確認する
```bash
sudo nix-env --profile /nix/var/nix/profiles/system --list-generations
```
