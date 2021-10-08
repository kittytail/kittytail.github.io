---
layout: page-special
about: Japanese Content Blocker for Safari
subtitle: <a href="https://turndn.github.io/shimayu.html"><img src="/assets/img/Download_on_the_App_Store_Badge_JP_RGB_blk_100317.svg" /></a>
---

#### NekoBlocker は日本語サイト対応の Safari 用コンテンツブロッカーです

#### 日々の Web ブラウジングから不快な広告や面倒なトラッキングを取り除きます

<i class="fas fa-lock fa-3x"></i>
#### プライバシー重視の設計
NekoBlocker は Safari のコンテンツブロッカーを利用することで、自身では一切通信を見ることなく広告やトラッカーをブロックできます

したがって、どのページにアクセスしたかの情報や読み込んだページの内容が NekoBlocker に送られることは**ありません**

<i class="fas fa-list fa-3x"></i>
#### 豊富なルールに対応
合計で 106 K のルールに対応

世界で幅広く使われている[フィルタリングルール](#filters)を Safari のコンテンツブロッカーに対応させています

<i class="fas fa-users fa-3x"></i>
#### 完全日本語対応
お問い合わせは[こちら](/report)から

## 使い方

<i class="fas fa-cogs fa-x"></i>
__設定__ から
<i class="fab fa-safari fa-x"></i>
__Safari__ を選んで、
<i class="fas fa-puzzle-piece fa-x"></i>
__拡張機能__ をタップすると NekoBlocker を設定することができます

詳しい使い方は[__こちら__](/usage)

## コンテンツブロッカーとは

日々の Web ブラウジングで遭遇する広告やページ上には表示されないトラッキングスクリプトを未然にブロックします。
これによって、通信量の削減やより強固なプライバシー保護を期待できます。
実際、角川アスキー総合研究所による[スマホでのコンテンツ視聴に占める広告の比率調査](https://www.lab-kadokawa.com/release/detail.php?id=0099)
では平均4割の通信が広告となっており、広告をブロックする NekoBlocker の導入で日々の通信量の削減が見込めます。
また、NekoBlocker では広告要素の非表示にも対応しており、画面の大部分を覆うような広告を非表示にすることで Web サイトを見やすくする効果もあります。

NekoBlocker ではクラウドソーシング型フィルタリストである EasyPrivacy を利用することで、Web バグやトラッキングスクリプトなどを取り除き、利用者のプライバシーを保護します。
さらに、後述の Safari の拡張機能であるコンテンツブロッカーを活用することで NekoBlocker によるデータの収集は一切行わずに広告やトラッキングスクリプトを取り除くことが可能になっています。

### Safari のコンテンツブロッカーとは

NekoBlocker では利用者のプライバシー保護のために Safari の Content Blocker という拡張機能を利用しています。
NekoBlocker は下図のように共有資源 (Shared resource) を通じて事前に Safari に対してコンテンツブロックのためのルールを伝えます。
このような設計のおかげで、Safari は Web サイトの閲覧時には NekoBlocker とコミュニケーションを取る必要がなくなります。
結果として利用者は閲覧情報などのプライバシーに関するデータを Safari 内で完結させることができます。

![Creating a Content Blocker より引用](https://docs-assets.developer.apple.com/published/df13509e8e/ee97b390-0b9e-47a1-af6e-3bcb41e26aad.png)
([Creating a Content Blocker より引用](https://developer.apple.com/documentation/safariservices/creating_a_content_blocker))

NekoBlocker は VPN を利用した DNS によるコンテンツブロックなどを行わず、全てのコンテンツブロックをこの Safari の機能で行っているため、利用者のサイト閲覧に関する情報を取得することなく Web ページから広告やトラッキングを取り除くことが可能になっています。

## 対応バージョン

* iOS: 15.0 以降
* macOS: TBD

## ライセンス

フィルタのライセンスは [Creative Commons Attribution-ShareAlike 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/) で公開しています。

<a href="https://github.com/nekoblocker">
  <span class="fa-stack fa-lg">
    <i class="fas fa-circle fa-stack-2x"></i>
    <i class="fab fa-github fa-stack-1x fa-inverse"></i>
  </span>
</a> NekoBlocker で利用しているルール

### 改変元のフィルタ<a name="filters"></a>

<a href="https://easylist.to">
  <span class="fa-stack fa-lg">
    <i class="fas fa-circle fa-stack-2x"></i>
    <i class="fas fa-file fa-stack-1x fa-inverse"></i>
  </span>
</a> EasyList


<a href="https://github.com/Yuki2718/adblock">
  <span class="fa-stack fa-lg">
    <i class="fas fa-circle fa-stack-2x"></i>
    <i class="fab fa-github fa-stack-1x fa-inverse"></i>
  </span>
</a> Yuki2718/adblock

