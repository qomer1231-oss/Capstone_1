# Capstone_1

EmporiUm is a fictional student bookstore chain. This Year Up capstone analyzes **Ohio online sales** using the supplied `sample_sales` database and Excel.

## Files

- `Qureshi_sales_analysis.sql`: the student's six-question analysis, with review notes explaining scope and limitations. The product exploration originally staged in Git is preserved at the end.
- `Qureshi_ohio_monthly_revenue.csv`: the 33 numeric monthly results from Question 2, read from MySQL Workbench and independently reconciled to the supplied database script.
- `Qureshi_territory_chart.xlsx`: a native Excel PivotTable and line PivotChart. `Monthly data` holds numeric revenue, year, month, and a sortable `YYYY-MM` period. `Revenue` uses **Sum**, with periods ordered chronologically.

## Results and chart

Ohio has **1,408 recorded online sales**, totaling **$992,242.72**, from **January 2, 2022 through October 20, 2025**. There are 33 months with recorded sales. The monthly totals reconcile to the overall total. Months without rows are omitted, and 2025 contains only February, July, and October; do not compare these as equally complete years or interpret the line as a forecast.

The chart uses Question 2 because it directly shows revenue over time. The previous Excel import had apostrophes around revenue values, causing text values, counts, or zero sums. The final file stores numbers and applies currency formatting separately. The original online `Book.xlsx` was also repaired; its source sheets were retained.

To refresh: run Question 2 in MySQL Workbench, export numeric results to CSV without currency symbols or `FORMAT()`, update `Monthly data` (including the period key), and refresh the PivotTable. If adding rows, expand the PivotTable source range first. The current source is `'Monthly data'!A1:D34`.

## Scope requiring confirmation

**Question 3:** `management` lists Colorado and `Online Sales` under West, with two manager rows for `Online Sales`. It does not map Ohio directly to a region or identify each online manager's states. The retained student query compares Ohio online revenue with Colorado store revenue plus all online revenue (**$74,417,459.27** in the supplied data). This is a mixed-channel West benchmark, conditional on Ohio belonging to that Online Sales unit. Confirm this interpretation with the instructor. No geographic region mapping was invented, and sales were not joined directly to the duplicate management rows.

**Question 5:** the retained query ranks all 29 online states by revenue. This is a benchmark across all online sales; the database does not identify a manager-specific multi-state territory. Confirm the intended scope before presenting it as a within-territory ranking.

The student's Technology & Accessories recommendation is retained with the claim of guaranteed future revenue removed. Full-period source checks support it as an option to investigate: $714,885.07 across 361 recorded sales. Margins, future demand, and next-quarter results are not established by these data.

## Validation and authorship

All 33 monthly Workbench results matched independent aggregation of the supplied database script. Source checks found no duplicate product/category keys or unmatched Ohio product joins. Other query outputs were checked against the supplied script in a separate read-only analysis; they were not all re-executed through the authenticated MySQL connection. The Excel file was opened, refreshed, and saved in desktop Excel, and its native PivotTable, SUM aggregation, PivotChart, and total were checked.

AI assistance was used for debugging, workbook repair, validation, and these documentation notes. The student's original SQL and exploratory queries were preserved. Review every query and explain the joins, grouping, scope, and recommendation in your own words; follow the course's academic integrity rules.

## Still to complete

- Confirm the Question 3 and Question 5 territory interpretations with the instructor.
- Review and explain the analysis independently before submission.
- Record the required 10-minute demonstration and add its actual link here. **Recording link: not yet provided.**
- Prepare and deliver the 5-minute live presentation.

No past commits were fabricated or backdated to satisfy the daily-progress requirement.
