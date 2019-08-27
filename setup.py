from setuptools import setup

setup(
    # Needed to silence warnings (and to be a worthwhile package)
    # Needed for dependencies
    install_requires = ['re>2.1', 'pandas==0.24'],
    install_requires = ['django-pipeline==1.1.22', 'south>=0.7']
    # The license can be anything you like
    license='MIT',
    description='An example of a python package from pre-existing code',
    # We will also need a readme eventually (there will be a warning)
    # long_description=open('README.txt').read(),
)
