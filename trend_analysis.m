function [slope, intercept] = trend_analysis(dates, prices)
    % Convert dates to numeric format using `days` from the start date
    numeric_dates = days(dates - dates(1)); % Days from the first date

    % Linear Regression
    X = [ones(length(numeric_dates), 1), numeric_dates];
    theta = (X' * X) \ (X' * prices); % Normal equation
    intercept = theta(1);
    slope = theta(2);
end
