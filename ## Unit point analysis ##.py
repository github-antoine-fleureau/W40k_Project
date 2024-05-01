import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import psycopg2
import GPy
import numpy as np

## Retrieve and preprocesse data into a DataFrame named 'Units_data'

# Connect to the database
conn = psycopg2.connect(
    dbname="postgres",
    user="postgres",
    password="Olicah@y87",
    host="localhost",
    port="5432"
)

# Create a cursor
cur = conn.cursor()

try:
    # Execute the SQL query to retrieve data from the units, units_psy, units_type, units_rules, units_aptitudes_link tables
    cur.execute("""
        WITH number_rule AS (
                SELECT Unit_id, COUNT(*) AS rule_count
                FROM units_rules
                GROUP BY Unit_id
        ),

        number_aptitudes AS (
                SELECT Unit_id, COUNT(*) AS aptitude_count
                FROM units_aptitudes_link
                GROUP BY Unit_id
        ),
        
        number_psy AS (
                SELECT Unit_id, COUNT(*) AS psy_count
                FROM units_psy
                GROUP BY Unit_id
        )

        SELECT u.Unit_id, u.Unit_name, u.Unit_type, u."M | CS | H", u.BS, u.WS, u.S, u."F | S | R", u.W, u.A, u.I, u.Ld, u.OC, u.Sv, u.Invul_sv, u.U_Pts,
                u.group_faction_id, u.faction_id, rule_count, aptitude_count, psy_count
        FROM units u
        LEFT JOIN number_rule ur ON u.Unit_id = ur.Unit_id
        LEFT JOIN number_aptitudes ua ON u.Unit_id = ua.Unit_id
        LEFT JOIN number_psy up ON u.Unit_id = up.Unit_id
    """)
    
    # Fetch all rows
    rows = cur.fetchall()
    
    # Convert the fetched data into a DataFrame
    Units_data = pd.DataFrame(rows, columns=['Unit_id', 'Unit_name', 'Unit_type', '"M | CS | H"', 'BS', 'WS', 'S', '"F | S | R"', 'W', 'A', 'I', 'Ld', 'OC', 'Sv', 'Invul_sv', 'U_Pts',
                'group_faction_id', 'faction_id', 'rule_count', 'aptitude_count', 'psy_count'])

# Preprocessing: handle missing values, encode categorical variables, etc.

    def logic_1_25_10_100(value):
        # Define the points (1, 0.01) and (20, 1)
        x1, y1 = 1, 0.1
        x2, y2 = 25, 1
        
        # Calculate the slope (m) and intercept (c) of the linear equation y = mx + c
        m = (y2 - y1) / (x2 - x1)
        c = y1 - m * x1
        
        # Calculate the converted value using the linear equation
        converted_value = m * float(value) + c
        
        return converted_value

    def convert_movement(value):
        if isinstance(value, list):
            # Handle lists by joining their elements into a single string
            value = ','.join(value)
        
        # Define the mapping of values to their corresponding numeric values
        mapping = {
            '20-30" | 30-45" | 18",13-20" | 19-30" | 12",7-10" | 10-15" | 6"': 0.45,
            '14" | 21",9" | 13",5" | 7"': 0.21,
            '12" | 18",8" | 12",4" | 6"': 0.12,
            '10" | 15",7" | 10",3" | 4"': 0.15,
            '9" | 13",6" | 9",3" | 4"': 0.13,
            '8" | 12",5" | 7",3" | 4"': 0.12,
            '7" | 10",5" | 7",2" | 3"': 0.1,
            '6" | 9",4" | 6",2" | 3"': 0.06,
            '5" | 8",3" | 5",2" | 3"': 0.08,
            '6", 5", 12"': 0.12,
            '6", 5", 4"': 0.06,
            '16"': 0.16,
            '14"': 0.14,
            '12"': 0.12,
            '11"': 0.11,
            '10"': 0.1,
            '9"': 0.09,
            '8"': 0.08,
            '7"': 0.07,
            '6"': 0.06,
            '5"': 0.05,
            '4"': 0.04,
            '0"': 0.01
        }
        
        # Return the converted value based on the movement mapping
        return mapping.get(value, value)  # Return original value if not found in mapping

    def convert_bws(value):
        if isinstance(value, list):
            # Handle lists by joining their elements into a single string
            value = ','.join(value)
        
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            '': 0.01, # Assigning a default value of 0.01 for empty strings
            '5+' : 0.2,
            '3+,4+': 0.6,
            '2+,3+,4+': 0.8,
            '3+': 0.7,
            '3+,4+,5+': 0.5,
            '4+': 0.5,
            '4+,5+,6+': 0.3,
            '2+': 1
        }


        # Return the converted value based on the s_mapping
        return mapping.get(value, value)  # Return original value if not found in mapping

    def convert_e(value):
        if isinstance(value, list):
            # Handle lists by joining their elements into a single string
            value = ','.join(value)
        
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            '12,11,10': lambda: logic_1_25_10_100("12"),
            '12 | 12 | 10,11 | 11 | 9,10 | 10 | 8': lambda: logic_1_25_10_100("11"),
            '8': lambda: logic_1_25_10_100("8"),
            '13 | 13 | 13,12 | 12 | 12,11 | 11 | 11': lambda: logic_1_25_10_100("13"),
            '14 | 14 | 13,13 | 13 | 12,12 | 12 | 11': lambda: logic_1_25_10_100("14"),
            '13 | 13 | 12,12 | 12 | 11,11 | 11 | 10': lambda: logic_1_25_10_100("13"),
            '11 | 11 | 11,10 | 10 | 10,9 | 9 | 9': lambda: logic_1_25_10_100("11"),
            '15 | 15 | 15,14 | 14 | 14,13 | 13 | 13': lambda: logic_1_25_10_100("15"),
            '10 | 10 | 10,9 | 9 | 9,8 | 8 | 8': lambda: logic_1_25_10_100("10"),
            '11': lambda: logic_1_25_10_100("11"),
            '15 | 14 | 13,14 | 13 | 12,13 | 12 | 11': lambda: logic_1_25_10_100("14"),
            '10,9,8': lambda: logic_1_25_10_100("10"),
            '17 | 17 | 17,16 | 16 | 16,15 | 15 | 15': lambda: logic_1_25_10_100("17"),
            '13 | 13 | 11,12 | 12 | 10,11 | 11 | 9': lambda: logic_1_25_10_100("12"),
            '3,2,1': lambda: logic_1_25_10_100("3"),
            '3': lambda: logic_1_25_10_100("3"),
            '9': lambda: logic_1_25_10_100("9"),
            '15 | 13 | 13,14 | 12 | 12,13 | 11 | 11': lambda: logic_1_25_10_100("14"),
            '13 | 12 | 12,12 | 11 | 11,11 | 10 | 10': lambda: logic_1_25_10_100("13"),
            '4': lambda: logic_1_25_10_100("4"),
            '7': lambda: logic_1_25_10_100("7"),
            '14 | 14 | 12,13 | 13 | 11,12 | 12 | 10': lambda: logic_1_25_10_100("13"),
            '12 | 12 | 12,11 | 11 | 11,10 | 10 | 10': lambda: logic_1_25_10_100("12"),
            '12 | 12 | 11,11 | 11 | 10,10 | 10 | 9': lambda: logic_1_25_10_100("12"),
            '10': lambda: logic_1_25_10_100("10"),
            '5': lambda: logic_1_25_10_100("5"),
            '15 | 15 | 13,14 | 14 | 12,13 | 13 | 11': lambda: logic_1_25_10_100("14"),
            '12': lambda: logic_1_25_10_100("12"),
            '11 | 11 | 10,10 | 10 | 8,9 | 9 | 7': lambda: logic_1_25_10_100("11"),
            '16 | 15 | 15,15 | 14 | 14,14 | 13 | 13': lambda: logic_1_25_10_100("15"),
            '6': lambda: logic_1_25_10_100("6"),
            '16 | 15 | 14,15 | 14 | 13,14 | 13 | 12': lambda: logic_1_25_10_100("15"),
            '17 | 16 | 14,16 | 15 | 13,15 | 14 | 12': lambda: logic_1_25_10_100("16"),
            '11 | 11 | 9,10 | 10 | 8,9 | 9 | 7': lambda: logic_1_25_10_100("10"),
            '11,10,9': lambda: logic_1_25_10_100("11"),
            '9 | 9 | 9,8 | 8 | 8,7 | 7 | 7': lambda: logic_1_25_10_100("9"),
            '4,5': lambda: logic_1_25_10_100("5"),
            '16 | 15 | 13,15 | 14 | 12,14 | 13 | 11': lambda: logic_1_25_10_100("14"),
        }
        
        # Return the converted value based on the range mapping
        return mapping.get(value, lambda: value)()  # Return original value if not found in mapping

    def convert_w(value):
        if isinstance(value, list):
            # Handle lists by joining their elements into a single string
            value = ','.join(value)
        
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            '1': lambda: logic_1_25_10_100("1"),
            '2': lambda: logic_1_25_10_100("2"),
            '3': lambda: logic_1_25_10_100("3"),
            '4': lambda: logic_1_25_10_100("4"),
            '5': lambda: logic_1_25_10_100("5"),
            '6': lambda: logic_1_25_10_100("6"),
            '7': lambda: logic_1_25_10_100("7"),
            '9': lambda: logic_1_25_10_100("9"),
            '10': lambda: logic_1_25_10_100("10"),
            '12': lambda: logic_1_25_10_100("12"),
            '14': lambda: logic_1_25_10_100("14"),
            '16': lambda: logic_1_25_10_100("16"),
            '17': lambda: logic_1_25_10_100("17"),
            '20': lambda: logic_1_25_10_100("20"),
            '1,2': lambda: logic_1_25_10_100("2"),
            '2,3': lambda: logic_1_25_10_100("3"),
            '3,4': lambda: logic_1_25_10_100("4"),
            '3,5': lambda: logic_1_25_10_100("4"),
            '5,2': lambda: logic_1_25_10_100("3"),
            '1,1,1': lambda: logic_1_25_10_100("1"),
            '6,3-4,1-2': lambda: logic_1_25_10_100("6"),
            '8,4-5,1-3': lambda: logic_1_25_10_100("8"),
            '9,4-6,1-3': lambda: logic_1_25_10_100("9"),
            '10,4-7,1-3': lambda: logic_1_25_10_100("10"),
            '11,5-7,1-4': lambda: logic_1_25_10_100("11"),
            '12,5-8,1-4': lambda: logic_1_25_10_100("12"),
            '13,5-9,1-4': lambda: logic_1_25_10_100("13"),
            '14,6-9,1-5': lambda: logic_1_25_10_100("14"),
            '15,6-10,1-5': lambda: logic_1_25_10_100("15"),
            '18,7-12,1-6': lambda: logic_1_25_10_100("18"),
            '20,8-13,1-7': lambda: logic_1_25_10_100("20"),
            '22,8-15,1-7': lambda: logic_1_25_10_100("22"),
        }


        # Return the converted value based on the s_mapping
        return mapping.get(value, lambda: value)()  # Return original value if not found in mapping

    def convert_ld(value):
        if isinstance(value, list):
            # Handle lists by joining their elements into a single string
            value = ','.join(value)
        
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            '7+,8+,9+': 0.4,
            '8+,7+': 0.4,
            '6+,7+': 0.6,
            '8+': 0.3,
            '5+': 0.8,
            '8+,9+,10+': 0.3,
            '4+': 1,
            '7+': 0.4,
            '5+,6+,7+': 0.8,
            '6+,7+,8+': 0.6,
            '6+': 0.6,
        }


        # Return the converted value based on the s_mapping
        return mapping.get(value, value)  # Return original value if not found in mapping

    def convert_sv(value):
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            '3+ | 4+': 0.6,
            '2+': 1,
            '3+ | 2+': 0.9,
            '4+': 0.5,
            '6+': 0.1,
            '5+': 0.3,
            '6+, 7+, 8+': 0.05,
            '3+': 0.7,
        }


        # Return the converted value based on the s_mapping
        return mapping.get(value, value)  # Return original value if not found in mapping

    def convert_invul_sv(value):
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            ' | 4++/4++': 0.5,
            '': 0.01, # Assigning a default value of 0.01 for empty strings
            '5++/4++, 6++/5++, /6++': 0.3,
            '3++/4++': 0.8,
            '4++/3++': 0.8,
            '5++/4++': 0.6,
            '4++/5++': 0.6,
            '5++/5++': 0.4,
            '6++/6++': 0.1,
            '3++/3++': 1,
            '4++/4++': 0.7,
        }


        # Return the converted value based on the s_mapping
        return mapping.get(value, value)  # Return original value if not found in mapping

    # Apply the convert_movement function to the '"M | CS | H"' column
    Units_data['"M | CS | H"'] = Units_data['"M | CS | H"'].apply(convert_movement)

    # Apply the convert_bs function to the 'BS' column
    Units_data['BS'] = Units_data['BS'].apply(convert_bws)

    # Apply the convert_ws function to the 'WS' column
    Units_data['WS'] = Units_data['WS'].apply(convert_bws)

    # Apply the convert_e function to the '"F | S | R"' column
    Units_data['"F | S | R"'] = Units_data['"F | S | R"'].apply(convert_e)

    # Apply the convert_w function to the 'W' column
    Units_data['W'] = Units_data['W'].apply(convert_w)

    # Apply the convert_ld function to the 'Ld' column
    Units_data['Ld'] = Units_data['Ld'].apply(convert_ld)

    # Apply the convert_sv function to the 'Sv' column
    Units_data['Sv'] = Units_data['Sv'].apply(convert_sv)

    # Apply the convert_invul_sv function to the 'invul_sv' column
    Units_data['Invul_sv'] = Units_data['Invul_sv'].apply(convert_invul_sv)

    # Fetch all rows
    rows = cur.fetchall()

    # # Save the DataFrame to an Excel file
    # Units_data[['"M | CS | H"', 'BS', 'WS', '"F | S | R"', 'W', 'Ld', 'Sv', 'Invul_sv']].to_excel('C:/Users/antoi/OneDrive/Documents/Individuels/Antoine/Professionnel/Projet_W40k/unit_predictions.xlsx', index=False)


    # # Split the dataset into features (X) and target variable (y)
    # X = Units_data[['rule_count', 'aptitude_count', 'psy_count', '"M | CS | H"', 'BS', 'WS', 'S', '"F | S | R"', 'W', 'A', 'I', 'Ld', 'OC', 'Sv', 'Invul_sv']].values
    # y = Units_data['U_Pts'].values.reshape(-1, 1)

    # # Split the data into training and testing sets
    # X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # # Create and train the Gaussian Process model
    # kernel = GPy.kern.RBF(input_dim=X_train.shape[1])  # Radial Basis Function (RBF) kernel
    # model = GPy.models.GPRegression(X_train, y_train, kernel)
    # model.optimize(messages=True)  # Optimize hyperparameters

    # # Evaluate the model's performance on the testing set
    # y_pred, _ = model.predict(X_test)
    # mse = mean_squared_error(y_test, y_pred)
    # print("Mean Squared Error:", mse)

    # # Use the trained model to predict 'U_Pts' for the entire dataset
    # Units_data['Predicted_U_Pts'], _ = model.predict(X)
    # Units_data['Predicted_U_Pts'] = Units_data['Predicted_U_Pts'].round().astype(int)

    # # Assess coherence of predicted 'U_Pts' values compared to actual values
    # Units_data['Difference'] = Units_data['Predicted_U_Pts'] - Units_data['U_Pts']

    # # Save the Calulated columns to an Excel file
    # Units_data[['U_Pts', 'Predicted_U_Pts', 'Difference']].to_excel('C:/Users/antoi/OneDrive/Documents/Individuels/Antoine/Professionnel/Projet_W40k/unit_predictions.xlsx', index=False)

    # # Update the original Units table with the corrected 'U_Pts' values
    # for index, row in Units_data.iterrows():
    #     try:
    #         cur.execute("UPDATE Units SET U_Pts = %s WHERE Unit_id = %s", (row['Predicted_U_Pts'], row['Unit_id']))
    #     except Exception as e:
    #         print(f"Error updating Unit_id {row['Unit_id']}: {str(e)}")
    
    # # Commit the changes
    # conn.commit()

finally:
    # Close the cursor and connection
    cur.close()
    conn.close()
