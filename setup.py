import pathlib
import subprocess

from setuptools import setup, find_packages
from setuptools.command.install import install
from setuptools.command.easy_install import easy_install

__require__ = ['pipenv']

packages = find_packages(exclude=['tests'])
base_dir = pathlib.Path(__file__).parent

pipenv_command = ['pipenv', 'install', '--deploy', '--system']
pipenv_command_dev = ['pipenv', 'install', '--dev', '--deploy', '--system']

class PostDevelopCommand(easy_install):
    """ 
        Post installation for development mode
    """
    def run(self):
        subprocess.check_call(pipenv_command_dev)
        easy_install.run(self)

class PostInstallCommand(install):
    """
        Post-installation for installation mode
    """
    def run(self):
        subprocess.check_call(pipenv_command)
        install.run(self)

setup(
    name= 'usecase_addition',
    packages= [''],
    long_description= 'This a simple package that shows a usecase of what, we ll work on',
    setup_requires=[],
    install_requires=[
        "grpc",
        "asyncio",

    ],
    cmdclass={
        'easy_install': PostDevelopCommand,
        'install': PostInstallCommand,
    }
)