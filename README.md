# counter-demo-flutter

## 概要
riverpod + hooks_riverpod を使ったカウンターのデモアプリ。教則用。

このリポジトリの並びに、 [counter-demo-nuxt](https://github.com/torico-tokyo/counter-demo-nuxt) というプロジェクトがあり、まったく同じ機能を提供している。

[counter-demo-nuxt の master](https://github.com/torico-tokyo/counter-demo-nuxt) ブランチ では、Vuex + typed-vuex で[ストア](https://github.com/torico-tokyo/counter-demo-nuxt/blob/master/store/counter.ts)を提供している。

対して、こちらの Flutter アプリは、 [riverpod](https://pub.dev/packages/riverpod) + [hooks_riverpod](https://pub.dev/packages/hooks_riverpod) で状態管理をしている。

riverpod + hooks_riverpod での状態管理は、 vuex の状態管理と 1:1 で書けるので、比較すると非常に理解が早い。
