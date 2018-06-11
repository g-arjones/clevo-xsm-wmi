/*
 * This file is part of the clevo-xsm-wmi utility
 *
 * Copyright (C) 2018 <arjones@arjones.com>
 *
 * This program is free software;  you can redistribute it and/or modify
 * it under the terms of the  GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is  distributed in the hope that it  will be useful, but
 * WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
 * MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
 * General Public License for more details.
 *
 * You should  have received  a copy of  the GNU General  Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <iostream>
#include "mainwindow.h"

int pipefd[2];
pid_t child_pid;

int helper_get_readfd()
{
    return pipefd[0];
}

int helper_get_writefd()
{
    return pipefd[1];
}

void helper_start()
{
    keyboard_s settings;
    if (pipe(pipefd) == -1)
    {
        std::cerr << "[clevo-xsm-wmi] Failed to create pipe: " << strerror(errno) << std::endl;
        _exit(1);
    }

    switch((child_pid = fork()))
    {
    case 0:
        close(helper_get_writefd());
        while(read(helper_get_readfd(), &settings, sizeof(settings)))
        {
            keyboard_settings = settings;
            setKeyboardValues();
        }
        close(helper_get_readfd());
        _exit(0);
        break;

    case -1:
        std::cerr << "[clevo-xsm-wmi] Failed to fork: " << strerror(errno) << std::endl;
        close(helper_get_readfd());
        close(helper_get_writefd());
        _exit(1);
        break;

    default:
        close(helper_get_readfd());
    }
}

void helper_stop()
{
    int status;
    close(helper_get_writefd());
    waitpid(child_pid, &status, 1);
}
