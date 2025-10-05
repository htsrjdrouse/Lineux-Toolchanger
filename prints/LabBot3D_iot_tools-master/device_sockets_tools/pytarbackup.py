import os
import tarfile

home = '/home/richard'
backup_dir = '/home/backups'

home_dirs = [ name for name in os.listdir(home) if os.path.isdir(os.path.join(home, name)) ]

for directory in home_dirs:
    full_dir = os.path.join(home, directory)
    tar = tarfile.open(os.path.join(backup_dir, directory+'.tar.gz'), 'w:gz')
    tar.add(full_dir)
    tar.close()


home = '/var/www'

home_dirs = [ name for name in os.listdir(home) if os.path.isdir(os.path.join(home, name)) ]

for directory in home_dirs:
    full_dir = os.path.join(home, directory)
    tar = tarfile.open(os.path.join(backup_dir, directory+'.tar.gz'), 'w:gz')
    tar.add(full_dir)
    tar.close()



