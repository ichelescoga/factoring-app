const APPLICATION_EVAL_DATA = [
  {
    "No_Authorization": 1,
    "client": "CORPORAC",
    "invoice_amount": "Q1,446,060.15",
    "utilization_percentage": "100%",
    "usage_amount": "Q1,446,060.15",
    "days_of_use": 45,
    "interest_amount": "Q 32,536.35",
    "commissions": "Q 3,615.15",
    "IVA": "Q 4,338.18",
    "total_discount": "Q 40,489.68",
    "disbursement": "Q1.405.570.47",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/15/2024",
    "available_space": "2,553,939.85",
    "overdue_balance": null,
    "analysis": "Aprobado"
  },
  {
    "No_Authorization": 2,
    "client": "CORPORAC",
    "invoice_amount": "Q 197,433.29",
    "utilization_percentage": "100%",
    "usage_amount": "Q 197,433.29",
    "days_of_use": 45,
    "interest_amount": "Q 4,442.25",
    "commissions": "Q 493.58",
    "IVA": "Q 592,30",
    "total_discount": "Q 5,528.13",
    "disbursement": "Q 191,905.16",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/15/2024",
    "available_space": "2,356,506.56",
    "overdue_balance": null,
    "analysis": "Denegado"
  },
  {
    "No_Authorization": 3,
    "client": "CORPORAC",
    "invoice_amount": "Q 261,148.09",
    "utilization_percentage": "100%",
    "usage_amount": "Q 261,148.09",
    "days_of_use": 45,
    "interest_amount": "Q 5,875.83",
    "commissions": "Q 652.87",
    "IVA": "Q 783.44",
    "total_discount": "Q 7,312.15",
    "disbursement": "Q 253.835,94",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/15/2024",
    "available_space": "2,095,358.47",
    "overdue_balance": null,
    "analysis": "Aprobado"
  },
  {
    "No_Authorization": 4,
    "client": "CORPORA",
    "invoice_amount": "Q 348,773.21",
    "utilization_percentage": "100%",
    "usage_amount": "Q 348,773.21",
    "days_of_use": 45,
    "interest_amount": "Q 7,847.40",
    "commissions": "Q 871.93",
    "IVA": "Q 1,046.32",
    "total_discount": "Q 9,765.65",
    "disbursement": "Q 339,007.56",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/15/2024",
    "available_space": "1,746,585.26",
    "overdue_balance": null,
    "analysis": "Denegado"
  },
  {
    "No_Authorization": 5,
    "client": "CORPORAC",
    "invoice_amount": "Q 241,900.00",
    "utilization_percentage": "100%",
    "usage_amount": "Q 241,900.00",
    "days_of_use": 45,
    "interest_amount": "Q 5,442.75",
    "commissions": "Q 604.75",
    "IVA": "Q 725.70",
    "total_discount": "Q 6,773.20",
    "disbursement": "Q 235,126.80",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/15/2024",
    "available_space": "1,504,685.26",
    "overdue_balance": null,
    "analysis": "Aprobado"
  },
  {
    "No_Authorization": 6,
    "client": "CORPORAC",
    "invoice_amount": "Q 397,950.00",
    "utilization_percentage": "100%",
    "usage_amount": "Q 397,950.00",
    "days_of_use": 60,
    "interest_amount": "Q 11,938.50",
    "commissions": "Q 994.88",
    "IVA": "Q 1,552.01",
    "total_discount": "Q 14,485.38",
    "disbursement": "Q 383,464.62",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/30/2024",
    "available_space": "1,106,735.26",
    "overdue_balance": null,
    "analysis": "Aprobado"
  },
  {
    "No_Authorization": 7,
    "client": "CORPORAC",
    "invoice_amount": "Q1.162,935.06",
    "utilization_percentage": "100%",
    "usage_amount": "Q1.162.935.06",
    "days_of_use": 90,
    "interest_amount": "Q 52,332.08",
    "commissions": "Q 2,907.34",
    "IVA": "Q 6,628.73",
    "total_discount": "Q 61,868.15",
    "disbursement": "Q1.101.066.91",
    "date_disbursement": "30/01/2024",
    "payment_date": "4/29/2024",
    "available_space": "56,199.80",
    "overdue_balance": null,
    "analysis": "Aprobado"
  }
];

const ACCOUNTING_DATA = [
  {
    "No_Authorization": 1,
    "client": "CORPORAC",
    "invoice_amount": "Q1,446,060.15",
    "utilization_percentage": "100%",
    "usage_amount": "Q1,446,060.15",
    "days_of_use": 45,
    "interest_amount": "Q 32,536.35",
    "commissions": "Q 3,615.15",
    "IVA": "Q 4,338.18",
    "total_discount": "Q 40,489.68",
    "disbursement": "Q1,405,570.47",
    "date_disbursement": "30/01/2024",
    "payment_date": "3/15/2024",
    "available_space": "2,553,939.85",
    "overdue_balance": null,
    "analysis": null,
    "approved": "Si",
    "finalDisbursement": "Q1,405,570.47",
  },
  {
    "No_Authorization": 2,
    "client": "CLIENTE123",
    "invoice_amount": "Q800,000.75",
    "utilization_percentage": "85%",
    "usage_amount": "Q680,000.64",
    "days_of_use": 30,
    "interest_amount": "Q15,320.45",
    "commissions": "Q2,100.75",
    "IVA": "Q3,240.12",
    "total_discount": "Q20,661.32",
    "disbursement": "Q660,339.68",
    "date_disbursement": "15/02/2024",
    "payment_date": "3/15/2024",
    "available_space": "1,200,000.00",
    "overdue_balance": null,
    "analysis": "Aprobado",
    "approved": "Si",
    "finalDisbursement": "Q1,405,570.47",
  },
  {
    "No_Authorization": 3,
    "client": "EMPRESA45a6",
    "invoice_amount": "Q2,500,000.00",
    "utilization_percentage": "60%",
    "usage_amount": "Q1,500,000.00",
    "days_of_use": 60,
    "interest_amount": "Q35,000.00",
    "commissions": "Q3,750.00",
    "IVA": "Q4,500.00",
    "total_discount": "Q43,250.00",
    "disbursement": "Q1,456,750.00",
    "date_disbursement": "10/01/2024",
    "payment_date": "4/30/2024",
    "available_space": "1,043,250.00",
    "overdue_balance": null,
    "analysis": "Pendiente",
    "approved": "Si",
    "finalDisbursement": "Q1,405,570.47",
  },
  {
    "No_Authorization": 4,
    "client": "EMPRESA45a6",
    "invoice_amount": "Q2,500,000.00",
    "utilization_percentage": "60%",
    "usage_amount": "Q1,500,000.00",
    "days_of_use": 60,
    "interest_amount": "Q35,000.00",
    "commissions": "Q3,750.00",
    "IVA": "Q4,500.00",
    "total_discount": "Q43,250.00",
    "disbursement": "Q1,456,750.00",
    "date_disbursement": "10/01/2024",
    "payment_date": "4/30/2024",
    "available_space": "1,043,250.00",
    "overdue_balance": null,
    "analysis": "Pendiente",
    "approved": "Si",
    "finalDisbursement": "Q1,405,570.47",
  },
  {
    "No_Authorization": 5,
    "client": "EMPRESA4s56",
    "invoice_amount": "Q2,500,000.00",
    "utilization_percentage": "60%",
    "usage_amount": "Q1,500,000.00",
    "days_of_use": 60,
    "interest_amount": "Q35,000.00",
    "commissions": "Q3,750.00",
    "IVA": "Q4,500.00",
    "total_discount": "Q43,250.00",
    "disbursement": "Q1,456,750.00",
    "date_disbursement": "10/01/2024",
    "payment_date": "4/30/2024",
    "available_space": "1,043,250.00",
    "overdue_balance": null,
    "analysis": "Pendiente",
    "approved": "Si",
    "finalDisbursement": "Q1,405,570.47",
  },
  {
    "No_Authorization": 6,
    "client": "EMPRESA45a6",
    "invoice_amount": "Q2,500,000.00",
    "utilization_percentage": "60%",
    "usage_amount": "Q1,500,000.00",
    "days_of_use": 60,
    "interest_amount": "Q35,000.00",
    "commissions": "Q3,750.00",
    "IVA": "Q4,500.00",
    "total_discount": "Q43,250.00",
    "disbursement": "Q1,456,750.00",
    "date_disbursement": "10/01/2024",
    "payment_date": "4/30/2024",
    "available_space": "1,043,250.00",
    "overdue_balance": null,
    "analysis": "Pendiente",
    "approved": "Si",
    "finalDisbursement": "Q1,405,570.47",
  }
];
