view: _opportunity {
  sql_table_name: salesforce.sf_opportunity ;;
  # dimensions #

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: campaign_id {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: close {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.closedate ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: created {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.createddate ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscalquarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscalyear ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecastcategory ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecastcategoryname ;;
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}.hasopportunitylineitem ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.isclosed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: is_private {
    type: yesno
    hidden: yes
    sql: ${TABLE}.isprivate ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.iswon ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stagename ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  # measures #

  measure: count {
    type: count
    drill_fields: [id, name, stage_name, forecast_category_name]
  }
}

#     filters:
#       opportunity.is_deleted: 0
