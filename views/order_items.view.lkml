view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      day_of_week,
      date,
      week,
      month,  # <--------- Select this in the Explore Menu
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.returned_at ;;
  }

  dimension: date_test2 {
    type: date_month      # <--------- Define a dimension of this type for the use case
    sql: ${returned_date};;
  }

  dimension: date_test {
    type: string
    sql: CAST(${returned_date} AS CHAR);;
#     bypass_suggest_restrictions: yes    #  <----- Add either one of these Line 41 or Line 42
#     full_suggestions: yes               #  <----- Add either one of these Line 41 or Line 42
  }

  parameter: max_rank {
    type: number
  }

  # dimension: rank_limit {
  #   type: number
  #   # sql: {% parameter max_rank %} ;;
  #   sql: {% max_rank._parameter_value %} ;;
  # }


#   filter: date_picker {
  parameter: date_picker {
    description: "Use with the Category Date"
    type: string
    suggest_dimension: order_items.date_test
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
