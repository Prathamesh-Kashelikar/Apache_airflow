from airflow.models import DAG
from airflow.providers.sqlite.operators.sqlite import SqliteOperator
from datetime import datetime
from airflow.providers.http.sensors.http import HttpSensor
from airflow.providers.http.operators.http import SimpleHttpOperator
import json
from pandas import json_normalize
from airflow.operators.python import PythonOperator

default_args = {
    'start_date' : datetime(2020,1,1)
    }

def _processing_user(ti):
    user = ti.xcom_pull(task_id=['extracting_user'])
    if not len(user) or 'results' not in user[0]:
        raise ValueError('user is empty')
    user = user[0]['results'][0]
    processed_user = json_normalize({
        'firstname' : user['name']['first'],
        'lastname' : user['name']['last'],
        'country' : user['location']['country'],
        'username' : user['login']['username'],
        'password' : user['login']['password'],
        'email' : user['email']
    })

    processed_user.to_csv('/tmp/processed_user.csv', index = None , header = False)

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
        python_collable = _processing_user
    )