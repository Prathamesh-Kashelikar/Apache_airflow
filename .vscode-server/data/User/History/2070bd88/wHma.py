from airflow.models import DAG
from airflow.providers.sqlite.operators.sqlite import SqliteOperator
from datetime import datetime
from airflow.providers.http.sensors.http import HttpSensor
from airflow.providers.http.operators.http import SimpleHttpOperator
import json
from pandas import json_normalize
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
default_args = {
    'start_date' : datetime(2020,1,1)
    }

def _processing_user(ti):
    user = ti.xcom_pull(task_ids=['extracting_user'])
    if not len(user) or 'results' not in user[0]:
        raise ValueError('user is empty')
    users = user[0]['results'][0]
    processed_users = json_normalize({
        'firstname' : users['name']['first'],
        'lastname' : users['name']['last'],
        'country' : users['location']['country'],
        'username' : users['login']['username'],
        'password' : users['login']['password'],
        'email' : users['email']
    })

    processed_users.to_csv('/tmp/processed_user.csv', index = None , header = False)

with DAG('user_process',schedule_interval='@daily',
            default_args = default_args,
            catchup=False) as dag:
        # Define tasks/operators
    creating_table = SqliteOperator(
        task_id = 'create_table',
        sqlite_conn_id='db_sqlite',
        sql = '''
            CREATE TABLE user(
                firstname TEXT NOT NULL,
                lastname TEXT NOT NULL,
                country TEXT NOT NULL,
                username TEXT NOT NULL,
                password TEXT NOT NULL,
                email TEXT NOT NULL PRIMARY KEY
                );
                '''
    )

    is_api_available = HttpSensor(
        task_id = 'is_api_available',
        http_conn_id = 'user_api',
        endpoint = 'api/'
    )

    extracting_user = SimpleHttpOperator(
        task_id = 'extracting_user',
        http_conn_id = 'user_api',
        endpoint = 'api/',
        method = 'GET',
        response_filter = lambda response:json.loads(response.text),
        log_response = True
    )

    processing_user = PythonOperator(
        task_id = 'processing_user',
        python_callable = _processing_user
    )

    storing_user = BashOperator(
        task_id = 'storing_user',
        bash_command = 'echo -e ".separator ","\n.import /tmp/processed_user.csv user" | sqlite3 /home/airflow/airflow/airflow.db'
    )


    creating_table >> is_api_available >> extracting_user >> 