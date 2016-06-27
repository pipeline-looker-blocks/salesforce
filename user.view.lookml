- view: user
  sql_table_name: salesforce.sf_user
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: about_me
    type: string
    sql: ${TABLE}.aboutme

  - dimension: account_id
    type: string
    hidden: true
    sql: ${TABLE}.accountid

  - dimension: alias
    type: string
    sql: ${TABLE}.alias

  - dimension: badge_text
    type: string
    sql: ${TABLE}.badgetext

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: community_nickname
    type: string
    sql: ${TABLE}.communitynickname

  - dimension: company_name
    type: string
    sql: ${TABLE}.companyname

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: created_by_id
    type: string
    sql: ${TABLE}.createdbyid

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createddate

  - dimension: default_group_notification_frequency
    type: string
    sql: ${TABLE}.defaultgroupnotificationfrequency

  - dimension: digest_frequency
    type: string
    sql: ${TABLE}.digestfrequency

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: email_encoding_key
    type: string
    sql: ${TABLE}.emailencodingkey

  - dimension: email_preferences_auto_bcc
    type: yesno
    sql: ${TABLE}.emailpreferencesautobcc

  - dimension: email_preferences_auto_bcc_stay_in_touch
    type: yesno
    sql: ${TABLE}.emailpreferencesautobccstayintouch

  - dimension: email_preferences_stay_in_touch_reminder
    type: yesno
    sql: ${TABLE}.emailpreferencesstayintouchreminder

  - dimension: first_name
    type: string
    sql: ${TABLE}.firstname

  - dimension: forecast_enabled
    type: yesno
    sql: ${TABLE}.forecastenabled

  - dimension: full_photo_url
    type: string
    sql: ${TABLE}.fullphotourl

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.isactive

  - dimension: language_locale_key
    type: string
    sql: ${TABLE}.languagelocalekey

  - dimension_group: last_login
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastlogindate

  - dimension: last_modified_by_id
    type: string
    sql: ${TABLE}.lastmodifiedbyid

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastmodifieddate

  - dimension: last_name
    type: string
    sql: ${TABLE}.lastname

  - dimension_group: last_password_change
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastpasswordchangedate

  - dimension_group: last_referenced
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastreferenceddate

  - dimension_group: last_viewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastvieweddate

  - dimension: locale_sid_key
    type: string
    sql: ${TABLE}.localesidkey

  - dimension: mobile_phone
    type: string
    sql: ${TABLE}.mobilephone

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: phone
    type: string
    sql: ${TABLE}.phone
    
  - dimension: postal_code
    type: string
    sql: ${TABLE}.postalcode

  - dimension: profile_id
    type: string
    sql: ${TABLE}.profileid

  - dimension: receives_admin_info_emails
    type: yesno
    sql: ${TABLE}.receivesadmininfoemails

  - dimension: receives_info_emails
    type: yesno
    sql: ${TABLE}.receivesinfoemails

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: street
    type: string
    sql: ${TABLE}.street

  - dimension_group: system_modstamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.systemmodstamp

  - dimension: time_zone_sid_key
    type: string
    sql: ${TABLE}.timezonesidkey

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: user_permissions_call_center_auto_login
    type: yesno
    sql: ${TABLE}.userpermissionscallcenterautologin

  - dimension: user_permissions_chatter_answers_user
    type: yesno
    sql: ${TABLE}.userpermissionschatteranswersuser

  - dimension: user_permissions_interaction_user
    type: yesno
    sql: ${TABLE}.userpermissionsinteractionuser

  - dimension: user_permissions_knowledge_user
    type: yesno
    sql: ${TABLE}.userpermissionsknowledgeuser

  - dimension: user_permissions_marketing_user
    type: yesno
    sql: ${TABLE}.userpermissionsmarketinguser

  - dimension: user_permissions_mobile_user
    type: yesno
    sql: ${TABLE}.userpermissionsmobileuser

  - dimension: user_permissions_offline_user
    type: yesno
    sql: ${TABLE}.userpermissionsofflineuser

  - dimension: user_permissions_sfcontent_user
    type: yesno
    sql: ${TABLE}.userpermissionssfcontentuser

  - dimension: user_preferences_activity_reminders_popup
    type: yesno
    sql: ${TABLE}.userpreferencesactivityreminderspopup

  - dimension: user_preferences_apex_pages_developer_mode
    type: yesno
    sql: ${TABLE}.userpreferencesapexpagesdevelopermode

  - dimension: userpreferencescontentemailasandwhen
    type: yesno
    sql: ${TABLE}.userpreferencescontentemailasandwhen

  - dimension: user_preferences_content_no_email
    type: yesno
    sql: ${TABLE}.userpreferencescontentnoemail

  - dimension: user_preferences_disable_all_feeds_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisableallfeedsemail

  - dimension: user_preferences_disable_bookmark_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablebookmarkemail

  - dimension: user_preferences_disable_change_comment_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablechangecommentemail

  - dimension: user_preferences_disable_endorsement_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisableendorsementemail

  - dimension: user_preferences_disable_feedback_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefeedbackemail

  - dimension: user_preferences_disable_file_share_notifications_for_api
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefilesharenotificationsforapi

  - dimension: user_preferences_disable_followers_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefollowersemail

  - dimension: user_preferences_disable_later_comment_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablelatercommentemail

  - dimension: user_preferences_disable_like_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablelikeemail

  - dimension: user_preferences_disable_mentions_post_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablementionspostemail

  - dimension: user_preferences_disable_message_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablemessageemail

  - dimension: user_preferences_disable_profile_post_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisableprofilepostemail

  - dimension: user_preferences_disable_share_post_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisablesharepostemail

  - dimension: user_preferences_disable_work_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisableworkemail

  - dimension: user_preferences_discomment_after_like_email
    type: yesno
    sql: ${TABLE}.userpreferencesdiscommentafterlikeemail

  - dimension: user_preferences_dismentions_comment_email
    type: yesno
    sql: ${TABLE}.userpreferencesdismentionscommentemail

  - dimension: user_preferences_disprof_post_comment_email
    type: yesno
    sql: ${TABLE}.userpreferencesdisprofpostcommentemail

  - dimension: user_preferences_enable_autosub_for_feeds
    type: yesno
    sql: ${TABLE}.userpreferencesenableautosubforfeeds

  - dimension: user_preferences_event_reminders_checkbox_default
    type: yesno
    sql: ${TABLE}.userpreferenceseventreminderscheckboxdefault

  - dimension: user_preferences_hide_chatter_onboarding_splash
    type: yesno
    sql: ${TABLE}.userpreferenceshidechatteronboardingsplash

  - dimension: user_preferences_hide_csndesktop_task
    type: yesno
    sql: ${TABLE}.userpreferenceshidecsndesktoptask

  - dimension: user_preferences_hide_csnget_chatter_mobile_task
    type: yesno
    sql: ${TABLE}.userpreferenceshidecsngetchattermobiletask

  - dimension: user_preferences_hide_s_1_browser_ui
    type: yesno
    sql: ${TABLE}.userpreferenceshides1browserui

  - dimension: user_preferences_hide_second_chatter_onboarding_splash
    type: yesno
    sql: ${TABLE}.userpreferenceshidesecondchatteronboardingsplash
    
  - dimension: user_preferences_lightning_experience_preferred
    type: yesno
    sql: ${TABLE}.userpreferenceslightningexperiencepreferred

  - dimension: user_preferences_reminder_sound_off
    type: yesno
    sql: ${TABLE}.userpreferencesremindersoundoff

  - dimension: user_preferences_show_city_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowcitytoexternalusers

  - dimension: user_preferences_show_city_to_guest_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowcitytoguestusers

  - dimension: user_preferences_show_country_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowcountrytoexternalusers

  - dimension: user_preferences_show_country_to_guest_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowcountrytoguestusers

  - dimension: user_preferences_show_email_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowemailtoexternalusers

  - dimension: user_preferences_show_fax_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowfaxtoexternalusers

  - dimension: user_preferences_show_manager_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowmanagertoexternalusers

  - dimension: user_preferences_show_mobile_phone_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowmobilephonetoexternalusers

  - dimension: user_preferences_show_postal_code_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowpostalcodetoexternalusers

  - dimension: user_preferences_show_postal_code_to_guest_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowpostalcodetoguestusers

  - dimension: user_preferences_show_profile_pic_to_guest_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowprofilepictoguestusers

  - dimension: user_preferences_show_state_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowstatetoexternalusers

  - dimension: user_preferences_show_state_to_guest_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowstatetoguestusers

  - dimension: user_preferences_show_street_address_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowstreetaddresstoexternalusers

  - dimension: user_preferences_show_title_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowtitletoexternalusers

  - dimension: user_preferences_show_title_to_guest_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowtitletoguestusers

  - dimension: user_preferences_show_work_phone_to_external_users
    type: yesno
    sql: ${TABLE}.userpreferencesshowworkphonetoexternalusers

  - dimension: user_preferences_task_reminders_checkbox_default
    type: yesno
    sql: ${TABLE}.userpreferencestaskreminderscheckboxdefault

  - dimension: user_role_id
    type: string
    sql: ${TABLE}.userroleid

  - dimension: user_type
    type: string
    sql: ${TABLE}.usertype


# measures #

  - measure: count
    type: count
    drill_fields: detail*

  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - username
    - company_name
    - last_name
    - name
    - company_name
    - community_nickname
    - firstname

