import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
import psycopg2

# Retrieve and preprocesse data into a DataFrame named 'weapons_data'
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
    # Execute the SQL query to retrieve data from the weapons table
    cur.execute("""
        SELECT w.Weapon_id, w.Weapon_name, w.Weapon_type, w.RANGE, w.A, w.S, w.AP, w.D, w.W_Pts, w.group_faction_id, wr.Rule_id
        FROM weapons w
        LEFT JOIN weapons_rules wr ON w.Weapon_id = wr.Weapon_id
    """)
    
    # Fetch all rows
    rows = cur.fetchall()
    
    # Convert the fetched data into a DataFrame
    weapons_data = pd.DataFrame(rows, columns=['Weapon_id', 'Weapon_name', 'Weapon_type', 'RANGE', 'A', 'S', 'AP', 'D', 'W_Pts', 'group_faction_id', 'Rule_id'])

    # Perform preprocessing steps as needed:
    # - Handle missing values
    # - Encode categorical variables (if necessary)
    # - Normalize numerical variables (if necessary)
    # - Feature engineering (if necessary)
    
    # For example, you can drop the 'Weapon_id' column if it's not needed for modeling
    weapons_data.drop(columns=['Weapon_id'], inplace=True)

finally:
    # Close the cursor and connection
    cur.close()
    conn.close()

# Preprocessing: handle missing values, encode categorical variables, etc.

# Split the data into training and testing sets
X = weapons_data[['Weapon_type', 'RANGE', 'A', 'S', 'AP', 'D', 'Special_rules']]
y = weapons_data['W_Pts']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Choose a regression algorithm and train the model
model = LinearRegression()
model.fit(X_train, y_train)

# Evaluate the model's performance on the testing set
y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)

# Use the trained model to predict W_Pts for the entire dataset
weapons_data['Predicted_W_Pts'] = model.predict(X)

# Identify weapons with significant differences between predicted and actual W_Pts
threshold = 10  # Adjust threshold as needed
weapons_data['Difference'] = weapons_data['Predicted_W_Pts'] - weapons_data['W_Pts']
inconsistent_weapons = weapons_data[abs(weapons_data['Difference']) > threshold]

# Apply the learned logic to update W_Pts for inconsistent weapons
# Update the database with the corrected W_Pts values for inconsistent weapons
