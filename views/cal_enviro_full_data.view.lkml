# The name of this view in Looker is "Cal Enviro Full Data"
view: cal_enviro_full_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `pandera-bi-demo.lacoe_test.Cal_Enviro_full_data` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " 2019 Chronic Abs All" in Explore.

  dimension: _2019_chronic_abs_all {
    type: number
    sql: ${TABLE}._2019_Chronic_Abs_ALL ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  dimension: site_nav {
    type: string
    sql: "" ;;
    html:
    <div style="border:solid 0px #000000; border-radius: 4px; padding: 10px 12px;
               background: #00A1F1; text-align: left; font-family:Google Sans; height: 100%">
    <nav style="font-size: 14px; letter-spacing: 1px;">
<a style="padding: 16px; line-height: 40px; color:#FFFFFF;" href="/dashboards/631 ">Health Factors - LACOE</a>
<a style="padding: 16px; line-height: 40px; color:#FFFFFF;" >|</a>
<a style="padding: 16px; line-height: 40px; color:#FFFFFF;" href="/dashboards/633 ">Environ Factors - LACOE</a>
<a style="padding: 16px; line-height: 40px; color:#FFFFFF;" >|</a>
<a style="padding: 16px; line-height: 40px; color:#FFFFFF;" href="/dashboards/630 ">Social Factors - LACOE</a>
<a style="padding: 16px; line-height: 40px; color:#FFFFFF;" >|</a>
      </nav>
      </div>
      ;;
  }

  measure: total__2019_chronic_abs_all {
    type: sum
    sql: ${_2019_chronic_abs_all} ;;  }
  measure: average__2019_chronic_abs_all {
    type: average
    sql: ${_2019_chronic_abs_all} ;;  }

  dimension: _2022_chronic_abs_all {
    type: number
    sql: ${TABLE}._2022_Chronic_Abs_ALL ;;
  }

  dimension: _2023_chronic_abs_all {
    type: number
    sql: ${TABLE}._2023_Chronic_Abs_ALL ;;
  }

  dimension: approx_loc {
    type: string
    sql: ${TABLE}.Approx_Loc ;;
  }

  dimension: asthma_p {
    type: number
    sql: ${TABLE}.Asthma_P ;;
  }

  dimension: cal_env_indicators {
    type: string
    sql: ${TABLE}.Cal_Env_Indicators ;;
  }

  dimension: cal_env_value {
    type: number
    sql: ${TABLE}.Cal_Env_Value ;;
  }

  dimension: cardiovas_p {
    type: number
    sql: ${TABLE}.Cardiovas_P ;;
  }

  dimension: cds_code {
    type: number
    sql: ${TABLE}.CDS_Code ;;
  }

  dimension: district1 {
    type: string
    sql: ${TABLE}.District1 ;;
    map_layer_name: school_district_boundaries
  }

  dimension: drink_wat_p {
    type: number
    sql: ${TABLE}.Drink_Wat_P ;;
  }

  dimension: enr_2023 {
    type: number
    sql: ${TABLE}.ENR_2023 ;;
  }

  dimension: enr___2_yr_change {
    type: number
    sql: ${TABLE}.ENR___2_Yr_change ;;
  }

  dimension: enr___4_yr_change {
    type: number
    sql: ${TABLE}.ENR___4_Yr_change ;;
  }

  dimension: enr___6_yr_change {
    type: number
    sql: ${TABLE}.ENR___6_Yr_change ;;
  }

  dimension: enr___8_yr_change {
    type: number
    sql: ${TABLE}.ENR___8_Yr_Change ;;
  }

  dimension: geometry {
    type: string
    sql: ${TABLE}.Geometry ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: latitude__generated_ {
    type: number
    sql: ${TABLE}.Latitude__generated_ ;;
  }

  dimension: lead_p {
    type: number
    sql: ${TABLE}.Lead_P ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: longitude__generated_ {
    type: number
    sql: ${TABLE}.Longitude__generated_ ;;
  }

  dimension: low_birt_wt {
    type: number
    sql: ${TABLE}.Low_Birt_Wt ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}.Neighborhood ;;
  }

  dimension: ozone_p {
    type: number
    sql: ${TABLE}.Ozone_P ;;
  }

  dimension: school {
    type: string
    sql: ${TABLE}.School ;;
  }
  dimension: school_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: soc_type {
    type: string
    sql: ${TABLE}.SOC_Type ;;
  }

  dimension: tract {
    type: number
    sql: ${TABLE}.Tract ;;
  }

  dimension: traffic_p {
    type: number
    sql: ${TABLE}.Traffic_P ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude__generated_} ;;
    sql_longitude: ${longitude__generated_} ;;
  }

  parameter: env_metric_picker {
    label: "Environmental Factors"
    type: unquoted
    allowed_value: {
      label: "Traffic %"
      value: "TT"
    }
    allowed_value: {
      label: "Ozone %"
      value: "OZ"
    }
    allowed_value: {
      label: "Lead %"
      value: "LD"
    }
    allowed_value: {
      label: "Drinking Water %"
      value: "DW"
    }
  }

  measure: dynamic_measure_env {
    type: number
    label_from_parameter: env_metric_picker
    sql:
    {% if env_metric_picker._parameter_value == 'TT' %}
      ${avg_percent_traffic}
    {% elsif env_metric_picker._parameter_value == 'OZ' %}
      ${avg_percent_ozone}
      {% elsif env_metric_picker._parameter_value == 'LD' %}
      ${avg_percent_lead}
      {% elsif env_metric_picker._parameter_value == 'DW' %}
      ${avg_percent_drink_wat}
    {% else %}
      ${avg_percent_traffic}
    {% endif %};;
  }

  parameter: hlt_metric_picker {
    label: "Health Factors"
    type: unquoted
    allowed_value: {
      label: "Asthama %"
      value: "AST"
    }
    allowed_value: {
      label: "Cardiovascular %"
      value: "CDV"
    }
    allowed_value: {
      label: "Low Birth Weight %"
      value: "LBW"
    }
  }

  measure: dynamic_measure_hlt {
    type: number
    label_from_parameter: hlt_metric_picker
    sql:
    {% if hlt_metric_picker._parameter_value == 'AST' %}
      ${avg_percent_asthma}
    {% elsif hlt_metric_picker._parameter_value == 'CDV' %}
      ${avg_percent_cardiovascular_disease}
      {% elsif hlt_metric_picker._parameter_value == 'LBW' %}
      ${avg_percent_low_birt_wt}
    {% else %}
      ${avg_percent_asthma}
    {% endif %};;
  }

  measure:  avg_percent_ozone {
    type: average
    sql: ${ozone_p} ;;
  }

  measure:  avg_percent_traffic {
    type: average
    sql: ${traffic_p} ;;
  }

  measure: avg_percent_asthma {
    type: average
    sql: ${asthma_p} ;;
  }

  measure: avg_percent_cardiovascular_disease {
    type: average
    sql: ${cardiovas_p} ;;
  }

  measure: avg_percent_low_birt_wt {
    type: average
    sql: ${low_birt_wt} ;;
  }

  measure: avg_percent_lead {
    type: average
    sql: ${lead_p} ;;
  }

  measure: avg_percent_drink_wat {
    type: average
    sql: ${drink_wat_p} ;;
  }

  measure: count {
    type: count
  }
}
