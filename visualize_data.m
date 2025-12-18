function visualize_data(dates, prices)
    % Line Chart of Historical Prices
    figure;
    plot(dates, prices, 'b-', 'LineWidth', 1.5);
    xlabel('Date');
    ylabel('Closing Price (USD)');
    title('Historical Stock Prices');
    grid on;

    % Histogram of Price Distribution
    figure;
    histogram(prices, 20, 'FaceColor', [0.2, 0.6, 0.8]);
    xlabel('Price (USD)');
    ylabel('Frequency');
    title('Price Distribution');
    grid on;

    % Moving Averages
    short_ma = movmean(prices, 10);
    long_ma = movmean(prices, 50);
    figure;
    plot(dates, prices, 'b-', 'LineWidth', 1.5); hold on;
    plot(dates, short_ma, 'r--', 'LineWidth', 1.5);
    plot(dates, long_ma, 'g-', 'LineWidth', 1.5);
    xlabel('Date');
    ylabel('Price (USD)');
    title('Moving Averages (Short-Term vs Long-Term)');
    legend('Actual Prices', '10-Day MA', '50-Day MA');
    grid on;

    % Seasonal Trends (Month vs Average Price)
    months = month(dates);
    avg_price_per_month = splitapply(@mean, prices, findgroups(months));
    figure;
    bar(1:12, avg_price_per_month);
    xlabel('Month');
    ylabel('Average Price (USD)');
    title('Seasonal Trends in Stock Prices');
    grid on;
end
