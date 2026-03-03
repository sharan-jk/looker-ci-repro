view: tablewithdatetime {

  sql_table_name: `takashimori-premium.repro.tablewithdatetime` ;;

  parameter: date_boundary {
    type: date
  }

  dimension_group: date {
    type: time
    timeframes: [date]
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: is_current_period {
    type: yesno
    sql:
      CASE
        WHEN ${date_date} >= {% parameter date_boundary %} THEN TRUE
        ELSE FALSE
      END ;;
  }

  measure: count {
    type: count
  }

}
