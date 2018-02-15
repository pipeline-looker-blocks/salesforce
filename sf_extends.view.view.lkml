include: "contact.view.lkml"
include: "user.view.lkml"
include: "campaign.view.lkml"
include: "opportunity.view.lkml"
include: "lead.view.lkml"
include: "account.view.lkml"
view: account {
  extends: [_account]
  # dimensions #

  dimension: business_segment {
    type: string

    case: {
      when: {
        sql: ${number_of_employees} BETWEEN 0 AND 500 ;;
        label: "Small Business"
      }

      when: {
        sql: ${number_of_employees} BETWEEN 501 AND 1000 ;;
        label: "Mid-Market"
      }

      when: {
        sql: ${number_of_employees} > 1000 ;;
        label: "Enterprise"
      }

      else: "Unknown"
    }
  }

  # measures #

  measure: percent_of_accounts {
    type: percent_of_total
    sql: ${account.count} ;;
  }

  measure: average_annual_revenue {
    type: average
    sql: ${account.annual_revenue} ;;
    value_format: "$#,##0"
  }

  #     filters:
  #       account.is_deleted: -'0'

  measure: total_number_of_employees {
    type: sum
    sql: ${account.number_of_employees} ;;
  }

  #     filters:
  #       account.is_deleted: -'0'

  measure: average_number_of_employees {
    type: average
    sql: ${account.number_of_employees} ;;
  }

  #     filters:
  #       account.is_deleted: -'0'

  measure: count_customers {
    type: count

    filters: {
      field: account.type
      value: "\"Customer\""
    }
  }
}

#       account.is_deleted: -'0'

view: lead {
  extends: [_lead]

  dimension: created {
    #X# Invalid LookML inside "dimension": {"timeframes":["time","date","week","month","raw"]}
  }

  dimension: name {
    html: <a href="https://na9.salesforce.com/{{ lead.id._value }}" target="_new">
      <img src="https://www.salesforce.com/favicon.ico" height=16 width=16></a>
      {{ linked_value }}
      ;;
  }

  dimension: number_of_employees_tier {
    type: tier
    tiers: [
      0,
      1,
      11,
      51,
      201,
      501,
      1001,
      5001,
      10000
    ]
    sql: ${number_of_employees} ;;
    style: integer
    description: "Number of Employees as reported on the Salesforce lead"
  }

  measure: converted_to_contact_count {
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_contact_id
      value: "-null"
    }
  }

  #       lead.is_deleted: -'0'

  measure: converted_to_account_count {
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_account_id
      value: "-null"
    }
  }

  #       lead.is_deleted: -'0'

  measure: converted_to_opportunity_count {
    type: count
    drill_fields: [detail*]

    filters: {
      field: converted_opportunity_id
      value: "-null"
    }
  }

  #       lead.is_deleted: -'0'

  measure: conversion_to_contact_percent {
    sql: 100.00 * ${converted_to_contact_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_account_percent {
    sql: 100.00 * ${converted_to_account_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_opportunity_percent {
    sql: 100.00 * ${converted_to_opportunity_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  set: detail {
    fields: [
      id,
      company,
      name,
      title,
      phone,
      email,
      status
    ]
  }
}

view: opportunity {
  extends: [_opportunity]
  # dimensions #

  dimension: is_lost {
    type: yesno
    sql: ${is_closed} AND NOT ${is_won} ;;
  }

  dimension: probability_group {
    case: {
      when: {
        sql: ${probability} = 100 ;;
        label: "Won"
      }

      when: {
        sql: ${probability} > 80 ;;
        label: "Above 80%"
      }

      when: {
        sql: ${probability} > 60 ;;
        label: "60 - 80%"
      }

      when: {
        sql: ${probability} > 40 ;;
        label: "40 - 60%"
      }

      when: {
        sql: ${probability} > 20 ;;
        label: "20 - 40%"
      }

      when: {
        sql: ${probability} > 0 ;;
        label: "Under 20%"
      }

      when: {
        sql: ${probability} = 0 ;;
        label: "Lost"
      }
    }
  }

  dimension_group: created {
    type: time
    timeframes:[date,week,month,raw]
    sql: ${TABLE}.createddate;;
  }

  dimension_group: close {
    type: time
    timeframes:[date,week,month,raw]
    sql: ${TABLE}.closedate;;
  }

  dimension: days_open {
    type: number
    sql: datediff(days, ${created_date}, coalesce(${close_date}, current_date() ) ;;
  }

  dimension: created_to_closed_in_60 {
    hidden: yes
    type: yesno
    sql: ${days_open} <=60 AND ${is_closed} = 'yes' AND ${is_won} = 'yes' ;;
  }

  # measures #

  measure: total_revenue {
    type: sum
    sql: ${amount} ;;
    value_format: "$#,##0"
    #X# Invalid LookML inside "measure": {"filters":null}
  }

  #       opportunity.is_deleted: 0

  measure: average_revenue_won {
    label: "Average Revenue (Closed/Won)"
    type: average
    sql: ${amount} ;;

    filters: {
      field: is_won
      value: "Yes"
    }

    #       is_deleted: 0
    value_format: "$#,##0"
  }

  measure: average_revenue_lost {
    label: "Average Revenue (Closed/Lost)"
    type: average
    sql: ${amount} ;;

    filters: {
      field: is_lost
      value: "Yes"
    }

    #       is_deleted: 0
    value_format: "$#,##0"
  }

  measure: total_pipeline_revenue {
    type: sum
    sql: ${amount} ;;

    filters: {
      field: is_closed
      value: "No"
    }

    #       is_deleted: 0
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";$0.00"
  }

  measure: average_deal_size {
    type: average
    sql: ${amount} ;;
    value_format: "$#,##0"
  }

  #     filters:
  #       opportunity.is_deleted: 0

  measure: count_won {
    type: count

    filters: {
      field: is_won
      value: "Yes"
    }

    #       is_deleted: 0
    drill_fields: [opportunity.id, account.name, type]
  }

  measure: average_days_open {
    type: average
    sql: ${days_open} ;;
  }

  #     filters:
  #       opportunity.is_deleted: 0

  measure: count_closed {
    type: count

    filters: {
      field: is_closed
      value: "Yes"
    }
  }

  #       is_deleted: 0

  measure: count_open {
    type: count

    filters: {
      field: is_closed
      value: "No"
    }
  }

  #       is_deleted: 0

  measure: count_lost {
    type: count

    filters: {
      field: is_closed
      value: "Yes"
    }

    filters: {
      field: is_won
      value: "No"
    }

    #       is_deleted: 0
    drill_fields: [opportunity.id, account.name, type]
  }

  measure: win_percentage {
    type: number
    sql: 100.00 * ${count_won} / NULLIF(${count_closed}, 0) ;;
    value_format: "#0.00\%"
  }

  measure: open_percentage {
    type: number
    sql: 100.00 * ${count_open} / NULLIF(${count}, 0) ;;
    value_format: "#0.00\%"
  }

  measure: count_new_business_won {
    type: count

    filters: {
      field: is_won
      value: "Yes"
    }

    filters: {
      field: opportunity.type
      value: "\"New Business\""
    }

    #       is_deleted: 0
    drill_fields: [opportunity.id, account.name, type]
  }

  measure: count_new_business {
    type: count

    filters: {
      field: opportunity.type
      value: "\"New Business\""
    }

    #       is_deleted: 0
    drill_fields: [opportunity.id, account.name, type]
  }
}

view: campaign {
  extends: [_campaign]
}

view: user {
  extends: [_user]
  # dimensions #

  filter: name_select {
    suggest_dimension: name
  }

#   filter: department_select {
#     suggest_dimension: department
#   }


  # rep_comparitor currently depends on "account.business_segment" instead of the intended
  # "department" field. If a custom user table attribute "department" exists,
  # replace business_segment with it.
  dimension: rep_comparitor {
    sql: CASE
        WHEN {% condition name_select %} ${name} {% endcondition %}
          THEN ${name}
      ELSE 'Rest of Sales Team'
      END
       ;;
  }

  dimension_group: created {
    type:  time
    timeframes: [date,week,month,raw]
    sql:${TABLE}.createddate ;;
  }

  dimension: age_in_months {
    type: number
    sql: datediff(days,${created_raw},current_date) ;;
  }

  measure: average_revenue_pipeline {
    type: number
    sql: ${opportunity.total_pipeline_revenue}/ NULLIF(${count},0) ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [account.name, opportunity.type, opportunity.closed_date, opportunity.total_acv]
  }

  set: opportunity_set {
    fields: [average_revenue_pipeline]
  }
}

view: contact {
  extends: [_contact]

  dimension: name {
    html: <a href="mailto:{{ contact.email._value }}" target="_blank">
        <img src="https://upload.wikimedia.org/wikipedia/commons/4/4e/Gmail_Icon.png" width="16" height="16" />
      </a>
      {{ linked_value }}
      ;;
  }
}
