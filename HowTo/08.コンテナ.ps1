# コンテナ.ps1

# 配列
#-------------------------------------------------------------------------------
# @(...)で配列
$array = @("foo", "bar", "baz")
echo $array.GetType()  #=> System.Array

# forループ
for ($i = 0; $i -lt $array.Count; ++$i) {
    echo $array[$i]
}

# カンマ区切りのみでも配列となる
$array = "aaa", "bbb", "ccc"
echo $array.GetType()  #=> System.Array

# foreachループ
foreach ( $item in $array ) {
    echo $item
}

# 要素の削除
# 要素値を$nullとすることで削除相当となる
$array[0] = $null
$array[1] = $null
foreach ( $item in $array ) { echo $item }
# $null要素があるので、サイズは3のまま
echo $array.Count

# 空配列
$array = @()
echo $array.Count


# 連想配列
#-------------------------------------------------------------------------------
# @{key=value; ....}で連想配列(要素区切りは改行又はセミコロン)
$map = @{foo="FOO"; bar="BAR"; baz="BAZ"}

# [key]で要素にアクセスする
echo $map["foo"]
# Item(key)でも要素にアクセスできる
echo $map.Item("bar")


# List
#-------------------------------------------------------------------------------
$list = New-Object 'System.Collections.Generic.List[int]'
foreach( $i in 10..20 ) {
    $list.Add( $i )
}
foreach( $item in $list ) {
    echo $item
}


# Dictionary
#-------------------------------------------------------------------------------
$dictionary = New-Object 'System.Collections.Generic.Dictionary[string, string]'
$dictionary.Add( "key1", "value1" )
$dictionary.Add( "key2", "value2" )
echo $dictionary["key1"]

# C#とは異なり、foreachでDitionaryは列挙できない
foreach ( $item in $dictionary ) {
    echo ("{0}: {1}" -f $item.Key, $item.Value)
}

# 列挙するには、GetEnumerator()を使用する
foreach ( $item in $dictionary.GetEnumerator() ) {
    echo ("{0}: {1}" -f $item.Key, $item.Value)
}
