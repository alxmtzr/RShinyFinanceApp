# Finance Tracking Shiny App
> Work in progress.

## Overview

This Shiny app allows users to track and visualize financial transactions. Users can input a specific month and year to view both outgoing and incoming transactions for that period.

## Features

- **Date Selection**: Use the date picker to select a specific month and year.
- **Tabs for Outgoing and Incoming Transactions**: Separate tabs display outgoing and incoming transactions for the selected month.
- **Tables with Details**: View detailed information about transactions, including payer, recipient, reason for transfer, and amount.
- **Graphical Representation (Optional)**: [Optional] View graphical representations of financial data using additional tabs.

## Usage

1. **Prepare Your Data**: Ensure your financial data is exported from Deutsche Kreditbank AG (DKB) in CSV format.

2. **Data Cleaning**: Before running the Shiny app, you can use the provided R script to clean your CSV file. The script, named `clean_data.R`, is located in the project directory. You have to adjust the path to your csv file in `line 5`:
```r
df = read_csv2("/PATH/TO/CSV-FILE")
```
Execute the script to clean and transform your data. The cleaned data will be saved automatically as `data_cleaned.csv` in the `csv` folder.

3. The CSV file should include columns for `booking_date`, `payer`, `recipient`, `reason_for_transfer`, `in_out`, and `amount_euro`.
4. **Run the Shiny App**: Open RStudio and set the working directory to the root of the cloned repository. Run the Shiny app using the following command in the R console:

    ```r
    shiny::runApp()
    ```

5. **Explore Your Finances**: The app will launch in your default web browser. Use the date picker to select a specific month and year. Navigate between tabs to view outgoing and incoming transactions.

## Note for DKB Users

This application is designed to work seamlessly with CSV files exported from Deutsche Kreditbank AG (DKB). If you encounter any issues or have feedback related to DKB exports, please let us know to improve compatibility.


## Dependencies

- R (>= 3.6.0)
- Shiny (>= 1.6.0)
- ShinyWidgets (>= 0.6.0)
- tidyverse (>= 1.3.0)
- lubridate (>= 1.7.10)

## Data
Make sure your financial data is in CSV format and includes columns for `booking_date`, `payer`, `recipient`, `reason_for_transfer`, `in_out`, and `amount_euro`.

- **`booking_date`**: The date on which the financial transaction was recorded or occurred.

- **`payer`**: The individual or entity making the payment or initiating the financial transaction.

- **`recipient`**: The individual or entity receiving the payment or the target of the financial transaction.

- **`reason_for_transfer`**: A brief description or note indicating the purpose or reason for the financial transfer.

- **`in_out`**: Indicates whether the transaction is an incoming (e.g., income) or outgoing (e.g., expense) transaction.

- **`amount_euro`**: The monetary amount associated with the financial transaction, denominated in euros (€).


## Note for DKB Users
This application is designed to work seamlessly with CSV files exported from Deutsche Kreditbank AG (DKB). If you are a DKB customer, you can easily import your financial transactions in CSV format to gain insights and track your expenses using this app.
