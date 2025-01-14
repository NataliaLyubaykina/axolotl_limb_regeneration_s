from setuptools import setup
setup(
  name='image_analysis',
  version='0.1.0',
  author='Natalia',
  author_email='natalia.lyubaykina@gmail.com',
  packages=['image_analysis'],
  #url='http://pypi.python.org/pypi/powersmooth/',
  #license='LICENSE.txt',
  description='Image analysis of the Axolotl limb regeneration data',
  #long_description=open('README.md').read(),
  install_requires=[
      "pyclesperanto_prototype >= 0.24.1",
      "scipy >= 1.9.1",
      "scikit-image >= 0.19.3",
      "aicsimageio >= 4.10.0",
      "apoc >= 0.12.0",
      "napari >= 0.4.17"
  ],
)
