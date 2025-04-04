import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error
import pg8000
import numpy as np

## Retrieve and preprocesse data into a DataFrame named 'weapons_data'

# Connect to the database
conn = pg8000.connect(
    user='postgres',
    password='Olic@hay87',
    host='localhost',
    port=5432,
    database='Personnal_datas'
)

# Create a cursor
cur = conn.cursor()

try:
    # Execute the SQL query to retrieve data from the weapons and special rules tables
    cur.execute("""
        WITH number_rule AS (
                SELECT Weapon_id, COUNT(*) AS rule_count
                FROM weapons_rules
                GROUP BY Weapon_id
        )
        
        SELECT w.Weapon_id, w.Weapon_name, w.Weapon_type, w.RANGE, w.A, w.S, w.AP, w.D, w.W_Pts, w.group_faction_id, rule_count
        FROM weapons w
        LEFT JOIN number_rule wr ON w.Weapon_id = wr.Weapon_id
    """)
    
    # Fetch all rows
    rows = cur.fetchall()
    
    # Convert the fetched data into a DataFrame
    weapons_data = pd.DataFrame(rows, columns=['Weapon_id', 'Weapon_name', 'Weapon_type', 'RANGE', 'A', 'S', 'AP', 'D', 'W_Pts', 'group_faction_id', 'rule_count'])

    # Remplacer les valeurs nulles par des valeurs par défaut pour éviter les erreurs de conversion
    weapons_data.fillna({
        'RANGE': '1',  # Valeur par défaut pour RANGE
        'A': 'User',      # Valeur par défaut pour A
        'S': 'User',      # Valeur par défaut pour S
        'AP': '0',     # Valeur par défaut pour AP
        'D': '1',      # Valeur par défaut pour D
        'rule_count': 0
    }, inplace=True)


# Preprocessing: handle missing values, encode categorical variables, etc.

    def logic_1_20_1_100(value):
        if value is None:
            return 1  # Valeur par défaut pour les valeurs manquantes
        # Define the points (1, 0.01) and (20, 1)
        x1, y1 = 1, 0.01
        x2, y2 = 20, 1
        
        # Calculate the slope (m) and intercept (c) of the linear equation y = mx + c
        m = (y2 - y1) / (x2 - x1)
        c = y1 - m * x1
        
        # Calculate the converted value using the linear equation
        convertevalue = m * float(value) + c
        
        return convertevalue

    def logic_1_20_10_100(value):
        if value is None:
            return 1  # Valeur par défaut pour les valeurs manquantes
        # Define the points (1, 0.01) and (20, 1)
        x1, y1 = 1, 0.1
        x2, y2 = 20, 1
        
        # Calculate the slope (m) and intercept (c) of the linear equation y = mx + c
        m = (y2 - y1) / (x2 - x1)
        c = y1 - m * x1
        
        # Calculate the converted value using the linear equation
        convertevalue = m * float(value) + c
        
        return convertevalue

    def logic_1_12_10_100(value):
        if value is None:
            return 1  # Valeur par défaut pour les valeurs manquantes
        # Define the points (1, 0.01) and (20, 1)
        x1, y1 = 1, 0.1
        x2, y2 = 12, 1
        
        # Calculate the slope (m) and intercept (c) of the linear equation y = mx + c
        m = (y2 - y1) / (x2 - x1)
        c = y1 - m * x1
        
        # Calculate the converted value using the linear equation
        convertevalue = m * float(value) + c
        
        return convertevalue

    def convert_range(value):
        # Define the mapping of values to their corresponding numeric values
        mapping = {
            '12"': 0.12,
            '15"': 0.15,
            'Template': 1,
            '18"': 0.18,
            '=': 1,
            '24"': 0.24,
            '60"': 0.60,
            '48"': 0.48,
            '-25%': -0.25,
            '30"': 0.30,
            'Melee': 1,
            '8"': 0.08,
            '3"': 0.03,
            '6"': 0.06,
            '72"': 0.72,
            '36"': 0.36,
            '+25%': 0.25
        }
        
        # Return the converted value based on the range mapping
        if value is None:
            return 1  # Valeur par défaut pour les valeurs nulles
        return mapping.get(value, 1)  # Valeur par défaut 1 pour celles non trouvées

    def convert_s(value):
        # Define the mapping of s values to their corresponding converted values
        mapping = {
            '-3': lambda: logic_1_20_1_100(-14),
            '+1': lambda: logic_1_20_1_100(12),
            '+2': lambda: logic_1_20_1_100(13),
            '+3': lambda: logic_1_20_1_100(14),
            '+4': lambda: logic_1_20_1_100(15),
            '+5': lambda: logic_1_20_1_100(16),
            '=': lambda: logic_1_20_1_100(10),
            '1': lambda: logic_1_20_1_100(1),
            '10': lambda: logic_1_20_1_100(10),
            '12': lambda: logic_1_20_1_100(12),
            '14': lambda: logic_1_20_1_100(14),
            '15': lambda: logic_1_20_1_100(15),
            '16': lambda: logic_1_20_1_100(16),
            '18': lambda: logic_1_20_1_100(18),
            '2': lambda: logic_1_20_1_100(2),
            '20': lambda: logic_1_20_1_100(20),
            '3': lambda: logic_1_20_1_100(3),
            '4': lambda: logic_1_20_1_100(4),
            '5': lambda: logic_1_20_1_100(5),
            '6': lambda: logic_1_20_1_100(6),
            '7': lambda: logic_1_20_1_100(7),
            '8': lambda: logic_1_20_1_100(8),
            '9': lambda: logic_1_20_1_100(9),
            'User': lambda: logic_1_20_1_100(1),
            'x2': lambda: logic_1_20_1_100(20)
        }

        # Return the converted value based on the mapping
        if value is None:
            return 1
        return mapping.get(value, logic_1_20_1_100(1))()

    def convert_a(value):
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            '-1': lambda: logic_1_20_10_100(-12),
            '-2': lambda: logic_1_20_10_100(-13),
            '+1': lambda: logic_1_20_10_100(12),
            '+2': lambda: logic_1_20_10_100(13),
            '+3': lambda: logic_1_20_10_100(14),
            '+D3': lambda: logic_1_20_10_100(13),
            '=': lambda: logic_1_20_10_100(10),
            '1': lambda: logic_1_20_10_100(1),
            '18': lambda: logic_1_20_10_100(18),
            '2': lambda: logic_1_20_10_100(2),
            '2D3': lambda: logic_1_20_10_100(6),
            '2D6': lambda: logic_1_20_10_100(12),
            '3': lambda: logic_1_20_10_100(3),
            '3D3': lambda: logic_1_20_10_100(9),
            '4': lambda: logic_1_20_10_100(4),
            '5': lambda: logic_1_20_10_100(5),
            '6': lambda: logic_1_20_10_100(6),
            '8': lambda: logic_1_20_10_100(8),
            'D3': lambda: logic_1_20_10_100(3),
            'D3+1': lambda: logic_1_20_10_100(4),
            'D6': lambda: logic_1_20_10_100(6),
            'D6+3': lambda: logic_1_20_10_100(9),
            'User': lambda: logic_1_20_10_100(10),
            'X': lambda: logic_1_20_10_100(10),
            'x2': lambda: logic_1_20_10_100(15),
            'x3': lambda: logic_1_20_10_100(20)
        }


        # Return the converted value based on the mapping
        if value is None:
            return 1
        return mapping.get(value, logic_1_20_10_100(10))()

    def convert_ap(value):
        # Define the mapping of values to their corresponding numeric values
        mapping = {
            '=': 0.1,
            '0': 0.01,
            '-1': 0.2,
            '-2': 0.4,
            '-3': 0.6,
            '-4': 0.8,
            '-5': 1
        }
        
        # Return the converted value based on the range mapping
        if value is None:
            return 0.1
        return mapping.get(value, 0.1)

    def convert_d(value):
        # Define the mapping of a values to their corresponding converted values
        mapping = {
            'D6+4': lambda: logic_1_12_10_100(10),
            'D6+3': lambda: logic_1_12_10_100(9),
            'D6+2': lambda: logic_1_12_10_100(8),
            'D6+1': lambda: logic_1_12_10_100(7),
            'D6': lambda: logic_1_12_10_100(6),
            'D3+4': lambda: logic_1_12_10_100(7),
            'D3+3': lambda: logic_1_12_10_100(6),
            'D3+2': lambda: logic_1_12_10_100(5),
            'D3+1': lambda: logic_1_12_10_100(4),
            'D3': lambda: logic_1_12_10_100(3),
            '2D6': lambda: logic_1_12_10_100(12),
            '2D3': lambda: logic_1_12_10_100(6),
            '8': lambda: logic_1_12_10_100(8),
            '6': lambda: logic_1_12_10_100(6),
            '4': lambda: logic_1_12_10_100(4),
            '3': lambda: logic_1_12_10_100(3),
            '2': lambda: logic_1_12_10_100(2),
            '1': lambda: logic_1_12_10_100(1),
            '=': lambda: logic_1_12_10_100(1)
        }


        # Return the converted value based on the mapping
        if value is None:
            return 1
        return mapping.get(value, logic_1_12_10_100(1))()

    # Apply the convert_range function to the 'RANGE' column
    weapons_data['RANGE'] = weapons_data['RANGE'].apply(convert_range)
    # print(Units_data['RANGE'].unique())

    # Apply the convert_a function to the 'A' column
    weapons_data['A'] = weapons_data['A'].apply(convert_a)
    # print(Units_data['A'].unique())

    # Apply the convert_s function to the 'S' column
    weapons_data['S'] = weapons_data['S'].apply(convert_s)
    # print(Units_data['S'].unique())

    # Apply the convert_ap function to the 'AP' column
    weapons_data['AP'] = weapons_data['AP'].apply(convert_ap)
    # print(Units_data['AP'].unique())

    # Apply the convert_d function to the 'D' column
    weapons_data['D'] = weapons_data['D'].apply(convert_d)
    # print(Units_data['D'].unique())

    # # Save the DataFrame to an Excel file to check the correct data transformation
    # weapons_data[['RANGE', 'A', 'S', 'AP', 'D']].to_excel('C:/Users/antoi/OneDrive/Documents/Individuels/Antoine/Professionnel/Projet_W40k/weapons_predictions.xlsx', index=False)

    # Fetch all rows
    rows = cur.fetchall()

   # Conversion et entraînement du modèle
   # # Split the dataset into features (X) and target variable (y)
    X = weapons_data[['rule_count', 'RANGE', 'A', 'S', 'AP', 'D']].values
    y = weapons_data['W_Pts'].values.reshape(-1, 1)

    # Split the data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Create and train the RandomForestRegressor model
    model = RandomForestRegressor(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    
    # Evaluate the model's performance on the testing set
    y_pred = model.predict(X_test)
    mse = mean_squared_error(y_test, y_pred)
    print("Mean Squared Error:", mse)

    # Use the trained model to predict 'W_Pts' for the entire dataset
    weapons_data['Predicted_W_Pts'] = model.predict(X).round().astype(int)

    # Assess coherence of predicted 'W_Pts' values compared to actual values
    weapons_data['Difference'] = weapons_data['Predicted_W_Pts'] - weapons_data['W_Pts']

    # Update the original weapons table with the corrected 'W_Pts' values
    for index, row in weapons_data.iterrows():
        try:
            # Update or add a new column 'U_Pts_updated' with the predicted values
            cur.execute("ALTER TABLE WEAPONS ADD COLUMN IF NOT EXISTS W_Pts_updated INTEGER;")
            cur.execute("UPDATE weapons SET W_Pts_updated = %s WHERE Weapon_id = %s", (row['Predicted_W_Pts'], row['Weapon_id']))
        except Exception as e:
            print(f"Error updating Weapon_id {row['Weapon_id']}: {str(e)}")
    
    # Commit the changes
    conn.commit()

finally:
    # Close the cursor and connection
    cur.close()
    conn.close()