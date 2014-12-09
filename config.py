# sample ipython_config.py
c = get_config()

c.InteractiveShellApp.exec_lines = [
    'import numpy as np',
    'import scipy as sp',
    'import matplotlib.pyplot as plt',
    'import scipy.stats as stats'
]

c.NotebookApp.base_project_url = '/ipython/'
c.NotebookApp.base_kernel_url = '/ipython/'
c.NotebookApp.trust_xheaders = True
c.NotebookApp.webapp_settings = {'static_url_prefix': '/ipython/static/'}
