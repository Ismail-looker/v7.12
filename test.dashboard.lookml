- dashboard: test
  title: BILD Daily Traffic (mobil optimiert)
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Logo Dynamic
    name: Logo Dynamic
    model: spring
    explore: f_traffic
    type: single_value
    fields: [d_objects.object_group, d_objects.object_group_image]
    filters:
      d_objects.object_group: BILD
    sorts: [d_objects.object_group]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: '"Daily
          Traffic"', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: Europe/Berlin
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: false
    single_value_title: Daily Traffic
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: "#000000", color_application: {collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb,
          palette_id: 040400f6-5004-4a05-b868-e34524e4607b}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_types: {}
    hidden_fields: [d_objects.object_group]
    listen: {}
    row: 0
    col: 0
    width: 2
    height: 3
  - title: Datum Gestern
    name: Datum Gestern
    model: spring
    explore: f_traffic
    type: single_value
    fields: [d_dates.date_date, f_traffic.sum_orders, d_dates.date_formatted]
    filters:
      d_dates.date_date: 1 days ago for 1 days
    sorts: [d_dates.date_date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [f_traffic.sum_orders, d_dates.date_date]
    row: 0
    col: 2
    width: 6
    height: 3
  - name: ''
    type: text
    body_text: "| **Erläuterungen**  |                  | \n| ----------------------\
      \ | -------------  |\n|**Total Visits:**| Die Visits für Web und Mobile beziehen\
      \ sich auf IVW Daten, die Visits für die Apps kommen aus Adobe (da die IVW Daten\
      \ nachträglich runterkorrigiert werden)| \n|**Orders:**| Die Orders via Article\
      \ beziehen sich auf Adobe Daten| \n|**Media Views:**| Die Mediaviews beziehen\
      \ sich auf Adobe Daten|\n\n|**Monatswert:**| Die Monatswerte für Visits und\
      \ Media Views beinhalten eine Hochrechnung für den aktuellen Monat|"
    row: 189
    col: 0
    width: 11
    height: 7
  - title: DailyTrafficTitle
    name: DailyTrafficTitle
    model: spring
    explore: f_traffic
    type: single_value
    fields: [d_content_pages.daily_traffic_40]
    filters:
      d_dates.date_date: 1 days ago for 1 days
    sorts: [d_content_pages.daily_traffic_40]
    limit: 500
    dynamic_fields: [{dimension: title, label: Title, expression: 'concat("Daily Content  ",
          "")', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: Europe/Berlin
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 0
    col: 8
    width: 16
    height: 3
  - name: <font color="#000000" size="10" weight="bold"><strong>Visits</strong></font>
    type: text
    title_text: <font color="#000000" size="10" weight="bold"><strong>Visits</strong></font>
    row: 3
    col: 0
    width: 24
    height: 2
  - name: IVW Visits Verlauf 28 Tage
    title: IVW Visits Verlauf 28 Tage
    merged_queries:
    - model: spring
      explore: f_ivw_measures_with_plan_data
      type: looker_column
      fields: [f_ivw_measures_with_plan_data.sum_visits_plan, web, mobile, app, d_dates.date_date]
      fill_fields: [d_dates.date_date]
      filters:
        d_objects.object_name: BILD,SPORT BILD
        d_dates.date_date: 28 days ago for 28 days
        d_objects.object_group: BILD
      sorts: [d_dates.date_date]
      limit: 500
      column_limit: 50
      dynamic_fields: [{measure: web, based_on: f_ivw_measures_with_plan_data.sum_visits,
          type: count_distinct, label: Web, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
        {measure: mobile, based_on: f_ivw_measures_with_plan_data.sum_visits, type: count_distinct,
          label: Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: '${d_platforms.platform}="Mobile"'},
        {measure: app, based_on: f_ivw_measures_with_plan_data.sum_visits, type: count_distinct,
          label: App, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: "${d_platforms.platform}=\"App\"\n\
            AND ${d_dates.day}<add_days(-3, now())"}]
      query_timezone: Europe/Berlin
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: normal
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      color_application:
        collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
        palette_id: 040400f6-5004-4a05-b868-e34524e4607b
        options:
          steps: 5
      y_axes: [{label: '', orientation: left, series: [{axisId: web, id: web, name: Web},
            {axisId: mobile, id: mobile, name: Mobile}, {axisId: app, id: app, name: App}],
          showLabels: false, showValues: true, valueFormat: "#,##0, \\K\\", unpinAxis: false,
          tickDensity: default, type: linear}, {label: '', orientation: left, series: [
            {axisId: f_ivw_measures_with_plan_data.sum_visits_plan, id: f_ivw_measures_with_plan_data.sum_visits_plan,
              name: Sum Visits - Plan}], showLabels: false, showValues: false, unpinAxis: false,
          tickDensity: default, tickDensityCustom: 5, type: linear}]
      series_types:
        f_ivw_measures_with_plan_data.sum_visits_plan: line
      x_axis_datetime_label: "%d-%m"
      reference_lines: []
      x_axis_label_rotation: -90
      defaults_version: 1
    - model: spring
      explore: f_traffic
      type: looker_column
      fields: [app_adobe, d_dates.date_date]
      fill_fields: [d_dates.date_date]
      filters:
        d_dates.date_date: 2 days ago for 2 days
        d_objects.object_group: BILD
        d_objects.object_name: BILD,SPORT BILD
      sorts: [d_dates.date_date desc]
      limit: 500
      dynamic_fields: [{measure: app_adobe, based_on: f_traffic.sum_visits_day, type: count_distinct,
          label: App Adobe, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
      query_timezone: Europe/Berlin
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      join_fields:
      - field_name: d_dates.date_date
        source_field_name: d_dates.date_date
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: 040400f6-5004-4a05-b868-e34524e4607b
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: f_ivw_measures_with_plan_data.sum_visits_plan,
            id: f_ivw_measures_with_plan_data.sum_visits_plan, name: Sum Visits -
              Plan}, {axisId: web, id: web, name: Web}, {axisId: mobile, id: mobile,
            name: Mobile}, {axisId: apps, id: apps, name: Apps}], showLabels: true,
        showValues: true, valueFormat: "#,##0, \\K\\", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    font_size: '40'
    label_value_format: "##.#,,"
    series_types:
      f_ivw_measures_with_plan_data.sum_visits_plan: line
    point_style: circle
    series_colors:
      web: "#df0029"
      mobile: "#0089ca"
      app_2: "#009f62"
      f_ivw_measures_with_plan_data.sum_visits_plan: "#dadada"
    series_labels:
      web: Desktop
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    type: looker_column
    hidden_fields: [app, app_adobe]
    dynamic_fields: [{table_calculation: app_2, label: App, expression: 'coalesce(${app},0)+
          coalesce(${app_adobe},0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    row: 14
    col: 0
    width: 24
    height: 13
  - name: <font color="#000000" size="10" weight="bold"><strong>Media Views</strong></font>
    type: text
    title_text: <font color="#000000" size="10" weight="bold"><strong>Media Views</strong></font>
    row: 39
    col: 0
    width: 24
    height: 2
  - title: Orders -  Monat
    name: Orders -  Monat
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, f_traffic.sum_orders_via_article, d_dates.date_month]
    filters:
      d_objects.object_name: BILD
      d_objects.object_group: BILD
      d_platforms.platform: AMP,Desktop,Mobile
    sorts: [f_traffic.sum_orders_via_article desc]
    limit: 500
    dynamic_fields: [{table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø", expression: "((${f_traffic.sum_orders_via_article_yesterday})\
          \ / \n  (${f_traffic.avg_orders_via_article_last_6_weeks})) -1", value_format: !!null '',
        value_format_name: percent_0, is_disabled: true, _kind_hint: measure, _type_hint: number}]
    filter_expression: "\n(extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))\n\
      \n)\nAND \nextract_years(${d_dates.date_month})=extract_years(add_days(-1,now()))\n\
      \n"
    query_timezone: Europe/Berlin
    hidden_fields: [vormonat_2, d_objects.object_group, d_dates.date_month]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_orders_via_article: "#000000"
    show_title_f_traffic.sum_orders_via_article: true
    title_override_f_traffic.sum_orders_via_article: aktueller Monat MTD (ohne Prognose)
    title_placement_f_traffic.sum_orders_via_article: below
    value_format_f_traffic.sum_orders_via_article: ''
    title_overrride_f_traffic.sum_orders_via_article: aktueller Monat MTD (ohne Prognose)
    style_f_traffic.sum_orders_via_article_yesterday: "#000000"
    show_title_f_traffic.sum_orders_via_article_yesterday: true
    title_overrride_f_traffic.sum_orders_via_article_yesterday: Orders via Article
    title_placement_f_traffic.sum_orders_via_article_yesterday: below
    value_format_f_traffic.sum_orders_via_article_yesterday: ''
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    single_value_title: Orders via Article
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    title_hidden: true
    listen: {}
    row: 78
    col: 12
    width: 12
    height: 11
  - title: Top 5 Plus Article - Gestern
    name: Top 5 Plus Article - Gestern
    model: spring
    explore: f_traffic
    type: looker_grid
    fields: [d_content_pages.content_id, d_content_pages.headline_with_url, d_dates.date_date,
      d_content_pages.ressort, f_traffic.sum_orders_via_article, d_content_pages.publicaten_date_ddmm]
    filters:
      d_objects.object_name: BILD
      d_dates.date_date: 1 days ago for 1 days
      f_traffic.sum_orders_via_article: ">0"
      d_objects.object_group: BILD
      f_traffic.page_premium_status: 'true'
    sorts: [f_traffic.sum_orders_via_article desc]
    limit: 1000
    column_limit: 50
    row_total: right
    dynamic_fields: [{table_calculation: limit, label: Limit, expression: row() <=
          5, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}, {measure: mobile, based_on: f_traffic.sum_orders_via_article,
        type: count_distinct, label: Mobile, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="Mobile"'},
      {measure: desktop, based_on: f_traffic.sum_orders_via_article, type: count_distinct,
        label: Desktop, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
      {measure: app, based_on: f_traffic.sum_orders_via_article, type: count_distinct,
        label: App, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
    query_timezone: Europe/Berlin
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '35'
    rows_font_size: '34'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns: {}
    column_order: ["$$$_row_numbers_$$$", d_content_pages.headline_with_url, f_traffic.sum_orders_via_article]
    show_totals: true
    show_row_totals: true
    series_labels:
      f_traffic.sum_orders_via_article: Orders Article
      d_content_pages.headline_with_url: Article
      d_content_pages.publicaten_date_ddmm: Publication Date
    series_column_widths:
      d_dates.date_date: 127
      rang: 59
      d_contents.headline: 313
      d_contents.headline_with_url: 700
      d_contents.content_id: 120
      d_contents.ressort: 150
      d_content_pages.content_id: 154
      d_content_pages.publication_date: 367
      d_content_pages.ressort: 200
      d_content_pages.publicaten_date_ddmm: 200
      f_traffic.sum_orders_via_article: 400
    series_cell_visualizations:
      f_traffic.sum_page_views:
        is_active: false
      f_traffic.sum_orders_via_article:
        is_active: false
        value_display: true
    series_text_format:
      d_contents.headline_with_url:
        fg_color: "#000000"
      d_contents.content_id:
        fg_color: "#000000"
      d_contents.ressort:
        fg_color: "#000000"
      d_contents.publication_date:
        fg_color: "#000000"
      f_traffic.sum_orders_via_article:
        fg_color: "#000000"
        bold: true
      d_platforms.platform:
        fg_color: "#000000"
      desktop:
        fg_color: "#000000"
      mobile:
        fg_color: "#000000"
      app:
        fg_color: "#000000"
      d_content_pages.content_id:
        fg_color: "#000000"
      d_content_pages.headline_with_url:
        fg_color: "#000000"
      d_content_pages.publication_date:
        fg_color: "#000000"
      d_content_pages.ressort:
        fg_color: "#000000"
      d_content_pages.publicaten_date_ddmm:
        fg_color: "#000000"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    header_font_color: "#000000"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#750E64",
        font_color: !!null '', color_application: {collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb,
          palette_id: 040400f6-5004-4a05-b868-e34524e4607b}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    hidden_fields: [rang, d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.publicaten_date_ddmm]
    series_types: {}
    hidden_points_if_no: [limit]
    y_axes: []
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 99
    col: 0
    width: 24
    height: 12
  - title: Order Verlauf BILD
    name: Order Verlauf BILD
    model: spring
    explore: f_traffic
    type: looker_column
    fields: [d_platforms.platform, d_dates.date_date, f_traffic.sum_orders_via_article]
    pivots: [d_platforms.platform]
    fill_fields: [d_dates.date_date]
    filters:
      d_objects.object_name: BILD
      d_dates.date_date: 28 days ago for 28 days
      d_objects.object_group: BILD
      d_platforms.platform: Desktop,Mobile
    sorts: [d_platforms.platform 0, d_dates.date_date]
    limit: 500
    query_timezone: Europe/Berlin
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: 040400f6-5004-4a05-b868-e34524e4607b
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: AMP - f_traffic.sum_orders_via_article,
            id: AMP - f_traffic.sum_orders_via_article, name: AMP}, {axisId: App -
              f_traffic.sum_orders_via_article, id: App - f_traffic.sum_orders_via_article,
            name: App}, {axisId: Desktop - f_traffic.sum_orders_via_article, id: Desktop
              - f_traffic.sum_orders_via_article, name: Desktop}, {axisId: Mobile
              - f_traffic.sum_orders_via_article, id: Mobile - f_traffic.sum_orders_via_article,
            name: Mobile}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '45'
    series_types: {}
    series_colors:
      Mobile - f_traffic.sum_orders_via_article: "#0089ca"
      Desktop - f_traffic.sum_orders_via_article: "#df0029"
      Desktop - f_traffic.sum_orders: "#df0029"
      Mobile - f_traffic.sum_orders: "#0089ca"
    x_axis_datetime_label: "%d-%m"
    x_axis_label_rotation: -90
    defaults_version: 1
    title_hidden: true
    listen: {}
    row: 89
    col: 0
    width: 24
    height: 10
  - name: <font color="#000000" size="10" weight="bold"><strong>Orders via Article</strong></font>
    type: text
    title_text: <font color="#000000" size="10" weight="bold"><strong>Orders via Article</strong></font>
    row: 76
    col: 0
    width: 24
    height: 2
  - title: Orders -  Gestern (copy)
    name: Orders -  Gestern (copy)
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, f_traffic.sum_orders_via_article_yesterday, f_traffic.avg_orders_via_article_last_6_weeks]
    filters:
      d_objects.object_name: BILD
      d_dates.date_date: 7 weeks
      d_objects.object_group: BILD
      d_platforms.platform: AMP,Desktop,FBIA,Mobile
    sorts: [f_traffic.sum_orders_via_article_yesterday desc]
    limit: 500
    dynamic_fields: [{table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø", expression: "((${f_traffic.sum_orders_via_article_yesterday})\
          \ / \n  (${f_traffic.avg_orders_via_article_last_6_weeks})) -1", value_format: !!null '',
        value_format_name: percent_0, is_disabled: false, _kind_hint: measure, _type_hint: number}]
    query_timezone: Europe/Berlin
    hidden_fields: [vormonat_2, 6_weeks_o, f_traffic.avg_orders_via_article_last_6_weeks,
      d_dates.date_month, d_objects.object_group]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_orders_via_article_yesterday: "#000000"
    show_title_f_traffic.sum_orders_via_article_yesterday: true
    title_override_f_traffic.sum_orders_via_article_yesterday: Gestern
    title_placement_f_traffic.sum_orders_via_article_yesterday: below
    value_format_f_traffic.sum_orders_via_article_yesterday: ''
    title_overrride_f_traffic.sum_orders_via_article_yesterday: Gestern
    show_comparison_f_traffic.avg_orders_via_article_last_6_weeks: false
    comparison_style_f_traffic.avg_orders_via_article_last_6_weeks: percentage_change
    comparison_show_label_f_traffic.avg_orders_via_article_last_6_weeks: true
    comparison_label_f_traffic.avg_orders_via_article_last_6_weeks: "∆ Avg 6 Weeks"
    comparison_label_placement_f_traffic.avg_orders_via_article_last_6_weeks: below
    style_f_traffic.avg_orders_via_article_last_6_weeks: "#3B4245"
    show_title_f_traffic.avg_orders_via_article_last_6_weeks: true
    title_placement_f_traffic.avg_orders_via_article_last_6_weeks: above
    value_format_f_traffic.avg_orders_via_article_last_6_weeks: ''
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    single_value_title: Orders via Article
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 0
    title_hidden: true
    listen: {}
    row: 78
    col: 0
    width: 12
    height: 6
  - title: Media Views Yesterday - new
    name: Media Views Yesterday - new
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, f_traffic.sum_media_views]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 1 days ago for 1 days
      d_objects.object_group: BILD
    sorts: [f_traffic.sum_media_views desc]
    limit: 500
    dynamic_fields: [{measure: media_views_webmobile_gestern, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Views Web/Mobile gestern, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}!=\"\
          App\"\nAND\n(${f_traffic.is_yesterday}=yes)"}, {measure: media_content_views_app_gestern,
        based_on: f_traffic.sum_content_media_views, type: count_distinct, label: Media
          Content Views App gestern, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          App\"\nAND\n${f_traffic.is_yesterday}=yes"}, {measure: media_views_webmobile,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          Web/Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}!="App"

          '}, {measure: media_content_views_app, based_on: f_traffic.sum_content_media_views,
        type: count_distinct, label: Media Content Views App, value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"

          '}]
    query_timezone: Europe/Berlin
    hidden_fields: [media_content_views, media_views_ohne_app, media_views_ohne_app_copy,
      media_content_views_copy, calculation_4_copy, calculation_4_copy_copy, d_objects.object_group]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_media_views: "#000000"
    show_title_f_traffic.sum_media_views: true
    title_override_f_traffic.sum_media_views: Gestern
    title_placement_f_traffic.sum_media_views: below
    value_format_f_traffic.sum_media_views: '#,##0.00,, "mio"'
    title_overrride_f_traffic.sum_media_views: Gestern
    style_media_views_gestern_summe: "#000000"
    show_title_media_views_gestern_summe: true
    title_overrride_media_views_gestern_summe: Gestern
    title_placement_media_views_gestern_summe: below
    value_format_media_views_gestern_summe: '#.##,, "mio"'
    show_comparison_avg_6_weeks: false
    comparison_style_avg_6_weeks: percentage_change
    comparison_show_label_avg_6_weeks: true
    comparison_label_placement_avg_6_weeks: below
    style_avg_6_weeks: "#3B4245"
    show_title_avg_6_weeks: true
    title_placement_avg_6_weeks: above
    value_format_avg_6_weeks: ''
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    style_d_zum_6_wochen_durchschnitt: "#000000"
    show_title_d_zum_6_wochen_durchschnitt: true
    title_placement_d_zum_6_wochen_durchschnitt: below
    value_format_d_zum_6_wochen_durchschnitt: ''
    show_comparison_d_zum_6_wochen_durchschnitt: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Media Views
    value_format: "#,##0, k"
    style_calculation_4: "#000000"
    show_title_calculation_4: true
    title_overrride_calculation_4: Media Views
    title_placement_calculation_4: below
    value_format_calculation_4: ''
    style_abweichung: "#000000"
    show_title_abweichung: true
    title_overrride_abweichung: "∆ 6 Weeks ø"
    title_placement_abweichung: below
    value_format_abweichung: ''
    show_comparison_abweichung: false
    series_types: {}
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    note_state: collapsed
    note_display: below
    note_text: ''
    title_hidden: true
    listen: {}
    row: 41
    col: 0
    width: 12
    height: 6
  - name: <font color="#000000" size="10" weight="bold"><strong>Entries via Search</strong></font>
    type: text
    title_text: <font color="#000000" size="10" weight="bold"><strong>Entries via
      Search</strong></font>
    row: 111
    col: 0
    width: 24
    height: 2
  - name: <font color="#000000" size="10" weight="bold"><strong>Entries via Facebook</strong></font>
    type: text
    title_text: <font color="#000000" size="10" weight="bold"><strong>Entries via
      Facebook</strong></font>
    row: 146
    col: 0
    width: 24
    height: 2
  - title: Media Views Verlauf
    name: Media Views Verlauf
    model: spring
    explore: f_traffic
    type: looker_column
    fields: [d_objects.object_group, d_dates.date_date, f_traffic.sum_content_media_views,
      media_views_web, media_views_mobile, media_views_app]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 28 days ago for 28 days
      d_objects.object_group: BILD
    sorts: [d_dates.date_date desc]
    limit: 500
    dynamic_fields: [{measure: media_views_webmobile_gestern, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Views Web/Mobile gestern, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}!=\"\
          App\"\nAND\n(${f_traffic.is_yesterday}=yes)"}, {measure: media_content_views_app_gestern,
        based_on: f_traffic.sum_content_media_views, type: count_distinct, label: Media
          Content Views App gestern, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          App\"\nAND\n${f_traffic.is_yesterday}=yes"}, {measure: media_views_web,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          Web, value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"

          '}, {measure: media_views_app, based_on: f_traffic.sum_media_views, type: count_distinct,
        label: Media Views App, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"

          '}, {measure: media_views_mobile, based_on: f_traffic.sum_media_views, type: count_distinct,
        label: Media Views Mobile, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="Mobile"

          '}]
    query_timezone: Europe/Berlin
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    font_size: '40'
    label_value_format: "##0.#0,,"
    series_types: {}
    series_colors:
      media_views_web: "#df0029"
      media_content_views_app: "#009f62"
      media_views_mobile: "#0089ca"
    series_labels: {}
    hidden_fields: [f_traffic.sum_content_media_views, media_content_views, media_views_ohne_app,
      media_views_ohne_app_copy, media_content_views_copy, calculation_4_copy, calculation_4_copy_copy,
      media_views_webmobile, d_objects.object_group]
    hidden_points_if_no: []
    font_size_main: '35'
    style_media_views_gestern_summe: "#000000"
    show_title_media_views_gestern_summe: true
    title_overrride_media_views_gestern_summe: Yesterday
    title_placement_media_views_gestern_summe: below
    value_format_media_views_gestern_summe: '#.##,, "mio"'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    style_d_zum_6_wochen_durchschnitt: "#000000"
    show_title_d_zum_6_wochen_durchschnitt: true
    title_placement_d_zum_6_wochen_durchschnitt: below
    value_format_d_zum_6_wochen_durchschnitt: ''
    show_comparison_d_zum_6_wochen_durchschnitt: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Media Views
    value_format: "#,##0, k"
    style_calculation_4: "#000000"
    show_title_calculation_4: true
    title_overrride_calculation_4: Media Views
    title_placement_calculation_4: below
    value_format_calculation_4: ''
    style_abweichung: "#000000"
    show_title_abweichung: true
    title_overrride_abweichung: "∆ 6 Weeks ø"
    title_placement_abweichung: below
    value_format_abweichung: ''
    show_comparison_abweichung: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    note_state: collapsed
    note_display: below
    note_text: ''
    title_hidden: true
    listen: {}
    row: 52
    col: 0
    width: 24
    height: 13
  - title: IVW Vists aktueller Monat
    name: IVW Vists aktueller Monat
    model: spring
    explore: f_ivw_measures_with_plan_data
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_dates.month, f_ivw_measures_with_plan_data.sum_visits_forecast, f_ivw_measures_with_plan_data.sum_visits,
      f_ivw_measures_with_plan_data.sum_visits_plan]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_objects.object_group: BILD
    sorts: [d_dates.month desc]
    limit: 500
    dynamic_fields: [{table_calculation: plan, label: "∆ Plan", expression: "((${f_ivw_measures_with_plan_data.sum_visits_forecast})\
          \ / (offset(${f_ivw_measures_with_plan_data.sum_visits_plan},1))) -1", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: vormonat, label: Vormonat, expression: "(offset(${f_ivw_measures_with_plan_data.sum_visits},\
          \ 1))", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: vormonat_2, label: "∆ Vormonat",
        expression: "((${f_ivw_measures_with_plan_data.sum_visits_forecast}) / (offset(${f_ivw_measures_with_plan_data.sum_visits},1)))\
          \ -1", value_format: !!null '', value_format_name: percent_2, is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {measure: visits_vormonat, based_on: f_ivw_measures_with_plan_data.sum_visits,
        type: count_distinct, label: Visits Vormonat, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_dates.day}=add_months(-1,\
          \ now())"}]
    filter_expression: extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))
    query_timezone: Europe/Berlin
    hidden_fields: [d_dates.month, f_ivw_measures_with_plan_data.sum_visits, f_ivw_measures_with_plan_data.sum_visits_plan,
      vormonat_2, plan, avg_6_weeks, vormonat]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '30'
    orientation: auto
    style_f_ivw_measures_with_plan_data.sum_visits_forecast: "#000000"
    show_title_f_ivw_measures_with_plan_data.sum_visits_forecast: true
    title_override_f_ivw_measures_with_plan_data.sum_visits_forecast: Monatsprognose
    title_placement_f_ivw_measures_with_plan_data.sum_visits_forecast: below
    value_format_f_ivw_measures_with_plan_data.sum_visits_forecast: '#,, "mio"'
    title_overrride_f_ivw_measures_with_plan_data.sum_visits_forecast: Monatsprognose
    show_comparison_vormonat: false
    comparison_style_vormonat: percentage_change
    comparison_show_label_vormonat: true
    comparison_label_vormonat: "∆ Vormonat"
    comparison_label_placement_vormonat: below
    style_vormonat: "#000000"
    show_title_vormonat: true
    title_placement_vormonat: below
    value_format_vormonat: ''
    style_plan: "#000000"
    show_title_plan: true
    title_placement_plan: below
    value_format_plan: +0% "▲";-0% "▼";
    show_comparison_plan: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Monatsprognose IVW Visits
    value_format: '#,##0,, "mio"'
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#009f62", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#df0029", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    comparison_style_plan: value
    comparison_show_label_plan: true
    comparison_label_placement_plan: below
    series_types: {}
    defaults_version: 0
    show_value_labels: true
    font_size: 12
    title_hidden: true
    listen: {}
    row: 5
    col: 15
    width: 9
    height: 5
  - title: Media Views Yesterday - new (copy)
    name: Media Views Yesterday - new (copy)
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, d_dates.date_month, f_adobe_forecasts.sum_media_views_forecast,
      f_traffic.sum_media_views]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_objects.object_group: BILD
    sorts: [d_dates.date_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: media_views_gesamt_summe, label: Media Views
          Gesamt Summe, expression: "(coalesce(${f_traffic.sum_media_views},0)+coalesce(${f_adobe_forecasts.sum_media_views_forecast},0))",
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: vormonat, label: Vormonat, expression: 'offset(${media_views_gesamt_summe},1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: media_views_webmobile_gestern, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Views Web/Mobile gestern, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}!=\"\
          App\"\nAND\n(${f_traffic.is_yesterday}=yes)"}, {measure: media_content_views_app_gestern,
        based_on: f_traffic.sum_content_media_views, type: count_distinct, label: Media
          Content Views App gestern, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          App\"\nAND\n${f_traffic.is_yesterday}=yes"}, {measure: media_views_webmobile,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          Web/Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}!="App"

          '}, {measure: media_content_views_app, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Content Views App, value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"

          '}]
    filter_expression: "\n(extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))\n\
      OR\nextract_months(${d_dates.date_month})=extract_months(add_months(-1,add_days(-1,now())))\n\
      )\nAND \nextract_years(${d_dates.date_month})=extract_years(add_days(-1,now()))\n\
      \n"
    query_timezone: Europe/Berlin
    hidden_fields: [media_content_views, media_views_ohne_app, media_views_ohne_app_copy,
      media_content_views_copy, calculation_4_copy, calculation_4_copy_copy, f_adobe_forecasts.sum_media_views_forecast,
      vormonat, d_objects.object_group, d_dates.date_month, f_traffic.sum_media_views]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '30'
    orientation: auto
    style_media_views_gesamt_summe: "#000000"
    show_title_media_views_gesamt_summe: true
    title_override_media_views_gesamt_summe: Monatsprognose
    title_placement_media_views_gesamt_summe: below
    value_format_media_views_gesamt_summe: '#.#,, "mio"'
    title_overrride_media_views_gesamt_summe: Monatsprognose
    show_comparison_vormonat: false
    comparison_style_vormonat: percentage_change
    comparison_show_label_vormonat: true
    comparison_label_vormonat: "∆ Vormonat"
    comparison_label_placement_vormonat: below
    style_media_views_gesamt_summe_in_mio: "#000000"
    show_title_media_views_gesamt_summe_in_mio: true
    title_overrride_media_views_gesamt_summe_in_mio: Monatsprognose in mio
    title_placement_media_views_gesamt_summe_in_mio: below
    value_format_media_views_gesamt_summe_in_mio: ''
    style_media_views_gestern_summe: "#000000"
    show_title_media_views_gestern_summe: true
    title_overrride_media_views_gestern_summe: Yesterday
    title_placement_media_views_gestern_summe: below
    value_format_media_views_gestern_summe: '#.##,, "mio"'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    style_d_zum_6_wochen_durchschnitt: "#000000"
    show_title_d_zum_6_wochen_durchschnitt: true
    title_placement_d_zum_6_wochen_durchschnitt: below
    value_format_d_zum_6_wochen_durchschnitt: ''
    show_comparison_d_zum_6_wochen_durchschnitt: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Media Views
    value_format: "#,##0, k"
    style_calculation_4: "#000000"
    show_title_calculation_4: true
    title_overrride_calculation_4: Media Views
    title_placement_calculation_4: below
    value_format_calculation_4: ''
    style_abweichung: "#000000"
    show_title_abweichung: true
    title_overrride_abweichung: "∆ 6 Weeks ø"
    title_placement_abweichung: below
    value_format_abweichung: ''
    show_comparison_abweichung: false
    series_types: {}
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    note_state: collapsed
    note_display: below
    note_text: ''
    title_hidden: true
    listen: {}
    row: 41
    col: 12
    width: 12
    height: 6
  - title: Top 5 Media Views - Gestern
    name: Top 5 Media Views - Gestern
    model: spring
    explore: f_traffic
    type: looker_grid
    fields: [d_content_media.headline, d_content_media.media_id, d_content_media.headline_with_url,
      d_content_media.publicaten_date_ddmm, f_traffic.sum_media_views]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 1 days ago for 1 days
      d_objects.object_group: BILD
      f_traffic.sum_media_views: ">9000"
    sorts: [f_traffic.sum_media_views desc]
    limit: 500
    dynamic_fields: [{measure: media_views_webmobile_gestern, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Views Web/Mobile gestern, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}!=\"\
          App\"\nAND\n(${f_traffic.is_yesterday}=yes)"}, {measure: media_views_app_gestern,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          App gestern, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: "${d_platforms.platform}=\"App\"\n\
          AND\n${f_traffic.is_yesterday}=yes"}, {measure: media_views_webmobile, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Views Web/Mobile, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}!="App"

          '}, {measure: media_content_views_app, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Content Views App, value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"

          '}]
    query_timezone: Europe/Berlin
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '40'
    rows_font_size: '40'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      media_views_gestern_summe: Media Views
      d_content_media.publicaten_date_ddmm: Publ. Day
      f_traffic.sum_media_views: Views
    series_column_widths:
      f_traffic.sum_media_views: 350
    series_cell_visualizations:
      f_traffic.sum_media_views:
        is_active: false
    series_text_format:
      media_views_gestern_summe:
        align: right
        fg_color: "#000000"
      d_content_media.publicaten_date_ddmm:
        fg_color: "#000000"
      d_content_media.ressort_1:
        fg_color: "#000000"
      d_content_media.headline:
        fg_color: "#000000"
        align: left
      f_traffic.sum_media_views:
        fg_color: "#000000"
      d_content_media.headline_with_url:
        fg_color: "#000000"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    header_font_color: "#000000"
    hidden_fields: [media_content_views, media_views_ohne_app, media_views_ohne_app_copy,
      media_content_views_copy, calculation_4_copy, calculation_4_copy_copy, media_content_views_app_gestern,
      d_content_media.media_id, d_content_pages.ressort, d_content_media.publicaten_date_ddmm,
      d_content_media.headline]
    hidden_points_if_no: []
    font_size_main: '35'
    style_media_views_gestern_summe: "#000000"
    show_title_media_views_gestern_summe: true
    title_overrride_media_views_gestern_summe: Yesterday
    title_placement_media_views_gestern_summe: below
    value_format_media_views_gestern_summe: '#.##,, "mio"'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    style_d_zum_6_wochen_durchschnitt: "#000000"
    show_title_d_zum_6_wochen_durchschnitt: true
    title_placement_d_zum_6_wochen_durchschnitt: below
    value_format_d_zum_6_wochen_durchschnitt: ''
    show_comparison_d_zum_6_wochen_durchschnitt: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#000000"
    single_value_title: Media Views
    value_format: "#,##0, k"
    style_calculation_4: "#000000"
    show_title_calculation_4: true
    title_overrride_calculation_4: Media Views
    title_placement_calculation_4: below
    value_format_calculation_4: ''
    style_abweichung: "#000000"
    show_title_abweichung: true
    title_overrride_abweichung: "∆ 6 Weeks ø"
    title_placement_abweichung: below
    value_format_abweichung: ''
    show_comparison_abweichung: false
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen: {}
    row: 65
    col: 0
    width: 24
    height: 11
  - title: Top 5 Traffic - Gestern
    name: Top 5 Traffic - Gestern
    model: spring
    explore: f_traffic
    type: looker_grid
    fields: [d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.headline_with_url, f_traffic.sum_page_views, d_content_pages.publicaten_date_ddmm]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 1 days ago for 1 days
      f_traffic.sum_page_views: ">1000"
      d_objects.object_group: BILD
      d_content_pages.content_type: article,live
    sorts: [f_traffic.sum_page_views desc]
    limit: 1000
    column_limit: 50
    row_total: right
    dynamic_fields: [{measure: web, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Web, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
      {measure: mobile_incl_ampia, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Mobile incl. AMP/IA, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          Mobile\"\nOR\n${d_platforms.platform}=\"AMP\"\nOR\n${d_platforms.platform}=\"\
          FBIA\""}, {measure: apps, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Apps, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
    query_timezone: Europe/Berlin
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '40'
    rows_font_size: '40'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      d_content_pages.headline_with_url: left
      d_content_pages.ressort: left
      d_content_pages.publicaten_date_ddmm: left
      f_traffic.sum_page_views: left
    column_order: ["$$$_row_numbers_$$$", d_content_pages.headline_with_url, d_content_pages.ressort,
      d_content_pages.publicaten_date_ddmm, f_traffic.sum_page_views, web, mobile_incl_ampia,
      apps]
    show_totals: true
    show_row_totals: true
    series_labels:
      f_traffic.sum_page_views: Page Views
      d_content_pages.headline_with_url: Article
      d_content_pages.publicaten_date_ddmm: Publication Date
    series_column_widths:
      d_dates.date_date: 127
      rang: 59
      d_contents.headline: 313
      d_contents.headline_with_url: 700
      d_contents.content_id: 120
      d_contents.ressort: 150
      d_content_pages.content_id: 152
      d_content_pages.ressort: 200
      d_content_pages.publication_date: 277
      d_content_pages.publicaten_date_ddmm: 200
      f_traffic.sum_page_views: 450
    series_cell_visualizations:
      f_traffic.sum_page_views:
        is_active: false
    series_text_format:
      d_contents.content_id:
        fg_color: "#000000"
      d_contents.ressort:
        fg_color: "#000000"
      d_contents.headline_with_url:
        fg_color: "#000000"
      d_contents.publication_date:
        fg_color: "#000000"
      f_traffic.sum_page_views:
        fg_color: "#000000"
      d_content_pages.content_id:
        fg_color: "#000000"
      d_content_pages.ressort:
        fg_color: "#000000"
      d_content_pages.publication_date:
        fg_color: "#000000"
      d_content_pages.headline_with_url:
        fg_color: "#000000"
      d_content_pages.publicaten_date_ddmm:
        fg_color: "#000000"
      web:
        fg_color: "#000000"
      mobile_incl_ampia:
        fg_color: "#000000"
      apps:
        fg_color: "#000000"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    header_font_color: "#000000"
    hidden_fields: [d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.publicaten_date_ddmm]
    series_types: {}
    hidden_points_if_no: [limit]
    y_axes: []
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 27
    col: 0
    width: 24
    height: 12
  - title: Entries nach Marketing Channel Search
    name: Entries nach Marketing Channel Search
    model: spring
    explore: f_traffic
    type: looker_column
    fields: [d_platforms.platform, d_dates.date_date, f_traffic.sum_entries]
    pivots: [d_platforms.platform]
    fill_fields: [d_dates.date_date]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 28 days ago for 28 days
      d_objects.object_group: BILD
      d_marketing_channels.last_touch_channel: Organic Search – Brand,Organic Search
        – NonBrand
      d_platforms.platform: "-FBIA"
    sorts: [d_platforms.platform 0, d_dates.date_date]
    limit: 500
    query_timezone: Europe/Berlin
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: 040400f6-5004-4a05-b868-e34524e4607b
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: AMP - f_traffic.sum_orders_via_article,
            id: AMP - f_traffic.sum_orders_via_article, name: AMP}, {axisId: App -
              f_traffic.sum_orders_via_article, id: App - f_traffic.sum_orders_via_article,
            name: App}, {axisId: Desktop - f_traffic.sum_orders_via_article, id: Desktop
              - f_traffic.sum_orders_via_article, name: Desktop}, {axisId: Mobile
              - f_traffic.sum_orders_via_article, id: Mobile - f_traffic.sum_orders_via_article,
            name: Mobile}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '45'
    label_value_format: "##0.#0,,"
    series_types: {}
    series_colors:
      Mobile - f_traffic.sum_orders_via_article: "#0089ca"
      Desktop - f_traffic.sum_orders_via_article: "#df0029"
      Desktop - f_traffic.sum_orders: "#df0029"
      Mobile - f_traffic.sum_orders: "#0089ca"
      Desktop - f_traffic.sum_entries: "#df0029"
      Mobile - f_traffic.sum_entries: "#0089ca"
      AMP - f_traffic.sum_entries: "#009f62"
    x_axis_datetime_label: "%d-%m"
    x_axis_label_rotation: -90
    defaults_version: 1
    title_hidden: true
    listen: {}
    row: 123
    col: 0
    width: 24
    height: 11
  - title: Entries nach Facebook
    name: Entries nach Facebook
    model: spring
    explore: f_traffic
    type: looker_column
    fields: [d_platforms.platform, d_dates.date_date, f_traffic.sum_entries]
    pivots: [d_platforms.platform]
    fill_fields: [d_dates.date_date]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 28 days ago for 28 days
      d_objects.object_group: BILD
      d_marketing_channels.last_touch_channel: Facebook,Other Organic Social
      d_platforms.platform: "-AMP,-App"
    sorts: [d_platforms.platform desc, d_dates.date_date]
    limit: 500
    query_timezone: Europe/Berlin
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: 040400f6-5004-4a05-b868-e34524e4607b
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: AMP - f_traffic.sum_orders_via_article,
            id: AMP - f_traffic.sum_orders_via_article, name: AMP}, {axisId: App -
              f_traffic.sum_orders_via_article, id: App - f_traffic.sum_orders_via_article,
            name: App}, {axisId: Desktop - f_traffic.sum_orders_via_article, id: Desktop
              - f_traffic.sum_orders_via_article, name: Desktop}, {axisId: Mobile
              - f_traffic.sum_orders_via_article, id: Mobile - f_traffic.sum_orders_via_article,
            name: Mobile}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '45'
    label_value_format: "##0.#0,,"
    series_types: {}
    series_colors:
      Mobile - f_traffic.sum_orders_via_article: "#0089ca"
      Desktop - f_traffic.sum_orders_via_article: "#df0029"
      Desktop - f_traffic.sum_orders: "#df0029"
      Mobile - f_traffic.sum_orders: "#0089ca"
      Desktop - f_traffic.sum_entries: "#df0029"
      Mobile - f_traffic.sum_entries: "#0089ca"
      AMP - f_traffic.sum_entries: "#009f62"
      FBIA - f_traffic.sum_entries: "#f18825"
    x_axis_datetime_label: "%d-%m"
    x_axis_label_rotation: -90
    defaults_version: 1
    title_hidden: true
    listen: {}
    row: 158
    col: 0
    width: 24
    height: 11
  - title: Top 5 Traffic - Google
    name: Top 5 Traffic - Google
    model: spring
    explore: f_traffic
    type: looker_grid
    fields: [d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.headline_with_url, d_content_pages.publicaten_date_ddmm, f_traffic.sum_entries]
    filters:
      d_objects.object_name: BILD
      d_dates.date_date: 1 days ago for 1 days
      f_traffic.sum_page_views: ">1000"
      d_objects.object_group: BILD
      d_content_pages.content_type: article
      d_marketing_channels.last_touch_channel: Organic Search – Brand,Organic Search
        – NonBrand
    sorts: [f_traffic.sum_entries desc]
    limit: 1000
    column_limit: 50
    row_total: right
    dynamic_fields: [{measure: web, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Web, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
      {measure: mobile_incl_ampia, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Mobile incl. AMP/IA, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          Mobile\"\nOR\n${d_platforms.platform}=\"AMP\"\nOR\n${d_platforms.platform}=\"\
          FBIA\""}, {measure: apps, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Apps, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
    query_timezone: Europe/Berlin
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '45'
    rows_font_size: '40'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      d_content_pages.headline_with_url: left
    column_order: ["$$$_row_numbers_$$$", d_content_pages.headline_with_url, f_traffic.sum_entries]
    show_totals: true
    show_row_totals: true
    series_labels:
      f_traffic.sum_page_views: Page Views
      d_content_pages.headline_with_url: Article
      d_content_pages.publicaten_date_ddmm: Publication Date
    series_column_widths:
      d_dates.date_date: 127
      rang: 59
      d_contents.headline: 313
      d_contents.headline_with_url: 700
      d_contents.content_id: 120
      d_contents.ressort: 150
      d_content_pages.content_id: 152
      d_content_pages.ressort: 200
      d_content_pages.publication_date: 277
      d_content_pages.publicaten_date_ddmm: 200
      f_traffic.sum_page_views: 450
      f_traffic.sum_entries: 400
    series_cell_visualizations:
      f_traffic.sum_page_views:
        is_active: false
      f_traffic.sum_entries:
        is_active: false
    series_text_format:
      d_contents.content_id:
        fg_color: "#000000"
      d_contents.ressort:
        fg_color: "#000000"
      d_contents.headline_with_url:
        fg_color: "#000000"
      d_contents.publication_date:
        fg_color: "#000000"
      f_traffic.sum_page_views:
        fg_color: "#000000"
      d_content_pages.content_id:
        fg_color: "#000000"
      d_content_pages.ressort:
        fg_color: "#000000"
      d_content_pages.publication_date:
        fg_color: "#000000"
      d_content_pages.headline_with_url:
        fg_color: "#000000"
      d_content_pages.publicaten_date_ddmm:
        fg_color: "#000000"
      web:
        fg_color: "#000000"
      mobile_incl_ampia:
        fg_color: "#000000"
      apps:
        fg_color: "#000000"
      f_traffic.sum_entries:
        fg_color: "#000000"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    header_font_color: "#000000"
    hidden_fields: [d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.publicaten_date_ddmm]
    series_types: {}
    hidden_points_if_no: [limit]
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 134
    col: 0
    width: 24
    height: 12
  - title: Top 5 Traffic - Facebook
    name: Top 5 Traffic - Facebook
    model: spring
    explore: f_traffic
    type: looker_grid
    fields: [d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.headline_with_url, d_content_pages.publicaten_date_ddmm, f_traffic.sum_entries]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 1 days ago for 1 days
      f_traffic.sum_page_views: ">1000"
      d_objects.object_group: BILD
      d_content_pages.content_type: article
      d_marketing_channels.last_touch_channel: Facebook
    sorts: [f_traffic.sum_entries desc]
    limit: 1000
    column_limit: 50
    row_total: right
    dynamic_fields: [{measure: web, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Web, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
      {measure: mobile_incl_ampia, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Mobile incl. AMP/IA, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          Mobile\"\nOR\n${d_platforms.platform}=\"AMP\"\nOR\n${d_platforms.platform}=\"\
          FBIA\""}, {measure: apps, based_on: f_traffic.sum_page_views, type: count_distinct,
        label: Apps, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
    query_timezone: Europe/Berlin
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '45'
    rows_font_size: '40'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      d_content_pages.headline_with_url: left
      d_content_pages.ressort: left
      d_content_pages.publicaten_date_ddmm: left
      f_traffic.sum_page_views: left
    column_order: ["$$$_row_numbers_$$$", d_content_pages.headline_with_url, d_content_pages.ressort,
      d_content_pages.publicaten_date_ddmm, f_traffic.sum_page_views, web, mobile_incl_ampia,
      apps]
    show_totals: true
    show_row_totals: true
    series_labels:
      f_traffic.sum_page_views: Page Views
      d_content_pages.headline_with_url: Article
      d_content_pages.publicaten_date_ddmm: Publication Date
    series_column_widths:
      d_dates.date_date: 127
      rang: 59
      d_contents.headline: 313
      d_contents.headline_with_url: 700
      d_contents.content_id: 120
      d_contents.ressort: 150
      d_content_pages.content_id: 152
      d_content_pages.ressort: 200
      d_content_pages.publication_date: 277
      d_content_pages.publicaten_date_ddmm: 200
      f_traffic.sum_page_views: 450
      f_traffic.sum_entries: 400
    series_cell_visualizations:
      f_traffic.sum_page_views:
        is_active: false
      f_traffic.sum_entries:
        is_active: false
    series_text_format:
      d_contents.content_id:
        fg_color: "#000000"
      d_contents.ressort:
        fg_color: "#000000"
      d_contents.headline_with_url:
        fg_color: "#000000"
      d_contents.publication_date:
        fg_color: "#000000"
      f_traffic.sum_page_views:
        fg_color: "#000000"
      d_content_pages.content_id:
        fg_color: "#000000"
      d_content_pages.ressort:
        fg_color: "#000000"
      d_content_pages.publication_date:
        fg_color: "#000000"
      d_content_pages.headline_with_url:
        fg_color: "#000000"
      d_content_pages.publicaten_date_ddmm:
        fg_color: "#000000"
      web:
        fg_color: "#000000"
      mobile_incl_ampia:
        fg_color: "#000000"
      apps:
        fg_color: "#000000"
      f_traffic.sum_entries:
        fg_color: "#000000"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    header_font_color: "#000000"
    hidden_fields: [d_dates.date_date, d_content_pages.content_id, d_content_pages.ressort,
      d_content_pages.publicaten_date_ddmm]
    series_types: {}
    hidden_points_if_no: [limit]
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 169
    col: 0
    width: 24
    height: 11
  - name: IVW Visits (copy)
    title: IVW Visits (copy)
    merged_queries:
    - model: spring
      explore: f_ivw_measures_with_plan_data
      type: single_value
      fields: [d_objects.object_group, f_ivw_measures_with_plan_data.avg_visits_last_6_weeks,
        webmob_visits]
      filters:
        d_objects.object_name: BILD,SPORT BILD
      sorts: [f_ivw_measures_with_plan_data.avg_visits_last_6_weeks desc]
      limit: 500
      dynamic_fields: [{table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø", expression: "(${f_ivw_measures_with_plan_data.sum_visits_yesterday}/${f_ivw_measures_with_plan_data.avg_visits_last_6_weeks})-1",
          value_format: !!null '', value_format_name: percent_2, is_disabled: true,
          _kind_hint: measure, _type_hint: number}, {measure: webmob_visits, based_on: f_ivw_measures_with_plan_data.sum_visits_yesterday,
          type: count_distinct, label: Web/Mob Visits, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
            Mobile\"\nOR\n${d_platforms.platform}=\"Desktop\"\n"}, {measure: web_ivw,
          based_on: f_ivw_measures_with_plan_data.sum_visits_yesterday, type: count_distinct,
          label: web ivw, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"

            '}, {measure: mobile_ivw, based_on: f_ivw_measures_with_plan_data.sum_visits_yesterday,
          type: count_distinct, label: mobile IVW, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="Mobile"'}]
      query_timezone: Europe/Berlin
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#000000"
      single_value_title: IVW Visits
      value_format: 0, "K"
      conditional_formatting: [{type: greater than, value: 0, background_color: '',
          font_color: "#009f62", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}, {
          type: less than, value: 0, background_color: '', font_color: "#df0029",
          color_application: {collection_id: legacy, palette_id: legacy_sequential3},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}]
      show_view_names: false
      series_types: {}
      hidden_fields: [f_ivw_measures_with_plan_data.avg_visits_last_6_weeks]
      defaults_version: 1
    - model: spring
      explore: f_traffic
      type: looker_grid
      fields: [app, d_objects.object_group]
      filters:
        d_dates.date_date: 1 days ago for 1 days
        d_objects.object_name: BILD,SPORT BILD
      sorts: [app desc]
      limit: 500
      dynamic_fields: [{measure: app, based_on: f_traffic.sum_visits_day, type: count_distinct,
          label: App, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
      query_timezone: Europe/Berlin
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
      series_types: {}
      defaults_version: 1
      join_fields:
      - field_name: d_objects.object_group
        source_field_name: d_objects.object_group
    font_size_main: '20'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    style_visits_in_mio: "#000000"
    show_title_visits_in_mio: true
    title_overrride_visits_in_mio: Gestern
    title_placement_visits_in_mio: below
    value_format_visits_in_mio: '#.#,, "mio"'
    show_comparison_6_weeks_o: false
    comparison_style_6_weeks_o: value
    comparison_show_label_6_weeks_o: true
    comparison_label_placement_6_weeks_o: right
    show_comparison_avg_6_weeks: false
    comparison_style_avg_6_weeks: percentage_change
    comparison_show_label_avg_6_weeks: true
    comparison_label_avg_6_weeks: "∆ Avg 6 Weeks"
    comparison_label_placement_avg_6_weeks: below
    style_avg_6_weeks: "#3B4245"
    show_title_avg_6_weeks: true
    title_placement_avg_6_weeks: above
    value_format_avg_6_weeks: ''
    style_f_ivw_measures_with_plan_data.avg_visits_last_6_weeks: "#3B4245"
    show_title_f_ivw_measures_with_plan_data.avg_visits_last_6_weeks: true
    title_placement_f_ivw_measures_with_plan_data.avg_visits_last_6_weeks: above
    value_format_f_ivw_measures_with_plan_data.avg_visits_last_6_weeks: ''
    show_comparison_visits_in_mio: true
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    single_value_title: Total Visits in mio
    value_format: ''
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: ''
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    style_visits: "#000000"
    show_title_visits: true
    title_overrride_visits: Visits yesterday
    title_placement_visits: below
    value_format_visits: '#.#,, "mio"'
    style_all_time_rank: "#000000"
    show_title_all_time_rank: true
    title_placement_all_time_rank: below
    value_format_all_time_rank: ''
    show_comparison_all_time_rank: false
    style_rank: "#3B4245"
    show_title_rank: true
    title_placement_rank: below
    value_format_rank: ''
    show_comparison_rank: false
    showComparison: false
    minValue: 100
    maxValue: 100
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#cccccc"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: false
    waveAnimate: false
    waveColor: "#df0029"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 1
    valueCountUp: true
    displayPercent: false
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    series_types: {}
    hidden_fields: [app, webmob_visits, visits, f_ivw_measures_with_plan_data.avg_visits_last_6_weeks,
      avg_6_weeks, visits_in_mio, d_objects.object_group]
    sorts: [f_ivw_measures_with_plan_data.avg_visits_last_6_weeks desc]
    dynamic_fields: [{table_calculation: visits, label: Visits, expression: "${webmob_visits}+${app}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: visits_in_mio, label: Visits in mio,
        expression: "${visits}", value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, _type_hint: number}, {table_calculation: 6_weeks_o, label: "∆\
          \ 6 Weeks ø", expression: "(${visits}/${f_ivw_measures_with_plan_data.avg_visits_last_6_weeks})\
          \ -1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: avg_6_weeks, label: avg 6 weeks,
        expression: "${f_ivw_measures_with_plan_data.avg_visits_last_6_weeks}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    row: 10
    col: 0
    width: 15
    height: 4
  - title: Orders -  abw
    name: Orders -  abw
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, f_traffic.sum_orders_via_article_yesterday, f_traffic.avg_orders_via_article_last_6_weeks]
    filters:
      d_objects.object_name: BILD
      d_dates.date_date: 7 weeks
      d_objects.object_group: BILD
      d_platforms.platform: Desktop,Mobile,AMP
    sorts: [f_traffic.sum_orders_via_article_yesterday desc]
    limit: 500
    dynamic_fields: [{table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø", expression: "((${f_traffic.sum_orders_via_article_yesterday})\
          \ / \n  (${f_traffic.avg_orders_via_article_last_6_weeks})) -1", value_format: !!null '',
        value_format_name: percent_0, is_disabled: false, _kind_hint: measure, _type_hint: number}]
    query_timezone: Europe/Berlin
    hidden_fields: [vormonat_2, f_traffic.avg_orders_via_article_last_6_weeks, f_traffic.sum_orders_via_article_yesterday,
      d_objects.object_group]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '20'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    style_f_traffic.sum_orders_via_article_yesterday: "#000000"
    show_title_f_traffic.sum_orders_via_article_yesterday: true
    title_overrride_f_traffic.sum_orders_via_article_yesterday: Gestern
    title_placement_f_traffic.sum_orders_via_article_yesterday: below
    value_format_f_traffic.sum_orders_via_article_yesterday: ''
    show_comparison_f_traffic.avg_orders_via_article_last_6_weeks: true
    comparison_style_f_traffic.avg_orders_via_article_last_6_weeks: percentage_change
    comparison_show_label_f_traffic.avg_orders_via_article_last_6_weeks: true
    comparison_label_f_traffic.avg_orders_via_article_last_6_weeks: "∆ Avg 6 Weeks"
    comparison_label_placement_f_traffic.avg_orders_via_article_last_6_weeks: below
    style_f_traffic.avg_orders_via_article_last_6_weeks: "#3B4245"
    show_title_f_traffic.avg_orders_via_article_last_6_weeks: true
    title_placement_f_traffic.avg_orders_via_article_last_6_weeks: above
    value_format_f_traffic.avg_orders_via_article_last_6_weeks: ''
    show_comparison_6_weeks_o: false
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    single_value_title: Orders via Article
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 0
    title_hidden: true
    listen: {}
    row: 84
    col: 0
    width: 12
    height: 5
  - title: Media Views Yesterday - new (copy 2)
    name: Media Views Yesterday - new (copy 2)
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, f_traffic.sum_media_views_yesterday, f_traffic.sum_media_views]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_dates.date_date: 6 weeks
      d_objects.object_group: BILD
    sorts: [f_traffic.sum_media_views_yesterday desc]
    limit: 500
    dynamic_fields: [{table_calculation: 6_wochen_durchschnitt, label: 6 Wochen Durchschnitt,
        expression: "(${f_traffic.sum_media_views})/42", value_format: !!null '',
        value_format_name: decimal_0, is_disabled: false, _kind_hint: measure, _type_hint: number},
      {table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø", expression: "(${f_traffic.sum_media_views_yesterday}\
          \ - ${6_wochen_durchschnitt})/${6_wochen_durchschnitt}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        measure: media_views_webmobile_gestern, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Views Web/Mobile gestern, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}!=\"\
          App\"\nAND\n(${f_traffic.is_yesterday}=yes)"}, {measure: media_content_views_app_gestern,
        based_on: f_traffic.sum_content_media_views, type: count_distinct, label: Media
          Content Views App gestern, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          App\"\nAND\n${f_traffic.is_yesterday}=yes"}, {measure: media_views_webmobile,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          Web/Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}!="App"

          '}, {measure: media_content_views_app, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Content Views App, value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"

          '}]
    query_timezone: Europe/Berlin
    hidden_fields: [f_traffic.sum_media_views_yesterday, media_content_views, media_views_ohne_app,
      media_views_ohne_app_copy, media_content_views_copy, calculation_4_copy, calculation_4_copy_copy,
      6_wochen_durchschnitt, d_objects.object_group, f_traffic.sum_media_views]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '20'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    style_media_views_gestern_summe: "#000000"
    show_title_media_views_gestern_summe: true
    title_overrride_media_views_gestern_summe: Gestern
    title_placement_media_views_gestern_summe: below
    value_format_media_views_gestern_summe: '#.##,, "mio"'
    show_comparison_avg_6_weeks: false
    comparison_style_avg_6_weeks: percentage_change
    comparison_show_label_avg_6_weeks: true
    comparison_label_placement_avg_6_weeks: below
    style_avg_6_weeks: "#3B4245"
    show_title_avg_6_weeks: true
    title_placement_avg_6_weeks: above
    value_format_avg_6_weeks: ''
    show_comparison_6_weeks_o: false
    style_d_zum_6_wochen_durchschnitt: "#000000"
    show_title_d_zum_6_wochen_durchschnitt: true
    title_placement_d_zum_6_wochen_durchschnitt: below
    value_format_d_zum_6_wochen_durchschnitt: ''
    show_comparison_d_zum_6_wochen_durchschnitt: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Media Views
    value_format: "#,##0, k"
    style_calculation_4: "#000000"
    show_title_calculation_4: true
    title_overrride_calculation_4: Media Views
    title_placement_calculation_4: below
    value_format_calculation_4: ''
    style_abweichung: "#000000"
    show_title_abweichung: true
    title_overrride_abweichung: "∆ 6 Weeks ø"
    title_placement_abweichung: below
    value_format_abweichung: ''
    show_comparison_abweichung: false
    series_types: {}
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    note_state: collapsed
    note_display: below
    note_text: ''
    title_hidden: true
    listen: {}
    row: 47
    col: 0
    width: 12
    height: 5
  - title: IVW Vists aktueller Monat (copy)
    name: IVW Vists aktueller Monat (copy)
    model: spring
    explore: f_ivw_measures_with_plan_data
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_dates.month, f_ivw_measures_with_plan_data.sum_visits_forecast, f_ivw_measures_with_plan_data.sum_visits,
      f_ivw_measures_with_plan_data.sum_visits_plan]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_objects.object_group: BILD
    sorts: [d_dates.month desc]
    limit: 500
    dynamic_fields: [{table_calculation: plan, label: "∆ Plan", expression: "((${f_ivw_measures_with_plan_data.sum_visits_forecast})\
          \ / (offset(${f_ivw_measures_with_plan_data.sum_visits_plan},1))) -1", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: vormonat, label: Vormonat, expression: "(offset(${f_ivw_measures_with_plan_data.sum_visits},\
          \ 1))", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: vormonat_2, label: "∆ Vormonat",
        expression: "((${f_ivw_measures_with_plan_data.sum_visits_forecast}) / (offset(${f_ivw_measures_with_plan_data.sum_visits},1)))\
          \ -1", value_format: !!null '', value_format_name: percent_2, is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {measure: visits_vormonat, based_on: f_ivw_measures_with_plan_data.sum_visits,
        type: count_distinct, label: Visits Vormonat, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_dates.day}=add_months(-1,\
          \ now())"}]
    filter_expression: "\n(extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))\n\
      OR\nextract_months(${d_dates.date_month})=extract_months(add_months(-1,add_days(-1,now())))\n\
      )\nAND \nextract_years(${d_dates.date_month})=extract_years(add_days(-1,now()))\n\
      \n"
    query_timezone: Europe/Berlin
    hidden_fields: [d_dates.month, f_ivw_measures_with_plan_data.sum_visits, f_ivw_measures_with_plan_data.sum_visits_plan,
      plan, vormonat, f_ivw_measures_with_plan_data.sum_visits_forecast]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '20'
    style_vormonat_2: "#000000"
    show_title_vormonat_2: true
    title_placement_vormonat_2: below
    value_format_vormonat_2: +0% "▲";-0% "▼";
    style_f_ivw_measures_with_plan_data.sum_visits_forecast: "#000000"
    show_title_f_ivw_measures_with_plan_data.sum_visits_forecast: true
    title_overrride_f_ivw_measures_with_plan_data.sum_visits_forecast: Monatsprognose
    title_placement_f_ivw_measures_with_plan_data.sum_visits_forecast: below
    value_format_f_ivw_measures_with_plan_data.sum_visits_forecast: '#,, "mio"'
    show_comparison_vormonat: true
    comparison_style_vormonat: percentage_change
    comparison_show_label_vormonat: true
    comparison_label_vormonat: "∆ Vormonat"
    comparison_label_placement_vormonat: below
    style_vormonat: "#000000"
    show_title_vormonat: true
    title_placement_vormonat: below
    value_format_vormonat: ''
    style_plan: "#000000"
    show_title_plan: true
    title_placement_plan: below
    value_format_plan: +0% "▲";-0% "▼";
    show_comparison_plan: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Monatsprognose IVW Visits
    value_format: '#,##0,, "mio"'
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#009f62", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#df0029", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    comparison_style_plan: value
    comparison_show_label_plan: true
    comparison_label_placement_plan: below
    series_types: {}
    defaults_version: 0
    show_value_labels: true
    font_size: 12
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    title_hidden: true
    listen: {}
    row: 10
    col: 15
    width: 9
    height: 4
  - title: Media Views Yesterday - new (copy 3)
    name: Media Views Yesterday - new (copy 3)
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [d_objects.object_group, d_dates.date_month, f_adobe_forecasts.sum_media_views_forecast,
      f_traffic.sum_media_views]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_objects.object_group: BILD
    sorts: [d_dates.date_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: media_views_gesamt_summe, label: Media Views
          Gesamt Summe, expression: "(coalesce(${f_traffic.sum_media_views},0)+coalesce(${f_adobe_forecasts.sum_media_views_forecast},0))",
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: vormonat, label: Vormonat, expression: 'offset(${media_views_gesamt_summe},1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: vormonat_2, label: Vormonat %, expression: "(${media_views_gesamt_summe}\
          \ - ${vormonat})/${vormonat}", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}, {measure: media_views_webmobile_gestern,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          Web/Mobile gestern, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}!=\"\
          App\"\nAND\n(${f_traffic.is_yesterday}=yes)"}, {measure: media_content_views_app_gestern,
        based_on: f_traffic.sum_content_media_views, type: count_distinct, label: Media
          Content Views App gestern, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
          App\"\nAND\n${f_traffic.is_yesterday}=yes"}, {measure: media_views_webmobile,
        based_on: f_traffic.sum_media_views, type: count_distinct, label: Media Views
          Web/Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${d_platforms.platform}!="App"

          '}, {measure: media_content_views_app, based_on: f_traffic.sum_media_views,
        type: count_distinct, label: Media Content Views App, value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"

          '}]
    filter_expression: "\n(extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))\n\
      OR\nextract_months(${d_dates.date_month})=extract_months(add_months(-1,add_days(-1,now())))\n\
      )\nAND \nextract_years(${d_dates.date_month})=extract_years(add_days(-1,now()))\n\
      \n"
    query_timezone: Europe/Berlin
    hidden_fields: [media_content_views, media_views_ohne_app, media_views_ohne_app_copy,
      media_content_views_copy, calculation_4_copy, calculation_4_copy_copy, f_adobe_forecasts.sum_media_views_forecast,
      media_views_gesamt_summe, vormonat, d_objects.object_group, d_dates.date_month,
      f_traffic.sum_media_views]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '20'
    style_vormonat_2: "#000000"
    show_title_vormonat_2: true
    title_overrride_vormonat_2: "∆ Vormonat"
    title_placement_vormonat_2: below
    value_format_vormonat_2: +0% "▲";-0% "▼";
    style_media_views_gesamt_summe: "#000000"
    show_title_media_views_gesamt_summe: true
    title_overrride_media_views_gesamt_summe: Monatsprognose
    title_placement_media_views_gesamt_summe: below
    value_format_media_views_gesamt_summe: '#.#,, "mio"'
    show_comparison_vormonat: true
    comparison_style_vormonat: percentage_change
    comparison_show_label_vormonat: true
    comparison_label_vormonat: "∆ Vormonat"
    comparison_label_placement_vormonat: below
    style_media_views_gesamt_summe_in_mio: "#000000"
    show_title_media_views_gesamt_summe_in_mio: true
    title_overrride_media_views_gesamt_summe_in_mio: Monatsprognose in mio
    title_placement_media_views_gesamt_summe_in_mio: below
    value_format_media_views_gesamt_summe_in_mio: ''
    style_media_views_gestern_summe: "#000000"
    show_title_media_views_gestern_summe: true
    title_overrride_media_views_gestern_summe: Yesterday
    title_placement_media_views_gestern_summe: below
    value_format_media_views_gestern_summe: '#.##,, "mio"'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    show_comparison_6_weeks_o: false
    style_d_zum_6_wochen_durchschnitt: "#000000"
    show_title_d_zum_6_wochen_durchschnitt: true
    title_placement_d_zum_6_wochen_durchschnitt: below
    value_format_d_zum_6_wochen_durchschnitt: ''
    show_comparison_d_zum_6_wochen_durchschnitt: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Media Views
    value_format: "#,##0, k"
    style_calculation_4: "#000000"
    show_title_calculation_4: true
    title_overrride_calculation_4: Media Views
    title_placement_calculation_4: below
    value_format_calculation_4: ''
    style_abweichung: "#000000"
    show_title_abweichung: true
    title_overrride_abweichung: "∆ 6 Weeks ø"
    title_placement_abweichung: below
    value_format_abweichung: ''
    show_comparison_abweichung: false
    series_types: {}
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    note_state: collapsed
    note_display: below
    note_text: ''
    title_hidden: true
    listen: {}
    row: 47
    col: 12
    width: 12
    height: 5
  - title: Search Entries gestern
    name: Search Entries gestern
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [f_traffic.sum_entries]
    filters:
      d_dates.date_date: 1 days ago for 1 days
      d_objects.object_name: BILD,SPORT BILD
      d_marketing_channels.last_touch_channel: Organic Search – Brand,Organic Search
        – NonBrand
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_entries: "#000000"
    show_title_f_traffic.sum_entries: true
    title_override_f_traffic.sum_entries: Gestern
    title_placement_f_traffic.sum_entries: below
    value_format_f_traffic.sum_entries: '#.##,, "mio"'
    title_overrride_f_traffic.sum_entries: Gestern
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      f_traffic.sum_entries:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 0
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    title_hidden: true
    listen: {}
    row: 113
    col: 0
    width: 12
    height: 6
  - title: Search Entries abw
    name: Search Entries abw
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [f_traffic.sum_entries, 6_weeks, entries_yesterday]
    filters:
      d_dates.date_date: 49 days ago for 49 days
      d_objects.object_name: BILD,SPORT BILD
      d_marketing_channels.last_touch_channel: Organic Search – Brand,Organic Search
        – NonBrand
    limit: 500
    total: true
    dynamic_fields: [{measure: 6_weeks, based_on: f_traffic.sum_entries, type: count_distinct,
        label: 6 weeks, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: " ${f_traffic.is_last_6_weeks}=yes"},
      {measure: entries_yesterday, based_on: f_traffic.sum_entries, type: count_distinct,
        label: Entries yesterday, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${f_traffic.is_yesterday}=\
          \ yes"}, {table_calculation: avg_6_weeks, label: avg 6 weeks, expression: "${6_weeks}/6",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø",
        expression: "(${entries_yesterday}- ${avg_6_weeks})/ ${avg_6_weeks}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
    hidden_fields: [avg_6_weeks, entries_yesterday, 6_weeks, f_traffic.sum_entries]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '20'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    style_abw_6_w: "#000000"
    title_placement_abw_6_w: below
    value_format_abw_6_w: +0% "▲";-0% "▼";
    style_f_traffic.sum_entries: "#000000"
    title_overrride_f_traffic.sum_entries: Gestern
    title_placement_f_traffic.sum_entries: below
    value_format_f_traffic.sum_entries: '#.##,, "mio"'
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      f_traffic.sum_entries:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 0
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    title_hidden: true
    listen: {}
    row: 119
    col: 0
    width: 12
    height: 4
  - title: Search Entries Monat
    name: Search Entries Monat
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [f_traffic.sum_entries]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_marketing_channels.last_touch_channel: Organic Search – Brand,Organic Search
        – NonBrand
    limit: 500
    filter_expression: "\n(extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))\n\
      \n)\nAND \nextract_years(${d_dates.date_month})=extract_years(add_days(-1,now()))\n\
      \n"
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_entries: "#000000"
    title_override_f_traffic.sum_entries: aktueller Monat MTD (ohne Prognose)
    title_placement_f_traffic.sum_entries: below
    value_format_f_traffic.sum_entries: '#.##,, "mio"'
    title_overrride_f_traffic.sum_entries: aktueller Monat MTD (ohne Prognose)
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      f_traffic.sum_entries:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 0
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    title_hidden: true
    listen: {}
    row: 113
    col: 12
    width: 12
    height: 10
  - title: Social Entries gestern
    name: Social Entries gestern
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [f_traffic.sum_entries]
    filters:
      d_dates.date_date: 1 days ago for 1 days
      d_objects.object_name: BILD,SPORT BILD
      d_marketing_channels.last_touch_channel: Facebook,Other Organic Social
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_entries: "#000000"
    title_override_f_traffic.sum_entries: Gestern
    title_placement_f_traffic.sum_entries: below
    value_format_f_traffic.sum_entries: '##0.#0,, "mio"'
    title_overrride_f_traffic.sum_entries: Gestern
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      f_traffic.sum_entries:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 0
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    title_hidden: true
    listen: {}
    row: 148
    col: 0
    width: 12
    height: 6
  - title: Social Entries abw
    name: Social Entries abw
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [f_traffic.sum_entries, 6_weeks, entries_yesterday]
    filters:
      d_dates.date_date: 49 days ago for 49 days
      d_objects.object_name: BILD,SPORT BILD
      d_marketing_channels.last_touch_channel: Facebook,Other Organic Social
    limit: 500
    total: true
    dynamic_fields: [{measure: 6_weeks, based_on: f_traffic.sum_entries, type: count_distinct,
        label: 6 weeks, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: " ${f_traffic.is_last_6_weeks}=yes"},
      {measure: entries_yesterday, based_on: f_traffic.sum_entries, type: count_distinct,
        label: Entries yesterday, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${f_traffic.is_yesterday}=\
          \ yes"}, {table_calculation: avg_6_weeks, label: avg 6 weeks, expression: "${6_weeks}/6",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: 6_weeks_o, label: "∆ 6 Weeks ø",
        expression: "(${entries_yesterday}- ${avg_6_weeks})/ ${avg_6_weeks}", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
    hidden_fields: [avg_6_weeks, entries_yesterday, 6_weeks, f_traffic.sum_entries]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '20'
    style_6_weeks_o: "#000000"
    show_title_6_weeks_o: true
    title_placement_6_weeks_o: below
    value_format_6_weeks_o: +0% "▲";-0% "▼";
    style_abw_6_w: "#000000"
    title_placement_abw_6_w: below
    value_format_abw_6_w: +0% "▲";-0% "▼";
    style_f_traffic.sum_entries: "#000000"
    title_overrride_f_traffic.sum_entries: Gestern
    title_placement_f_traffic.sum_entries: below
    value_format_f_traffic.sum_entries: '#.##,, "mio"'
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      f_traffic.sum_entries:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 0
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    title_hidden: true
    listen: {}
    row: 154
    col: 0
    width: 12
    height: 4
  - title: Social Entries Monat
    name: Social Entries Monat
    model: spring
    explore: f_traffic
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [f_traffic.sum_entries]
    filters:
      d_objects.object_name: BILD,SPORT BILD
      d_marketing_channels.last_touch_channel: Facebook,Other Organic Social
    limit: 500
    filter_expression: "\n(extract_months(${d_dates.date_month})=extract_months(add_days(-1,now()))\n\
      \n)\nAND \nextract_years(${d_dates.date_month})=extract_years(add_days(-1,now()))\n\
      \n"
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    font_size_main: '30'
    orientation: auto
    style_f_traffic.sum_entries: "#000000"
    title_override_f_traffic.sum_entries: aktueller Monat MTD (ohne Prognose)
    title_placement_f_traffic.sum_entries: below
    value_format_f_traffic.sum_entries: '##0.#0,, "mio"'
    title_overrride_f_traffic.sum_entries: aktueller Monat MTD (ohne Prognose)
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: c5a669c3-04f7-4fe0-8649-061aa29bac00
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      f_traffic.sum_entries:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 0
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    title_hidden: true
    listen: {}
    row: 148
    col: 12
    width: 12
    height: 10
  - name: Visits All Time Rank
    title: Visits All Time Rank
    merged_queries:
    - model: spring
      explore: f_ivw_measures_with_plan_data
      type: looker_grid
      fields: [web, mobile, app, d_dates.date_date, f_ivw_measures_with_plan_data.sum_visits]
      filters:
        d_dates.date_date: before 0 minutes ago
        d_objects.object_group: BILD
        d_objects.object_name: BILD,SPORT BILD
      sorts: [f_ivw_measures_with_plan_data.sum_visits desc]
      limit: 500
      column_limit: 50
      dynamic_fields: [{measure: web, based_on: f_ivw_measures_with_plan_data.sum_visits,
          type: count_distinct, label: Web, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
        {measure: mobile, based_on: f_ivw_measures_with_plan_data.sum_visits, type: count_distinct,
          label: Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: '${d_platforms.platform}="Mobile"'},
        {measure: app, based_on: f_ivw_measures_with_plan_data.sum_visits, type: count_distinct,
          label: App, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: "${d_platforms.platform}=\"App\"\n\
            AND ${d_dates.day}<add_days(-3, now())"}]
      query_timezone: Europe/Berlin
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: true
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: normal
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      color_application:
        collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
        palette_id: 040400f6-5004-4a05-b868-e34524e4607b
        options:
          steps: 5
      y_axes: [{label: '', orientation: left, series: [{axisId: web, id: web, name: Web},
            {axisId: mobile, id: mobile, name: Mobile}, {axisId: app, id: app, name: App}],
          showLabels: false, showValues: true, valueFormat: "#,##0, \\K\\", unpinAxis: false,
          tickDensity: default, type: linear}, {label: '', orientation: left, series: [
            {axisId: f_ivw_measures_with_plan_data.sum_visits_plan, id: f_ivw_measures_with_plan_data.sum_visits_plan,
              name: Sum Visits - Plan}], showLabels: false, showValues: false, unpinAxis: false,
          tickDensity: default, tickDensityCustom: 5, type: linear}]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: '50'
      series_types: {}
      x_axis_datetime_label: "%d-%m"
      reference_lines: []
      x_axis_label_rotation: -90
      defaults_version: 1
    - model: spring
      explore: f_traffic
      type: looker_column
      fields: [app_adobe, d_dates.date_date]
      fill_fields: [d_dates.date_date]
      filters:
        d_dates.date_date: 2 days ago for 2 days
        d_objects.object_group: BILD
        d_objects.object_name: BILD,SPORT BILD
      sorts: [d_dates.date_date desc]
      limit: 500
      dynamic_fields: [{measure: app_adobe, based_on: f_traffic.sum_visits_day, type: count_distinct,
          label: App Adobe, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
      query_timezone: Europe/Berlin
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      join_fields:
      - field_name: d_dates.date_date
        source_field_name: d_dates.date_date
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: 040400f6-5004-4a05-b868-e34524e4607b
      options:
        steps: 5
    show_sql_query_menu_options: false
    pinned_columns:
      rank: left
    column_order: [rank, d_dates.date_date, visits]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      web: Desktop
      d_dates.date_date: Date
    series_column_widths:
      rank: 200
      d_dates.date_date: 254
    series_cell_visualizations:
      web:
        is_active: true
      visits:
        is_active: true
        palette:
          palette_id: f9bd39ce-7526-f632-0060-e519967d1bc6
          collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
          custom_colors:
          - "#666666"
          - "#666666"
    series_text_format:
      d_dates.date_date:
        fg_color: "#000000"
      rank:
        fg_color: "#000000"
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    enable_conditional_formatting: false
    header_font_color: "#000000"
    header_text_alignment: left
    header_font_size: '32'
    rows_font_size: '32'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: f_ivw_measures_with_plan_data.sum_visits_plan,
            id: f_ivw_measures_with_plan_data.sum_visits_plan, name: Sum Visits -
              Plan}, {axisId: web, id: web, name: Web}, {axisId: mobile, id: mobile,
            name: Mobile}, {axisId: apps, id: apps, name: Apps}], showLabels: true,
        showValues: true, valueFormat: "#,##0, \\K\\", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      web: "#df0029"
      mobile: "#0000ff"
      app_2: "#750E64"
      f_ivw_measures_with_plan_data.sum_visits_plan: "#dadada"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_grid
    hidden_fields: [app, app_adobe, web, mobile, app_2, f_ivw_measures_with_plan_data.sum_visits]
    sorts: [rank]
    dynamic_fields: [{table_calculation: app_2, label: App, expression: 'coalesce(${app},0)+
          coalesce(${app_adobe},0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {table_calculation: visits, label: Visits,
        expression: "${web}+${mobile}+coalesce(${app},0)+ coalesce(${app_adobe},0)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: rank, label: Rank, expression: 'rank(${visits},
          ${visits})', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    row: 180
    col: 0
    width: 24
    height: 9
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: spring
      explore: f_ivw_measures_with_plan_data
      type: looker_grid
      fields: [d_dates.date_date, mob_desktop, app]
      filters:
        d_dates.date_date: before 0 minutes ago
        d_objects.object_name: BILD,SPORT BILD
      sorts: [d_dates.date_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields: [{measure: web, based_on: f_ivw_measures_with_plan_data.sum_visits,
          type: count_distinct, label: Web, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="Desktop"'},
        {measure: mobile, based_on: f_ivw_measures_with_plan_data.sum_visits, type: count_distinct,
          label: Mobile, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: '${d_platforms.platform}="Mobile"'},
        {measure: app, based_on: f_ivw_measures_with_plan_data.sum_visits, type: count_distinct,
          label: App, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, filter_expression: "${d_platforms.platform}=\"App\"\n\
            AND ${d_dates.day}<add_days(-3, now())"}, {table_calculation: sum_visits_ivw,
          label: sum visits ivw, expression: "${web}+${mobile}", value_format: !!null '',
          value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
        {measure: mob_desktop, based_on: f_ivw_measures_with_plan_data.sum_visits,
          type: count_distinct, label: mob + desktop, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: "${d_platforms.platform}=\"\
            Mobile\"\nOR\n${d_platforms.platform}=\"Desktop\""}]
      query_timezone: Europe/Berlin
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: true
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: normal
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      color_application:
        collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
        palette_id: 040400f6-5004-4a05-b868-e34524e4607b
        options:
          steps: 5
      y_axes: [{label: '', orientation: left, series: [{axisId: web, id: web, name: Web},
            {axisId: mobile, id: mobile, name: Mobile}, {axisId: app, id: app, name: App}],
          showLabels: false, showValues: true, valueFormat: "#,##0, \\K\\", unpinAxis: false,
          tickDensity: default, type: linear}, {label: '', orientation: left, series: [
            {axisId: f_ivw_measures_with_plan_data.sum_visits_plan, id: f_ivw_measures_with_plan_data.sum_visits_plan,
              name: Sum Visits - Plan}], showLabels: false, showValues: false, unpinAxis: false,
          tickDensity: default, tickDensityCustom: 5, type: linear}]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: '50'
      series_types: {}
      x_axis_datetime_label: "%d-%m"
      reference_lines: []
      x_axis_label_rotation: -90
      defaults_version: 1
    - model: spring
      explore: f_traffic
      type: looker_grid
      fields: [app_adobe, d_dates.date_date]
      filters:
        d_dates.date_date: 2 days ago for 2 days
        d_objects.object_name: BILD,SPORT BILD
      sorts: [d_dates.date_date desc]
      limit: 500
      dynamic_fields: [{measure: app_adobe, based_on: f_traffic.sum_visits_day, type: count_distinct,
          label: App Adobe, value_format: !!null '', value_format_name: !!null '',
          _kind_hint: measure, _type_hint: number, filter_expression: '${d_platforms.platform}="App"'}]
      query_timezone: Europe/Berlin
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
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      join_fields:
      - field_name: d_dates.date_date
        source_field_name: d_dates.date_date
    font_size_main: '30'
    orientation: auto
    style_visits: "#000000"
    show_title_visits: true
    title_override_visits: Gestern
    title_placement_visits: below
    value_format_visits: '#,##0.00,, "mio"'
    style_rank: "#000000"
    show_title_rank: true
    title_placement_rank: below
    value_format_rank: ''
    show_comparison_rank: false
    title_overrride_visits: Gestern
    color_application:
      collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
      palette_id: 040400f6-5004-4a05-b868-e34524e4607b
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#ffffff"
    show_single_value_title: true
    single_value_title: Visits Yesterday
    value_format: "#,##0, k"
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: All Time Rank - Visits Yesterday
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#0000ff",
        font_color: "#eff1ff", color_application: {collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb,
          palette_id: 35e07ded-6aeb-49e1-bd84-b31d44055bd3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      rank: left
    column_order: ["$$$_row_numbers_$$$", rank, d_dates.date_date, visits]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      web: Desktop
      d_dates.date_date: Date
    series_cell_visualizations:
      web:
        is_active: true
      visits:
        is_active: true
        palette:
          palette_id: 56a7f23f-bafb-7be9-4650-215402d9d3fc
          collection_id: c5e4d818-dbd1-4eb8-a3cb-81c66defbdfb
          custom_colors:
          - "#0000ff"
          - "#0000ff"
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    header_font_color: "#000000"
    header_text_alignment: left
    header_font_size: '18'
    rows_font_size: '18'
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: f_ivw_measures_with_plan_data.sum_visits_plan,
            id: f_ivw_measures_with_plan_data.sum_visits_plan, name: Sum Visits -
              Plan}, {axisId: web, id: web, name: Web}, {axisId: mobile, id: mobile,
            name: Mobile}, {axisId: apps, id: apps, name: Apps}], showLabels: true,
        showValues: true, valueFormat: "#,##0, \\K\\", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      web: "#df0029"
      mobile: "#0000ff"
      app_2: "#750E64"
      f_ivw_measures_with_plan_data.sum_visits_plan: "#dadada"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    hidden_fields: [app_adobe, app_2, d_dates.date_date, mob_desktop, app]
    sorts: [d_dates.date_date desc]
    dynamic_fields: [{table_calculation: app_2, label: App, expression: 'coalesce(${app},0)+
          coalesce(${app_adobe},0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {table_calculation: visits, label: Visits,
        expression: "${mob_desktop}+coalesce(${app},0)+ coalesce(${app_adobe},0)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: rank, label: Rank, expression: 'rank(${visits},
          ${visits})', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    row: 5
    col: 0
    width: 15
    height: 5
  - title: New Tile
    name: New Tile (2)
    model: spring
    explore: f_traffic
    type: single_value
    fields: [d_objects.kontakt_info, d_objects.object_group]
    sorts: [d_objects.kontakt_info]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: undefined
    custom_color: "#000000"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#dc0002",
        font_color: !!null '', color_application: {collection_id: bild, palette_id: bild-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [d_objects.object_group]
    series_types: {}
    hidden_points_if_no: []
    series_labels: {}
    row: 196
    col: 0
    width: 11
    height: 2
