from setuptools import setup

def get_db_config():
    """Возвращает параметры подключения к базе данных."""
    return {
        "db_host": "localhost",
        "db_port": 5432,
        "db_name": "event_ticketing_db",
        "db_user": "postgres",
        "db_password": "postgres"
    }

setup(
    name='trpp-final-ticketing-db',
    version='1.0.0',
    description='База данных для продажи билетов на мероприятия',
    author='Магомедова Лолита, Багирян Марьям, Гаврилова Софья',
    python_requires='>=3.9',
)
