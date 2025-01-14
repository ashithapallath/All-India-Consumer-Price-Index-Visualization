

# All India Consumer Price Index Visualization

This project provides interactive visualizations of the All India Consumer Price Index (CPI) to help analyze trends and fluctuations in prices across various categories in India. The visualizations aim to offer insights into how inflation has evolved over time for different goods and services.

## Project Overview

The project involves analyzing the Consumer Price Index (CPI) data and creating informative plots to visualize trends in the inflation rate. The CPI data is segmented by different categories, such as food, fuel, and housing, and is used to analyze inflation patterns and their impact on the economy. The project is implemented using R programming language.

## Features

- **CPI Trends**: Visualization of CPI trends across different categories such as food, fuel, and housing.
- **Inflation Analysis**: Explore inflation patterns and analyze their impact over time.
- **Interactive Visualizations**: Utilize R libraries like ggplot2, plotly, and others for dynamic plotting of CPI data.

## Requirements

To run this project locally, you need the following R packages:

- tidyverse
- ggplot2
- plotly
- dplyr
- readr

You can install these packages using the following commands:

```r
install.packages(c("tidyverse", "ggplot2", "plotly", "dplyr", "readr"))
```

## Files

- **`CPI_Data.csv`**: The dataset containing the CPI data for India across different categories.
- **`cpi_visualization.R`**: R script to generate visualizations from the CPI dataset.
- **`README.md`**: This file, containing details about the project.

## Usage

1. Clone this repository:

```bash
git clone https://github.com/ashithapallath/All-India-Consumer-Price-Index-Visualization.git
```

2. Navigate into the project directory:

```bash
cd All-India-Consumer-Price-Index-Visualization
```

3. Run the R script to generate the visualizations:

```r
source("cpi_visualization.R")
```

4. Optionally, open the R script in RStudio for a more interactive experience.

## Contributing

Feel free to fork this repository and submit pull requests for any improvements or new features.

## License

This project is open-source and available under the MIT License.

