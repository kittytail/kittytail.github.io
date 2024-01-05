---
layout: page
title: NekoBlocker とは
permalink: /about/
header-path: banner.liquid
bootstrap: true
tags: [FAQ]
position: 1
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

さらにフィルタの定期的な更新に対応しています

更新情報の取得は<a id="rss" href="/feed.xml" target="_blank">こちら <i class="fas fa-rss fa-x"></i></a> から

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
では平均4割の通信が広告となっており、広告をブロックする NekoBlocker の導入で日々の通信量や Web ページ読み込みの時間の削減が見込めます
[[1](#ref1), [2](#ref2)]。
また、NekoBlocker では広告要素の非表示にも対応しており、画面の大部分を覆うような広告を非表示にすることで Web サイトを見やすくする効果もあります。

また、コンテンツブロッカーは利用者のプライバシーやセキュリティを向上させる効果があることが報告されています
[[3](#ref3), [4](#ref4), [5](#ref5), [6](#ref6)]。
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

{% include license.liquid %}

### References

* <a name="ref1"></a>[1]: Kiran Garimella, Orestis Kostakis, and Michael Mathioudakis. Ad-blocking: A study on performance, privacy and counter-measures. In Proceedings of the 2017 ACM on Web Science Conference, pages 259–262. ACM, 2017.
* <a name="ref2"></a>[2]: Enric Pujol, Oliver Hohlfeld, and Anja Feldmann. Annoyed users: Ads and ad-block usage in the wild. In Proceedings of the 2015 Internet Measurement Conference, pages 93–106. ACM, 2015.
* <a name="ref3"></a>[3]: Arthur Gervais, Alexandros Filios, Vincent Lenders, and Srdjan Capkun. Quantifying web adblocker privacy. Lecture Notes in Computer Science (including subseries Lecture Notes in Artificial Intelligence and Lecture Notes in Bioinformatics), 10493 LNCS:21–42, 2017.
* <a name="ref4"></a>[4]: Georg Merzdovnik, Markus Huber, Damjan Buhov, Nick Nikiforakis, Sebastian Neuner, Martin Schmiedecker, and Edgar Weippl. Block Me if You Can: A Large-Scale Study of Tracker-Blocking Tools. Proceedings - 2nd IEEE European Symposium on Security and Privacy, EuroS and P 2017, pages 319–333, 2017.
* <a name="ref5"></a>[5]: Zhou Li, Kehuan Zhang, Yinglian Xie, Fang Yu, and XiaoFeng Wang. Knowing your enemy: understanding and detecting malicious web advertising. In Proceedings of the 2012 ACM conference on Computer and communications security, pages 674–686. ACM, 2012.
* <a name="ref6"></a>[6]: Apostolis Zarras, Alexandros Kapravelos, Gianluca Stringhini, Thorsten Holz, Christopher Kruegel, and Giovanni Vigna. The dark alleys of madison avenue: Understanding malicious advertisements. In Proceedings of the 2014 Conference on Internet Measurement Conference, pages 373–380. ACM, 2014.
