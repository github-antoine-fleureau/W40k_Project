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
    if value is None:
        return 1  # Valeur par défaut pour les valeurs manquantes
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
        '20-30"': 0.30,
        '30-45"': 0.45,
        '13-20"': 0.20,
        '19-30"': 0.30,
        '7-10"': 0.10,
        '10-15"': 0.15,
        '21"': 0.21,
        '18"': 0.18,
        '16"': 0.16,
        '15"': 0.15,
        '14"': 0.14,
        '13"': 0.13,
        '12"': 0.12,
        '11"': 0.11,
        '10"': 0.10,
        '9"': 0.09,
        '8"': 0.08,
        '7"': 0.07,
        '6"': 0.06,
        '5"': 0.05,
        '4"': 0.04,
        '3"': 0.03,
        '2"': 0.02,
        '1"': 0.01,
        '0"': 0.005
    }
    
    # Return the converted value based on the movement mapping
    if value is None:
        return 1  # Valeur par défaut pour les valeurs nulles
    return mapping.get(value, 0.06)  # Valeur par défaut 1 pour celles non trouvées
def convert_bws(value):
    """
    Function to convert BS & WS values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '2+': 2,
        '3+': 1.5,
        '4+': 1.0,
        '5+': 0.5,
        '6+': 0.1
    }


    # Return the converted value based on the s_mapping
    if value is None:
        return 1  # Valeur par défaut pour les valeurs nulles
    return mapping.get(value, 1)  # Valeur par défaut 1 pour celles non trouvées
def convert_ld(value):
    """
    Function to convert ld values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '4+': 2,
        '5+': 1.7,
        '6+': 1.4,
        '7+': 1.0,
        '8+': 0.7,
        '9+': 0.5,
        '10+': 0.1
    }


    # Return the converted value based on the s_mapping
    if value is None:
        return 1  # Valeur par défaut pour les valeurs nulles
    return mapping.get(value, 1)  # Valeur par défaut 1 pour celles non trouvées
def convert_sv(value):
    """
    Function to convert sv values.
    """
    if isinstance(value, list):
        # Handle lists by joining their elements into a single string
        value = ','.join(value)
    
    # Define the mapping of a values to their corresponding converted values
    mapping = {
        '2+': 2,
        '3+': 1.5,
        '4+': 1.0,
        '5+': 0.5,
        '6+': 0.1,
        '7+': 0.01,
        '8+': 0.01
    }


    # Return the converted value based on the s_mapping
    if value is None:
        return 1  # Valeur par défaut pour les valeurs nulles
    return mapping.get(value, 1)  # Valeur par défaut 1 pour celles non trouvées
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
        '3++/3++': 4,
        '4++/4++': 3,
        '5++/5++': 2,
        '6++/6++': 1,
        '3++/4++': 3.5,
        '4++/3++': 3.5,
        '4++/5++': 1.5,
        '5++/4++': 1.5,
        '6++/5++': 0.5,
        '7++/6++': 0.1,
        '8++/7++': 0.01,
    }


    # Return the converted value based on the s_mapping
    if value is None:
        return 1  # Valeur par défaut pour les valeurs nulles
    return mapping.get(value, 0.01)  # Valeur par défaut 1 pour celles non trouvées
## Define function to retrieve and preprocess data from the database
def retrieve_and_preprocess_data():
    """
    Retrieve and preprocess data from the database.
    """
    try:
        conn = psycopg2.connect(
        dbname="Personnal_datas",
        user="postgres",
        password="Olic@hay87",
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
            u.Unit_id, u.Unit_name, u.Unit_type, u.Nb_fig, u.Movement, u.Cruising_Speed, u.Hover, u.BS, u.WS, u.S, u.T, u.Front, u.Side, u.Rear, u.HP, u.A, u.I, u.Ld, u.OC, u.Sv, u.Invul_sv, u.U_Pts,
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
        Units_data = pd.DataFrame(rows, columns=['Unit_id', 'Unit_name', 'Unit_type', 'Nb_fig', 'Movement', 'Cruising Speed', 'Hover', 'BS', 'WS', 'S', 'T', 'Front', 'Side', 'Rear', 'HP', 'A', 'I', 'Ld', 'OC', 'Sv', 'Invul_sv', 'U_Pts',
                'rule_count', 'aptitude_count', 'psy_count'])
        Units_data['Movement'] = Units_data['Movement'].apply(convert_movement)
        Units_data['Cruising Speed'] = Units_data['Cruising Speed'].apply(convert_movement)
        Units_data['Hover'] = Units_data['Hover'].apply(convert_movement)
        Units_data['BS'] = Units_data['BS'].apply(convert_bws)
        Units_data['WS'] = Units_data['WS'].apply(convert_bws)
        Units_data['Ld'] = Units_data['Ld'].apply(convert_ld)
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
            dbname="Personnal_datas",
            user="postgres",
            password="Olic@hay87",
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
            # Update or add a new column 'U_Pts_updated' with the predicted values
            cur.execute("ALTER TABLE Units ADD COLUMN IF NOT EXISTS U_Pts_updated INTEGER;")
            cur.execute("UPDATE Units SET U_Pts_updated = %s WHERE Unit_id = %s", (row['Predicted_U_Pts'], row['Unit_id']))
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