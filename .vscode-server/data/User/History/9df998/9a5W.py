from airflow.models import BashOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from elasticsearch_plugin.hooks.elastic_hook import ElasticHook

from contextlib import closing
import json

class PostgresToElasticOperator(BashOperator):
    def __init__(self ,sql , index ,postgres_conn_id="postgres_default",
    elastic_conn_id="elasticsearch_default",*args,**kwargs):
    super(PostgresToElasticOperator,self).__init__(*args,**kwargs)

    self.sql = sql
    self.index = index
    self.postgres_conn_id = postgres_conn_id
    self.elastic_conn_id = elastic_conn_id