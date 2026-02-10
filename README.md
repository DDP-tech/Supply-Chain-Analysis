# Supply Chain Analysis SQL Case Study

## Overview

This case study presents an end-to-end SQL analysis of superstore sales data with the objective of uncovering actionable insights related to sales performance, customer distribution, product demand, and profitability. The analysis is designed to simulate a real-world retail supply chain scenario and demonstrate practical SQL skills applied to business problems.

---

## Project Structure

```
├── Supply_Chain_Analysis/
│   ├── Dataset/                  # CSV data files
│   ├── Problem Statement.pdf     # Problem statement
│   ├── Project_Report.pdf        # Final project report
│   ├── Supply_Chain_Analysis.sql # SQL analysis file
│
├── README.md                     # README
```

---

## Business Problem

A superstore operates across multiple regions, selling a wide range of products to different customer segments. Management requires a data-driven understanding of:

* Overall sales performance
* Customer distribution across regions
* High-demand and high-profit products
* Loss-making categories and sub-categories

The goal of this analysis is to answer these questions using SQL and provide insights that can support strategic retail and supply chain decisions.

---

## Dataset Description

The dataset follows a star-schema–like structure and consists of the following tables:

* **cust_dimen** – Customer details including region and segment
* **orders_dimen** – Order-level information such as order date and priority
* **prod_dimen** – Product categories and sub-categories
* **shipping_dimen** – Shipment details including shipping mode and date
* **market_fact** – Central fact table containing sales, profit, quantity, and shipping cost metrics

All data files were imported into MySQL using the Table Data Import Wizard.

---

## Analysis Performed

The SQL analysis covers both basic and advanced business questions, including:

* Total and average sales analysis
* Customer count by region and identification of the top region
* Product demand analysis based on quantity sold
* Profitability analysis by product category and sub-category
* Identification of the least profitable sub-category and its regional shipment distribution

Each query is written with a focus on clarity, correctness, and alignment with business requirements.

---

## Key Insights

* The West region has the highest number of customers.
* Office Supplies products show the highest demand by quantity sold.
* Technology is the most profitable product category.
* Tables is identified as the least profitable product sub-category, generating overall losses.

Detailed numerical results are available in the Project Report File.

---

## Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Techniques Used:** Joins, aggregations, grouping, filtering, and profitability analysis

---

**Created By :-** Divyadarshan Pattanayak\
**Date :-** November 2025

