import yfinance as yf
import pandas as pd

def fetch_stock_data(ticker, start_date, end_date, filename):
    # Fetch stock data
    data = yf.download(ticker, start=start_date, end=end_date)
    data.reset_index(inplace=True)
    data.to_csv(filename, index=False)
    print(f"Data saved to {filename}")
