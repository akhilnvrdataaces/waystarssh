view: currentaccountinfo {
  sql_table_name: dbo.Currentaccountinfo ;;

  dimension: accountinfoid {
    type: string
    # hidden: yes
    sql: ${TABLE}.accountinfoid ;;
  }

  dimension: accounting_code {
    type: string
    sql: ${TABLE}.AccountingCode ;;
  }

  dimension: c_id {
    type: number
    sql: ${TABLE}.C_id ;;
  }

  dimension: currentbalance {
    type: number
    sql: ${TABLE}.Currentbalance ;;
  }

  dimension: facilityid {
    type: string
    sql: ${TABLE}.Facilityid ;;
  }

  dimension: guarantor_id {
    type: string
    sql: ${TABLE}.GuarantorId ;;
  }

  dimension: line_item {
    type: string
    sql: ${TABLE}.LineItem ;;
  }

  dimension: patient_account_id {
    type: string
    sql: ${TABLE}.PatientAccountId ;;
  }

  dimension: patientid {
    type: string
    sql: ${TABLE}.Patientid ;;
  }

  dimension: visitid {
    type: string
    sql: ${TABLE}.visitid ;;
  }

  measure: count {
    type: count
    drill_fields: [accountinfo.id]
  }
}
