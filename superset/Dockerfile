FROM centos:7

RUN yum update -y
RUN yum upgrade python-setuptools
RUN yum install -y gcc gcc-c++ libffi-devel python-devel python-pip python-wheel openssl-devel libsasl2-devel openldap-devel mysql-devel postgresql-devel

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN pip install --upgrade setuptools pip
RUN pip install flask-sqlalchemy==2.0 superset
# 必要に応じて色々導入する
RUN pip install mysqlclient psycopg2 #pyhive cx_Oracle sqlalchemy-redshift impylapy mssql
RUN pip install PyMySQL sqlalchemy-bigquery

RUN fabmanager create-admin --app superset --username admin --firstname admin --lastname admin --email test@example.com --password admin
RUN superset db upgrade
RUN superset load_examples
RUN superset init

CMD ["superset", "runserver", "-p", "80"]
