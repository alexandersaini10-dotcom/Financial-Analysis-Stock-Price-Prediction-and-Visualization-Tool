unction [dates, prices] = import_and_preprocess(filename, start_date, end_date)
    % Load data from CSV
    data = readtable(filename);
    
    % Convert dates to datetime format
    data.Date = datetime(data.Date, 'InputFormat', 'yyyy-MM-dd');
    
    % Filter data by date range
    start_date = datetime(start_date, 'InputFormat', 'yyyy-MM-dd');
    end_date = datetime(end_date, 'InputFormat', 'yyyy-MM-dd');
    data = data(data.Date >= start_date & data.Date <= end_date, :);
    
    % Extract required columns
    dates = data.Date;
    prices = data.Close;
    
    % Address missing values (if any)
    if any(ismissing(prices))
        fprintf('Missing data detected. Interpolating...\n');
        prices = fillmissing(prices, 'linear');
    end
 

