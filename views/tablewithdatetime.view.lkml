view: tablewithdatetime {

  sql_table_name: `takashimori-premium.repro.tablewithdatetime` ;;

  dimension_group: date {
    type: time
    timeframes: [date]
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  # This mimics customer's telecast_date_filter
  filter: date_boundary_filter {
    type: date
  }

  dimension: is_current_period {
    type: yesno
    sql:
      CASE
        WHEN ${date_date} >= {% date_start date_boundary_filter %}
        THEN TRUE
        ELSE FALSE
      END ;;
  }

  measure: current_period_count {
    type: count
    filters: [is_current_period: "Yes"]
  }

}
