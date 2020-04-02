view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }

  dimension_group: week_start_day {
    type: time
    convert_tz: no
    hidden: yes
    timeframes: [
      date
      ,day_of_week
    ]
    sql:   DATE(CURDATE() + INTERVAL (1 - DAYOFWEEK(CURDATE())) DAY);;
    # Assumes Week starts on Sunday, Verify Week start day
  }

  dimension: thursday_this_week {
    type: date
    convert_tz: no
    hidden: yes
    sql:   DATE(CURDATE() + INTERVAL (5 - DAYOFWEEK(CURDATE())) DAY);;
    # Assumes Week starts on Sunday
  }

  dimension: thursday_last_week {
    type: date
    convert_tz: no
    hidden: yes
    sql:   DATE(CURDATE() + INTERVAL (-2 - DAYOFWEEK(CURDATE())) DAY);;
  }

  dimension_group: revenue_thursday {
    group_label: "Revenue Date"
#     group_item_label: "Revenue Day"
    label: "Current Revenue"
    type: time
    convert_tz: no
    timeframes: [
      date
      ,day_of_week  # <-------- Can comment out this line after tests
    ]
    sql:  CASE
            WHEN (CURDATE() < ${thursday_this_week}) THEN ${thursday_last_week}
            WHEN (CURDATE() = ${thursday_this_week}) THEN ${thursday_this_week}
            ELSE ${thursday_last_week}
          END;;
  }


  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Date"
  }

  dimension: dynamic_timeframe {
    label_from_parameter: timeframe_picker
    type: date
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN ${orders.created_date}
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${orders.created_week}
    WHEN{% parameter timeframe_picker %} = 'Month' THEN ${orders.created_month}
    WHEN{% parameter timeframe_picker %} = 'Quarter' THEN ${orders.created_quarter}
    WHEN{% parameter timeframe_picker %} = 'Year' THEN ${orders.created_year}
    END ;;
  }

#   view: cte_replacement {
#     derived_table: {
#       sql: SELECT id FROM analyst ;;
#     }
#   }
#
#   view: users_b {
#     derived_table: {
#       sql: SELECT all_cards.json body_after.txt body_before.txt body_during.txt ids.txt jq main.sh Procfile README.md requirements.txt runtime.txt FROM ${cte_replacement.SQL_TABLE_NAME} ;;
#     }
#   }

}
