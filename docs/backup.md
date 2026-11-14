# バックアップ

指定ディレクトリを外部 HDD へバックアップする。

## 目次

- [不要なファイル削除](#不要なファイル削除)
- [バックアップ実行](#バックアップ実行)
- [設定参照](#設定参照)

## 不要なファイル削除

`~/Downloads` , `~/Pictures/Screenshots` 等のディレクトリ内の不要なファイルを削除する。  
`rm` コマンドではなく `trash put` コマンドを使用すると安全。

## バックアップ実行

1. 外部 HDD を接続する
2. デバイス名を確認する

```bash
lsblk
```

> [!NOTE]
> 以降の手順ではデバイス名を `/dev/sdX` とする。

3. マウントする

```bash
udisksctl mount -b /dev/sdX1
```

> [!NOTE]
> `MOUNTPOINTS` に表示があれば既にマウントされている。

4. バックアップを実行する

```bash
backup-run
```

5. バッファを書き込む

```bash
sync
```

6. アンマウントする

```bash
udisksctl unmount -b /dev/sdX1
```

7. 電源供給を遮断する

```bash
udisksctl power-off -b /dev/sdX
```

8. 外部 HDD を取り外す

## 設定参照

- [バックアップ設定](../home/packages/rclone.nix)
