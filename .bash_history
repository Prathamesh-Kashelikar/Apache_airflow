python
sudo apt update
sudo apt -y upgrade
python
python3
sudo apt-get install python3-pip==20.2.4
sudo apt-get install "python3-pip==20.2.4"
sudo apt-get install python3-pip@20.2.4
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py pip==20.2.4
python3 get-pip.py pip==20.2.4
ls
sudo apt-get install build-essential
sudo apt-get install -y --no-install-recommends         freetds-bin         krb5-user         ldap-utils         libffi6         libsasl2-2         libsasl2-modules         libssl1.1         locales          lsb-release         sasl2-bin         sqlite3         unixodbc         wget
sudo apt-get install -y --no-install-recommends freetds-bin krb5-user ldap-utils libffi6 libsasl2-2 libsasl2-modules libssl1.1 locales lsb-release sasl2-bin sqlite3 unixodbc
sudo apt-get install -y --no-install-recommends freetds-bin krb5-user ldap-utils libsasl2-2 libsasl2-modules libssl1.1 locales lsb-release sasl2-bin sqlite3 unixodbc
ls
python3 -m venv sandboz
rm -rf get-pip.py 
sudo apt-get install python3-venv
python3 -m venv sandbox
source sandbox/bin/activate
pip3 install apache-airflow==2.0.0b3 --constraint https://raw.githubusercontent.com/apache/airflow/constraints-master/constraints-3.8.txt
sudo apt-get install python3-dev
ls
rm -rf sandboz
ls
rm -rf sandbox/
pip3 install wheel
pip install wheel
ls
sudo apt-get install python3-dev python3-pip python3-venv python3-wheel -y
sudo apt-get install gcc libpq-dev -y
pip3 install wheel
ls
source sandbox/bin/activate
ls
cd airflow
source sandbox/bin/activate
ls
python3 -m venv sandbox
source sandbox/bin/activate
pip install wheel
pip3 install apache-airflow==2.1.0 --constraint https://gist.githubusercontent.com/marclamberti/742efaef5b2d94f44666b0aec020be7c/raw/21c88601337250b6fd93f1adceb55282fb07b7ed/constraint.txt
airflow db init
ls
cd airflow
ls
airflow webserver
cd ..
airflow -h
airflow db -h
airflow users -h
airflow users create -h
airflow users create -u admin -p admin -f prathamesh -l k -r Admin -e admin@airflow.com
cd airflow
airflow webserver
source sandbox/bin/activate
airflow dags list
airflow tasks list example_xcom_args
cd airflow
ls
python3 -m venv sandbox
source sandbox/bin/activate
airflow scheduler
cd ..
source sandbox/bin/activate
airflow scheduler
CD ..
cd ..
source sandbox/bin/activate
airflow webserver
cd ..
source sandbox/bin/activate
airflow webserver
airflow webserver -p 8080 -D True
airflow webserver -h
airflow webserver
cd ..
source sandbox/bin/activate
airflow scheduler
cd ..
source sandbox/bin/activate
airflow webserver
cd ..
source sandbox/bin/activate
airflow scheduler
mkdir dags
cd ..
source sandbox/bin/activate
pip install 'apache-airflow-providers-sqlite'
cd airflow
ls
pwd
airflow tasks test user_processing creating_table 2022-04-28
sqlite3 airflow.db
airflow tasks test user_processing creating_table 2022-01-01
sqlite3 airflow.db
cd airflow
ls
airflow tasks test user_processing creating_table 2022-01-01
cd ..
source sandbox/bin/activate
pip install 'apache-airflow-providers-sqlite'
cd airflow
ls
pwd
airflow tasks test user_processing creating_table 2020-01-01
sqlite3 airflow.db
airflow tasks test user_processing creating_table 2020-01-01
sqlite3 airflow.db
airflow tasks test user_processing creating_table 2020-01-01
sqlite3 airflow.db
cd ..
source sandbox/bin/activate
ls
airflow webserver
cd ..
source sandbox/bin/activate
airflow scheduler
ls
cd airflow
ls
cd airflow
cd ..
python3 -m venv sandbox
source sandbox/bin/activate
pip install wheel
pip3 install apache-airflow==2.1.0 --constraint https://gist.githubusercontent.com/marclamberti/742efaef5b2d94f44666b0aec020be7c/raw/21c88601337250b6fd93f1adceb55282fb07b7ed/constraint.txt
airflow db init
ls
c airflow
cd airflow
ls
airflow webserver
airflow db -h
airflow users create -u admin -p admin -f prathamesh -l k -r Admin -e admin@airflow.com
cd ..
airflow dags list
airflow tasks list example_xcom_args
source sandbox/bin/activate
cd airflow
cd ..
source sandbox/bin/activate
airflow webserver
airflow scheduler
cd ..
source sandbox/bin/activate
airflow scheduler
source sandbox/bin/activate
airflow webserver
source sandbox/bin/activate
airflow scheduler
source sandbox/bin/activate
cd ..
source sandbox/bin/activate
cd airflow
airflow config get-value core sql_alchemy_conn
airflow config get-value core executor
airflow webserver
sudo kill -9 $(sudo lsof -t -i:9001)
sudo kill -9 <pid> 1688
cc ..
cd ..
source sandbox/bin/activate
airflow celery flower
sudo -u postgres psql
cd ..
docker -s -a
docker -ps -a
docker ps -a
sudo docker ps -a
sudo docker list
docker -h
sudo docker images
curl -X GET "http://localhost:9200/connections/_search" -H "Content-type: application/json" -d '{"query":{"match_all":{}}}'
cd ..
source sandbox/bin/activate
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch
pip install elasticsearch==7.10.1
sudo systemctl start elasticsearch
curl -X GET 'http://localhost:9200'
cd ..
source sandbox/bin/activate
airflow celery worker
cd ..
source sandbox/bin/activate
airflow celery flower
pip install --upgrade apache-airflow-providers-celery==2.0.0
airflow celery flower
cd ..
source sandbox/bin/activate
cd airflow
sudo apt update
sudo apt install postgresql
sudo -u postgres psql
pip install 'apache-airflow[postgres]'
airflow db check
airflow scheduler
cd ..
source sandbox/bin/activate
airflow scheduler
cd airflow
airflow scheduler
airflow webserver
cd ..
source sandbox/bin/activate
airflow webserver
cd airflow
airflow webserver
kill -9 1688
airflow webserver
sudo kill -9 $(sudo lsof -t -i:9001)
sudo kill -9 $(sudo lsof -t -i:8080)
airflow webserver
airflow db init
airflow users create -u admin -p admin -r Admin -f admin -l admin -e admin@airflow.com
cd ..
pip install 'apache-airflow[celery]'
sudo apt update
sudo apt install redis-server
sudo nano etc/redis/redis.conf
sudo nano /etc/redis/redis.conf
sudo systemctl restart redis.service
sudo systemctl status redis.service
pip install 'apache-airflow[redis]'
