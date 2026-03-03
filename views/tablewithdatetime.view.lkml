view: tablewithdatetime {

  sql_table_name: `takashimori-premium.repro.tablewithdatetime` ;;

  dimension_group: date {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
  }

}
