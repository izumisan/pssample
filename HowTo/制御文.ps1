# 制御文.ps1

# for文
echo "-----for"
for ( $i = 0; $i -lt 5; $i++ ) {
    echo $i
}

# foreach文
echo "-----foreach"
$array = 0..5
foreach ( $i in $array ) {
    echo $i
}

# while文
echo "-----while"
$i = 0
while ( $i -lt 5 ) {
    echo $i
    ++$i
}

# if文
echo "-----if"
for ( $i = 1; $i -le 15; ++$i ) {
    if ( $i % 15 -eq 0 ) {
        echo "FizzBuzz"
    } elseif ( $i % 5 -eq 0 ) {
        echo "Buzz"
    } elseif ( $i % 3 -eq 0 ) {
        echo "Fizz"
    } else {
        echo $i
    }
}

# switch文
echo "-----switch"
foreach ( $i in @(0..4) ) {
    switch ( $i ) {
        1 {
            echo "one"
         }
        2 {
            echo "two"
        }
        3 {
            echo "three"
        }
        Default {
            "unknown"
        }
    }
}

# switch文（ワイルドカード）
echo "-----switch -wildcard"
$items = @("foo1", "foo2", "foo3", "bar1", "bar2")
foreach ( $item in $items ) {
    switch -wildcard ( $item ) {
        "foo*" { echo $item }
        Default {}
    }
}
echo ""

# switch文（正規表現）
echo "-----switch -regex"
$items = @("foo1", "foo2", "foo3", "bar1", "bar2", "baz1", "baz2")
foreach ( $item in $items ) {
    switch -regex ( $item ) {
        "[foo|bar]2" { echo $item }
        Default {}
    }
}
