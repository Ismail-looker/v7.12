- dashboard: testing_merged_results_and_table_calcs_with_comments
  title: Testing Merged Results and Table Calcs with comments
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Merged Results and Table Calcs with comments
    title: Merged Results and Table Calcs with comments
    merged_queries:
    - model: ismail_look
      explore: order_items
      type: table
      fields: [products.id, products.brand, products.item_name, products.count]
      sorts: [products.id desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: ismail_look
      explore: order_items
      type: table
      fields: [order_items.order_id, products.id, products.department, users.count]
      sorts: [products.id desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: products.id
        source_field_name: products.id
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    type: looker_grid
    dynamic_fields: [{table_calculation: comment_with_strings, label: Comment with
          strings, expression: "concat(\n  concat(${products.brand},\" - \",${products.item_name}),\n\
          \  \" # \", #Some comment T+2 here in the middle\n  concat(${products.id}, \"\
          - \", ${products.brand})\n)\n", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}, {table_calculation: comment_in_between_addition,
        label: Comment in between Addition, expression: "(coalesce(${products.count},0)*-1)\n\
          +\n(coalesce(${users.count},0)*-1)\n+ #comment T+2 here\ncoalesce(\n  if(is_null(${products.count}),\n\
          \    offset(${products.count},1),\n    ${users.count}\n  )\n,0)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    row: 0
    col: 0
    width: 24
    height: 10
