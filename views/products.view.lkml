view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

####################################################################################################################################################################
  # Measures with decimals and integers
  measure: retail_sum  {
    type: sum
    sql: ${retail_price} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
#     value_format_name: usd_0
    html: {{rendered_value}} ;;
  }

  # Measures with percentage
  measure: retail_price_percent {
    type: number
    sql: ${TABLE}.retail_price/inventory_items.cost ;;
    value_format: "0.00%"  # <------------   Automatic conversion of Decimal to Percent
    html: {{rendered_value}};;
  }

  parameter: measures_parameter {
    description: "Measure Chooser"
    type: number
    allowed_value: {
      label: "Sum"
      value: "1"
    }
    allowed_value: {
      label: "Percent"
      value: "2"
    }
  }

  measure:selected_measure{
    type: number
    label_from_parameter: measures_parameter
#     value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    value_format: "[${field}='retail_price_percent']0.00%;[${field}='retail_sum' & >=1000000]$0.00,,\"M\";[${field}='retail_sum' & >=1000]$0.00,\"K\";[${field}='retail_sum']$0.00"
#     value_format: "[${field}='Percentage']0.00\%;[${field}='Value']$#,##0.00"
    sql:  {% if measures_parameter._parameter_value == '1' %}
            ${retail_sum}
          {% elsif measures_parameter._parameter_value == '2' %}
            ${retail_price_percent}
          {% endif %};;
#           sql: 1=1 ;;
    html:  {% if measures_parameter._parameter_value == '1' %}
            {{retail_sum._rendered_value}}
          {% elsif measures_parameter._parameter_value == '2' %}
            {{retail_price_percent._rendered_value}}
          {% endif %};;
  }
####################################################################################################################################################################
#   measure:selected_measure{
#     type: number
#     label_from_parameter: measures_parameter
# #     value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
#     sql: {% if measures_parameter._parameter_value == '1' %} ${products.retail_sum}
#       {% elsif measures_parameter._parameter_value == '2' %} ${products.retail_price_percent}
#       {% endif %};;
#       html: {{rendered_value}} ;;
#   }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
