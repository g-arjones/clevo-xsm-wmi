# clevo-xsm-wmi

Kernel module for keyboard backlighting of Clevo SM series notebooks.
(And several EM/ZM/DM series models)

This is a fork from https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi

### 1. Install system dependencies

```sh
$ sudo apt install build-essential linux-headers-$(uname -r) dkms qt5-default qt5-qmake
```

### 2. Build module and utility

```sh
$ make
$ sudo make install
```

### 3. Reboot your PC

```bash
$ sudo shutdown -r now
```

### 4. Usage

Adjusting keyboard settings:
```bash
$ clevo-xsm-wmi
```

Or use the keyboard hotkeys

### 5. License
This program is free software;  you can redistribute it and/or modify
it under the terms of the  GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or (at
your option) any later version.

This program is  distributed in the hope that it  will be useful, but
WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
General Public License for more details.

You should  have received  a copy of  the GNU General  Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
