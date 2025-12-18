function plot_predictions(dates, prices, future_dates, future_prices)
    figure;
    plot(dates, prices, 'b-', 'LineWidth', 1.5); hold on;
    plot(future_dates, future_prices, 'r--', 'LineWidth', 1.5);
    xlabel('Date');
    ylabel('Price (USD)');
    title('Stock Price Prediction (2-3 Months Ahead)');
    legend('Historical Prices', 'Predicted Prices');
    grid on;
end
