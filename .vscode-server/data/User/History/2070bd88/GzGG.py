from airflow.models import DAG
from airflow.providers.sqlite.operators.sqlite import SqliteOperator
from datetime import datetime
from airflow.providers.http.sensors.http import HttpSensor

default_args = {
    'start_date' : datetime(2020,1,1)
    }
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