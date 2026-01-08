# Pizza Delivery Operations Analysis (SQL)

## Business Objective
Analyze delivery delays to identify operational factors affecting delivery performance
across restaurants and locations.

## Dataset Description
- Source: Simulated pizza delivery order dataset
- Records: ~1000 orders
- Key attributes include order time, delivery time, estimated duration,
  traffic level, distance, order complexity, and payment method.

## Key Metrics
- Delivery Duration (minutes)
- Estimated Delivery Duration (minutes)
- Delay (minutes)
- Is_Delayed flag

## Data Quality Issues & Assumptions
- Inconsistent datetime formats observed across order and delivery timestamps
- Logical inconsistency between Delay values and Is_Delayed flag
- Assumption: Datetime values will be standardized before analysis
- Assumption: Delay is defined as Delivery Duration minus Estimated Duration

## Analytical Questions
- Which factors contribute most to delivery delays?
- How does traffic level impact delivery duration compared to distance?
- Are delays concentrated during peak hours or weekends?
- Do certain restaurants or locations consistently underperform?
- Does order complexity (pizza size, toppings) affect delivery time?
- Is payment method associated with higher delivery delays?

## Project Status
In progress – data validation and exploratory analysis phase

