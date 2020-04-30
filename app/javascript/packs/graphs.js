document.addEventListener('turbolinks:load', () => {

  const convertDate = (date) => new Date(new Date(date).setHours(0,0,0,0))

  const TODAY = convertDate(new Date())
  const A_WEEK_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth(), TODAY.getDate() - 6)
  const TWO_WEEKS_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth(), TODAY.getDate() - 13)
  const A_MONTH_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 1, TODAY.getDate() + 1)
  const THREE_MONTHS_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 3, TODAY.getDate() + 1)

  // グラフを描画する場所を取得
  const chartTemperatureContext = document.getElementById("chart-temp").getContext('2d')
  const chartWeightContext = document.getElementById("chart-weight").getContext('2d')

  // 期間を指定してグラフを描画する
  const drawGraph = (from, to) => {
    // from から to までの期間のデータに絞る
    let records = gon.records.filter((record) => {
      let date = convertDate(record.date)
      return from <= date && date <= to
    })

    // 日付のみのデータを作成
    let dates = records.map((record) => {
        return record.date.replace(/^\d+-0*(\d+)-0*(\d+)$/, '$1/$2')
    })

    // 体温および体重のデータを作成
    let temperatures = records.map((record) => record.temperature)
    let weights = records.map((record) => record.weight)

    let temperatureData = {
        labels: dates,
        datasets: [{
            label: '体温(度)',
            data: temperatures,
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
            spanGaps: true,
            lineTension: 0
        }]
    }

    let weightData = {
        labels: dates,
        datasets: [{
            label: '体重(kg)',
            data: weights,
            backgroundColor: 'rgba(99, 255, 132, 0.2)',
            borderColor: 'rgba(99, 255, 132, 1)',
            borderWidth: 1,
            spanGaps: true,
            lineTension: 0
        }]
    }

    let temperatureOption = {
        tooltips: {
            callbacks: {
                // ホバー（スマホならタップ）時のラベル表示を変更
                title: function (tooltipItems) {
                    return tooltipItems[0].xLabel.replace(/^(\d+).(\d+)$/, ' $1 月 $2 日')
                },
                label: function (tooltipItem) {
                    return '体温: ' + tooltipItem.yLabel + '度'
                }
            }
        }
    }

    let weightOption = {
        tooltips: {
            callbacks: {
                // ホバー（スマホならタップ）時のラベル表示を変更
                title: function (tooltipItems) {
                    return tooltipItems[0].xLabel.replace(/^(\d+).(\d+)$/, ' $1 月 $2 日')
                },
                label: function (tooltipItem) {
                    return '体重: ' + tooltipItem.yLabel + 'kg'
                }
            }
        }
    }

    new Chart(chartTemperatureContext, {
        type: 'line',
        data: temperatureData,
        options: temperatureOption
    })

    new Chart(chartWeightContext, {
        type: 'line',
        data: weightData,
        options: weightOption
    })

  }

  // グラフの初期表示
  drawGraph(A_WEEK_AGO, TODAY)

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
    minDate: THREE_MONTHS_AGO,
    maxDate: TODAY,

    // 選択できない日付
    disable: DISABLE_DATES
  })

})
