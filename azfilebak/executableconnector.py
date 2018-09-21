# coding=utf-8
"""
ExecutableConnector
"""

import shlex
import subprocess
import logging

from .naming import Naming
from .funcmodule import printe, out, log_stdout_stderr
from .backupexception import BackupException

class ExecutableConnector(object):
    """Drive the command that executes the backup."""

    def __init__(self, backup_configuration):
        self.backup_configuration = backup_configuration

    def assemble_backup_command(self, sources, exclude):
        """Assemble backup command line from configuration."""
        cmd = 'tar cpzf - --hard-dereference'
        excludes = exclude.split(',')
        for i in excludes:
            cmd += ' --exclude ' + i
        cmd += ' ' + sources
        return cmd

    def run_backup_command(self, command):
        """Create a backup for a given fileset."""
        args = shlex.split(command)

        logging.debug("Executing %s", args[0])

        proc = subprocess.Popen(
            args,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )

        return proc
