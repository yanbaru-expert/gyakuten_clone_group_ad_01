document.addEventListener('turbolinks:load', () => {

  // 「折れ線」グラフのデータ
  let lineLabel = gon.chart_label
  let lineData = gon.chart_data
  
  const TODAY = new Date(new Date().setHours(0,0,0,0))
  const THREE_MONTH_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 3, TODAY.getDate())

  // TODO:選択できない日付データを仮で設定
  // 将来的にはユーザーが体調管理データを入力した日付を設定する
  const DISABLE_DATES = ["2020-04-01", "2020-04-10", "2020-04-20", "2020-04-30"]

  // カレンダーの日本語化
  flatpickr.localize(flatpickr.l10ns.ja)

  // カレンダーの表示
  flatpickr('#date-form', {
    // スマートフォンでもカレンダーに「flatpickr」を使用
    disableMobile: true,

    // 3ヶ月前から本日まで選択可
    minDate: THREE_MONTH_AGO,
    maxDate: TODAY,

    // 選択できない日付
    disable: DISABLE_DATES
  })

})
