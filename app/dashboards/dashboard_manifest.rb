class DashboardManifest
  # ダッシュボードに追加するresourceをここで定義
  # 途中で新しいリソースを追加する時はここに！
  # ここで追加されたリソースから管理画面のroutesを作成 (config/routes.rb参照）
  DASHBOARDS = %i[
    :movies,
    :columns,
    :users,
  ].freeze

  # `ROOT_DASHBOARD`
  # at "http://your_site.com/admin"
  #
  # 管理画面ルートパスで表示するものを指定している。
  # 上記 DASHBOARDS で定義したものの1個目を指定することが多いけど、別になんでも良い
  ROOT_DASHBOARD = DASHBOARDS.first
end
