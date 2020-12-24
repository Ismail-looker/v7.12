- dashboard: dx5506_multiple_values_filter_suggestion
  title: DX-5506- Multiple values Filter suggestion
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: DX-5506 Tile
    name: DX-5506 Tile
    model: ismail_look
    explore: order_items
    type: looker_grid
    fields: [products.brand, orders.count, order_items.order_id]
    sorts: [orders.count desc]
    limit: 10
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 7
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: ismail_look
    explore: order_items
    listens_to_filters: []
    field: products.brand
