import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from sklearn.ensemble import RandomForestRegressor
import psycopg2
import numpy as np

## Define preprocessing functions with comments and error handling
def logic_1_25_10_100(value):
    """
    Function to convert values based on a linear logic.
    """
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
    """
    Function to convert movement values.
    """
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
    """
    Function to convert BS & WS values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '': 0.01, # Assigning a default value of 0.01 for empty strings
        '2+': 1,
        '3+': 0.7,
        '4+': 0.5,
        '5+' : 0.2,
        '3+,4+': 0.6,
        '2+,3+,4+': 0.8,
        '3+,4+,5+': 0.5,
        '4+,5+,6+': 0.3
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, value)  # Return original value if not found in mapping
def convert_a(value):
    """
    Function to convert a values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(map(str, value))

    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '0': 0.01,
        '1': 0.1,
        '2': 0.2,
        '3': 0.3,
        '4': 0.4,
        '5': 0.5,
        '6': 0.6,
        '7': 0.7,
        '8': 0.8,
        '3,4': 0.3,
        '5,4': 0.5,
        '3,2,1': 0.3,
        '4,3,2': 0.4,
        '5,4,3': 0.5,
        '6,5,4': 0.6,
        '7,6,5': 0.7,
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, value)  # Return original value if not found in mapping
def convert_e(value):
    """
    Function to convert e values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '3': lambda: logic_1_25_10_100("3"),
        '4': lambda: logic_1_25_10_100("4"),
        '5': lambda: logic_1_25_10_100("5"),
        '6': lambda: logic_1_25_10_100("6"),
        '7': lambda: logic_1_25_10_100("7"),
        '8': lambda: logic_1_25_10_100("8"),
        '9': lambda: logic_1_25_10_100("9"),
        '10': lambda: logic_1_25_10_100("10"),
        '11': lambda: logic_1_25_10_100("11"),
        '12': lambda: logic_1_25_10_100("12"),
        '4,5': lambda: logic_1_25_10_100("5"),
        '3,2,1': lambda: logic_1_25_10_100("3"),
        '10,9,8': lambda: logic_1_25_10_100("10"),
        '11,10,9': lambda: logic_1_25_10_100("11"),
        '12,11,10': lambda: logic_1_25_10_100("12"),
        '9 | 9 | 9,8 | 8 | 8,7 | 7 | 7': lambda: logic_1_25_10_100("9"),
        '10 | 10 | 10,9 | 9 | 9,8 | 8 | 8': lambda: logic_1_25_10_100("10"),
        '11 | 11 | 9,10 | 10 | 8,9 | 9 | 7': lambda: logic_1_25_10_100("10"),
        '11 | 11 | 10,10 | 10 | 8,9 | 9 | 7': lambda: logic_1_25_10_100("11"),
        '11 | 11 | 11,10 | 10 | 10,9 | 9 | 9': lambda: logic_1_25_10_100("11"),
        '12 | 12 | 10,11 | 11 | 9,10 | 10 | 8': lambda: logic_1_25_10_100("11"),
        '12 | 12 | 11,11 | 11 | 10,10 | 10 | 9': lambda: logic_1_25_10_100("12"),
        '12 | 12 | 12,11 | 11 | 11,10 | 10 | 10': lambda: logic_1_25_10_100("12"),
        '13 | 12 | 12,12 | 11 | 11,11 | 10 | 10': lambda: logic_1_25_10_100("13"),
        '13 | 13 | 11,12 | 12 | 10,11 | 11 | 9': lambda: logic_1_25_10_100("12"),
        '13 | 13 | 12,12 | 12 | 11,11 | 11 | 10': lambda: logic_1_25_10_100("13"),
        '13 | 13 | 13,12 | 12 | 12,11 | 11 | 11': lambda: logic_1_25_10_100("13"),
        '14 | 14 | 12,13 | 13 | 11,12 | 12 | 10': lambda: logic_1_25_10_100("13"),
        '14 | 14 | 13,13 | 13 | 12,12 | 12 | 11': lambda: logic_1_25_10_100("14"),
        '15 | 13 | 13,14 | 12 | 12,13 | 11 | 11': lambda: logic_1_25_10_100("14"),
        '15 | 14 | 13,14 | 13 | 12,13 | 12 | 11': lambda: logic_1_25_10_100("14"),
        '15 | 15 | 13,14 | 14 | 12,13 | 13 | 11': lambda: logic_1_25_10_100("14"),
        '15 | 15 | 15,14 | 14 | 14,13 | 13 | 13': lambda: logic_1_25_10_100("15"),
        '16 | 15 | 13,15 | 14 | 12,14 | 13 | 11': lambda: logic_1_25_10_100("14"),
        '16 | 15 | 14,15 | 14 | 13,14 | 13 | 12': lambda: logic_1_25_10_100("15"),
        '16 | 15 | 15,15 | 14 | 14,14 | 13 | 13': lambda: logic_1_25_10_100("15"),
        '17 | 16 | 14,16 | 15 | 13,15 | 14 | 12': lambda: logic_1_25_10_100("16"),
        '17 | 17 | 17,16 | 16 | 16,15 | 15 | 15': lambda: logic_1_25_10_100("17"),
    }
    
    # Return the converted value based on the range mapping
    return mapping.get(value, lambda: value)()  # Return original value if not found in mapping
def convert_w(value):
    """
    Function to convert w values.
    """
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
        '22,8-15,1-7': lambda: logic_1_25_10_100("22")
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, lambda: value)()  # Return original value if not found in mapping
def convert_ld(value):
    """
    Function to convert ld values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '4+': 1,
        '5+': 0.8,
        '6+': 0.6,
        '7+': 0.4,
        '8+': 0.3,
        '6+,7+': 0.6,
        '8+,7+': 0.4,
        '5+,6+,7+': 0.8,
        '6+,7+,8+': 0.6,
        '7+,8+,9+': 0.4,
        '8+,9+,10+': 0.3
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, value)  # Return original value if not found in mapping
def convert_oc(value):
    """
    Function to convert oc values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(map(str, value))

    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '0': 0.01,
        '1': 0.1,
        '2': 0.2,
        '3': 0.3,
        '4': 0.4,
        '5': 0.5,
        '6': 0.6,
        '1,0': 0.1,
        '2,1': 0.2,
        '2,1,0': 0.2,
        '3,2,1': 0.3,
        '4,3,2': 0.4,
        '5,4,3': 0.5,
        '6,5,4': 0.6,
        '8,7,6': 0.8,
        '10,9,8': 1
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, value)  # Return original value if not found in mapping
def convert_sv(value):
    """
    Function to convert sv values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '2+': 1,
        '3+': 0.7,
        '4+': 0.5,
        '5+': 0.3,
        '6+': 0.1,
        '3+ , 2+': 0.9,
        '3+ , 4+': 0.6,
        '6+, 7+, 8+': 0.05
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, value)  # Return original value if not found in mapping
def convert_invul_sv(value):
    """
    Function to convert invul_sv values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '': 0.01, # Assigning a default value of 0.01 for empty strings
        '3++/3++': 1,
        '4++/4++': 0.7,
        '5++/5++': 0.4,
        '6++/6++': 0.1,
        '3++/4++': 0.8,
        '4++/3++': 0.8,
        '4++/5++': 0.6,
        '5++/4++': 0.6,
        '5++/4++, 6++/5++, /6++': 0.3,
        ' , 4++/4++': 0.5
    }


    # Return the converted value based on the s_mapping
    return mapping.get(value, value)  # Return original value if not found in mapping
## Define function to retrieve and preprocess data from the database
def retrieve_and_preprocess_data():
    """
    Retrieve and preprocess data from the database.
    """
    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="postgres",
            password="Olicah@y87",
            host="localhost",
            port="5432"
        )
        cur = conn.cursor()

        # Retrieve data from the database
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

        SELECT 
            u.Unit_id, u.Unit_name, u.Unit_type, u.Nb_fig, u."Movement | Cruising Speed | Hover", u.BS, u.WS, u.S, u."Front | Side | Rear", u.W, u.A, u.I, u.Ld, u.OC, u.Sv, u.Invul_sv, u.U_Pts,
            COALESCE(rule_count, 0) AS rule_count, COALESCE(aptitude_count, 0) AS aptitude_count, POWER(COALESCE(psy_count, 0), 3) AS psy_count
        FROM 
            units u
        LEFT JOIN 
            number_rule ur ON u.Unit_id = ur.Unit_id
        LEFT JOIN 
            number_aptitudes ua ON u.Unit_id = ua.Unit_id
        LEFT JOIN 
            number_psy up ON u.Unit_id = up.Unit_id;
        """)
        rows = cur.fetchall()

        # Preprocess data
        Units_data = pd.DataFrame(rows, columns=['Unit_id', 'Unit_name', 'Unit_type', 'Nb_fig', '"Movement | Cruising Speed | Hover"', 'BS', 'WS', 'S', '"Front | Side | Rear"', 'W', 'A', 'I', 'Ld', 'OC', 'Sv', 'Invul_sv', 'U_Pts',
                'rule_count', 'aptitude_count', 'psy_count'])
        Units_data['"Movement | Cruising Speed | Hover"'] = Units_data['"Movement | Cruising Speed | Hover"'].apply(convert_movement)
        Units_data['BS'] = Units_data['BS'].apply(convert_bws)
        Units_data['WS'] = Units_data['WS'].apply(convert_bws)
        Units_data['A'] = Units_data['A'].apply(convert_a)
        Units_data['"Front | Side | Rear"'] = Units_data['"Front | Side | Rear"'].apply(convert_e)
        Units_data['W'] = Units_data['W'].apply(convert_w)
        Units_data['Ld'] = Units_data['Ld'].apply(convert_ld)
        Units_data['OC'] = Units_data['OC'].apply(convert_oc)
        Units_data['Sv'] = Units_data['Sv'].apply(convert_sv)
        Units_data['Invul_sv'] = Units_data['Invul_sv'].apply(convert_invul_sv)
        if (Units_data['Nb_fig'] == 0).any():
            print("Error: 'Nb_fig' contains zero values. Division by zero is not allowed.")
        else:
            # Create a new column 'U_Pts_by_fig' by dividing 'U_Pts' by 'Nb_fig' and rounding to integer
            Units_data['U_Pts_by_fig'] = Units_data.apply(lambda row: round(row['U_Pts'] / row['Nb_fig']), axis=1)
        
        # print(Units_data[['"Movement | Cruising Speed | Hover"', 'BS', 'WS', 'A', '"Front | Side | Rear"', 'W', 'Ld', 'OC', 'Sv', 'Invul_sv', 'rule_count', 'aptitude_count', 'psy_count']].unique())
        # print(Units_data.dtypes)

        ## Save the DataFrame to an Excel file
        # Units_data[['Unit_name', 'Nb_fig', '"Movement | Cruising Speed | Hover"', 'BS', 'WS', 'A', '"Front | Side | Rear"', 'W', 'Ld', 'OC', 'Sv', 'Invul_sv', 'rule_count', 'aptitude_count', 'psy_count', 'U_Pts']].to_excel('C:/Users/antoi/OneDrive/Documents/Individuels/Antoine/Professionnel/Projet_W40k/unit_predictions.xlsx', index=False)

        return Units_data

    finally:
        cur.close()
        conn.close()
## Define function to train and evaluate model
def train_and_evaluate_model(X_train, X_test, y_train, y_test):
    """
    Train and evaluate the Random Forest model.
    """
    # Split the data, train the model, and evaluate its performance
    rf_model = RandomForestRegressor(n_estimators=100, random_state=42)
    rf_model.fit(X_train, y_train)
    y_pred = rf_model.predict(X_test)
    mse = mean_squared_error(y_test, y_pred)
    print("Random Forest Mean Squared Error:", mse)
    return rf_model  # Return the trained model
## Define function to save results to Excel
def save_results_to_excel(Units_data):
    """
    Save calculated columns to an Excel file.
    """
    # Save results to an Excel file
    Units_data.to_excel('C:/Users/antoi/OneDrive/Documents/Individuels/Antoine/Professionnel/Projet_W40k/unit_predictions.xlsx', index=False)
## Define main function to orchestrate the process
def main():
    """
    Main function to orchestrate the process.
    """
    try:
        # Retrieve and preprocess data
        Units_data = retrieve_and_preprocess_data()

        # Split data, train and evaluate model
        X = Units_data.drop(columns=['Unit_id', 'Unit_name', 'Unit_type', 'Nb_fig'])  # Features
        y = Units_data['U_Pts_by_fig']  # Target
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
        rf_model = train_and_evaluate_model(X_train, X_test, y_train, y_test)

        # Use the trained Random Forest model to predict points for the entire dataset
        Units_data['Predicted_U_Pts_by_fig'] = rf_model.predict(X)
        Units_data['Predicted_U_Pts_by_fig'] = np.maximum(Units_data['Predicted_U_Pts_by_fig'], 0).round(-1).astype(int)

        # # Adjust points for Vehicles
        # Units_data['Predicted_U_Pts_by_fig'] = Units_data.apply(lambda row: row['Predicted_U_Pts_by_fig'] * 1.5 if row['Unit_type'] == 'Vehicle' else row['Predicted_U_Pts_by_fig'], axis=1)

        # Create 'Predicted_U_Pts' column
        Units_data['Predicted_U_Pts'] = Units_data['Predicted_U_Pts_by_fig'] * Units_data['Nb_fig']

        # Assess coherence of predicted 'U_Pts' values compared to actual values
        Units_data['Difference_by_fig'] = Units_data['Predicted_U_Pts_by_fig'] - Units_data['U_Pts_by_fig']
        Units_data['Difference'] = Units_data['Predicted_U_Pts'] - Units_data['U_Pts']

        # Save results to Excel
        save_results_to_excel(Units_data)

        # Establish database connection
        conn = psycopg2.connect(
            dbname="postgres",
            user="postgres",
            password="Olicah@y87",
            host="localhost",
            port="5432"
        )
        cur = conn.cursor()

        # Assess coherence and update database
        update_db(Units_data, conn, cur)

    except Exception as e:
        print("An error occurred:", str(e))
## Define function to update the Original Units table
def update_db(Units_data, conn, cur):
    """
    Update the original Units table with the corrected 'U_Pts' values.
    """
    # Update the original Units table with the corrected 'U_Pts' values
    for index, row in Units_data.iterrows():
        try:
            cur.execute("UPDATE Units SET U_Pts = %s WHERE Unit_id = %s", (row['Predicted_U_Pts'], row['Unit_id']))
        except Exception as e:
            print(f"Error updating Unit_id {row['Unit_id']}: {str(e)}")

    # Commit the changes
    conn.commit()

    # Close cursor and connection
    cur.close()
    conn.close()
## Check if the script is being run directly
if __name__ == "__main__":
    main()