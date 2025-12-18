clc; clear; close all;

% Add path to include submodules
addpath('modules');

% Data Import and Preprocessing
filename = 'stock_data.csv'; % Replace with your CSV file
[start_date, end_date] = deal('2020-01-01', '2024-01-01'); % Data range
[dates, prices] = import_and_preprocess(filename, start_date, end_date);

% Visualization Module
visualize_data(dates, prices);

% Trend Analysis Module
[slope, intercept] = trend_analysis(dates, prices);

% Prediction Module
[future_dates, future_prices, recommendation] = predict_prices(dates, prices, slope, intercept);

% Display Prediction Results
fprintf('Future Prices (Next 2-3 Months):\n');
disp(table(future_dates, future_prices, 'VariableNames', {'Date', 'PredictedPrice'}));
fprintf('Recommendation: %s\n', recommendation);

% Plot Prediction Results
plot_predictions(dates, prices, future_dates, future_prices);
