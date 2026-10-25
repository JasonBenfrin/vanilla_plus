import os
import inspect

def relative_file_exists(relative: str):
  abspath = path_relative_to_file(relative)
  return os.path.isfile(abspath)

def path_relative_to_file(relative: str):
  return os.path.join(os.path.dirname(inspect.stack()[1].filename ), relative)