# ファイル共有 (デュアルブート)

NixOS から Windows11 のファイルをコピーする手順。

## 目次

- [高速スタートアップを無効化](#高速スタートアップを無効化)
- [ストレージを確認](#ストレージを確認)
- [マウント](#マウント)
- [ファイルをコピー](#ファイルをコピー)
- [アンマウント](#アンマウント)

## 高速スタートアップを無効化

> [!IMPORTANT]
> 高速スタートアップが有効になっていると、 Windows11 のパーティションがロックされる。　　
> NixOS でマウントの失敗や読み取り専用になる場合がある。

1. Windows11 を起動する。
2. **コントロールパネル** を開く。
3. **ハードウェアとサウンド** を開く。
4. **電源ボタンの動作を変更** を開く。
5. **高速スタートアップを有効にする (推奨)** のチェックを外す。

## ストレージを確認

```bash
lsblk -f
```

> [!NOTE]
> FSTYPE に **ntfs** と表示されているものが Windows11 のパーティション。  
> 以降の手順では `/dev/nvme1n1pX` を対象のパーティションとする。

## マウント

1. マウントディレクトリを作成する。

```bash
sudo mkdir -p /mnt/win_data
```

2. 作成したディレクトリを確認する。

```bash
ls -R /mnt
```

3. Windows11 のパーティションをマウントする。

```bash
sudo mount -t ntfs3 /dev/nvme1n1pX /mnt/win_data
```

4. 正常にマウントされたか確認する。

```bash
lsblk -f
```

> [!NOTE]
> `/dev/nvme1n1pX` の MOUNTPOINTS に `/mnt/win_data` と表示されていれば成功。

```bash
ls /mnt/win_data
```

> [!NOTE]
> **Program Files** や **Users** 等のディレクトリが表示されていれば成功。

## ファイルをコピー

> [!NOTE]
> 例として Windows11 の Documents フォルダ内にある test.txt ファイルを、 NixOS の `~/Documents` ディレクトリへコピーする。

1. コピーする。

```bash
rsync -avh --progress "/mnt/win_data/Users/(ユーザー名)/Documents/test.txt" ~/Documents/.
```

2. バッファを書き込む。

```bash
sync
```

## アンマウント

> [!IMPORTANT]
> アンマウントを実行せずにシャットダウンを行うと、下記の問題が発生する可能性がある。  
> 必ずアンマウントを実行すること。  
> 
> - 書き込みデータが欠ける・破損する。  
> - Windows11 でチェックディスクが実行されたり、ロックや修復処理が入る。  
> - シャットダウン時にマウント状態が解除されるまで終了処理が待機状態になる。

1. アンマウントする。

```bash
sudo umount /mnt/win_data
```

2. 正常にアンマウントされたか確認する。

```bash
lsblk -f
```

> [!NOTE]
> `/dev/nvme1n1pX` の MOUNTPOINTS に何も表示されていなければ成功。
