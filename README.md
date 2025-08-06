# sumup-sales-analysis\
This repository includes data models for both staging and business marts, built using Salesforce data from the Lead, Account, and Opportunity objects.
The two base data used to create these tables are lead and opportunity objects. Below is a detailed information on the contents of the two tables. 

Leads:

    ● ID : Primary key of the Lead table
    ● CONVERTED_ACCOUNT_ID: Converted Account ID, only filled when the lead is converted
    ● A_LEAD_ASSOCIATED_COUNTRY_C: Country of the lead.
    ● LEAD_UTM_SOURCE_C: the last attributed UTM source parameter (last-click attribution)
    ● CREATED_DATE: Timestamp when the record has been created
    ● A_LEAD_FIRST_REACH_OUT_DATE__C: First timestamp when the lead has been reached out.
    ● A_LEAD_FIRST_MEETING_CREATION_DATE__C: The first timestamp when an LDR scheduled a sales meeting for a sales representative. This is the date the meeting has been created not when it has been scheduled for.
    ● A_LEAD_FIRST_MEETING_DATE_C: The first meeting scheduled date
    ● A_LEAD_LAST_MEETING_DATE_C: The last meeting scheduled date, if the meeting has been postponed
    ● IS_DELETED: Is a deleted record

Opportunity:

    ● ID: Primary key of the Opportunity record
    ● ACCOUNT_ID: Foreign key. ID of the Account.
    ● CREATED_DATE: Record creation date, when the meeting started.
    ● QUOTE_CREATED_DATE: Date when a quote has been created.
    ● QUOTE_SIGNED_DATE: Date when a quote has been signed.
    ● QUOTE_MRR: Monthly recurring revenue of the quote
    ● IS_DELETED: Is a deleted record
