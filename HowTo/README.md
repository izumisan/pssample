# PowerShell入門

# overview

- [HelloWorld](01.HelloWorld.ps1)
- [変数](02.変数.ps1)
- [文字列](03.文字列.ps1)
- [制御文](04.制御文.ps1)
- [関数](05.関数.ps1)
- [クラス(基本)](06.クラス.ps1)
- [クラス(継承)](06.クラス2.ps1)
- [ファイル](07.ファイル.ps1)
- [コンテナ](08.コンテナ.ps1)
- [スクリプト](09.スクリプト.ps1)
- [.NET API](10..NET_API.ps1)
- [コマンドレット](11.コマンドレット.ps1)
- [モジュール](12.モジュール.ps1)
- [C#コード](13.CSharpコード.ps1)

# Tips

## PowerShellのバージョンを確認する

```ps
> $PSVersionTable
```

## エラー処理

- コマンドレットで例外(エラー)が発生してもデフォルト環境では処理は中断せずに継続される
- 同様に、デフォルト環境では`try～catch`でコマンドレットの例外は補足できない
- エラーで処理を中断（`try～catch`で例外を補足）するには、`$ErrorActionPreference`を設定する必要がある
    ```ps
    # エラーで処理を中断するようにする
    $ErrorActionPreference = "Stop"
    ```
- `$ErrorActionPreference` の設定値は以下のとおり
    - Stop
    - Inquire
    - Continue (既定値)
    - Suspend
    - SilentlyContinue
