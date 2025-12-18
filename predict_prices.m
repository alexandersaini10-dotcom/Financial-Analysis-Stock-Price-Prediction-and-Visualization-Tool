function [future_dates, future_prices, recommendation] = predict_prices(dates, prices, slope, intercept)
    % Predict 2-3 months into the future
    last_date = dates(end);
    future_dates = last_date + days(1:90); % Future dates as datetime

    % Convert dates to numeric format relative to the first date
    numeric_dates = days(future_dates - dates(1)); % Numeric format for future dates

    % Price Prediction using Linear Extrapolation
    future_prices = intercept + slope * numeric_dates;

    % Recommendation Logic
    if future_prices(1) > prices(end)
        recommendation = 'BUY - Prices expected to rise.';
    elseif future_prices(1) < prices(end)
        recommendation = 'SELL - Prices expected to drop.';
    else
        recommendation = 'HOLD - No significant change expected.';
    end
end
