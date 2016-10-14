Content-Type: multipart/mixed; boundary="===============0325016831733996868=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86] 811565123a: BUG: kernel hang in early-boot stage, last printk: Probing EDD (edd=off to disable)... ok
Date: Fri, 14 Oct 2016 12:56:00 +0800
Message-ID: <20161014045600.GA9378@yexl-desktop>
In-Reply-To: <20161014005305.GB13114@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0325016831733996868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/14, Ye Xiaolong wrote:
>On 10/13, Andi Kleen wrote:
>>Andi Kleen <andi@firstfloor.org> writes:
>>
>>Any comments on this?
>>
>>I still cannot reproduce the failure unfortunately.
>>
>
>Btw, you can try below commands to reproduce the error on your local
>host, they will download the necessary images and run QEMU:
>
>       git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
>       cd lkp-tests
>       bin/lkp qemu -k KERNEL job-script  # job-script is attached in the =
original report email

Results show this hang may be related to gcc version, with gcc version
4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.3), kernel could boot without early
hang, but if kernel was built with gcc version 6.2.0 20160901 (Debian
6.2.0-3), it will stuck in the early stage:

early console in setup code
Probing EDD (edd=3Doff to disable)... ok


gdb output as below:

$ gdb -ex "target remote localhost:1234" vmlinux =

GNU gdb (Ubuntu 7.7.1-0ubuntu5~14.04.2) 7.7.1
Copyright (C) 2014 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from vmlinux...done.
Remote debugging using localhost:1234
0x048a34d9 in ?? ()
(gdb) bt
#0  0x048a34d9 in ?? ()
#1  0x00000000 in ?? ()
(gdb) =



Thanks,
Xiaolong
>
>Thanks,
>Xiaolong
>>
>>> Could you do two tests for me:
>>>
>>> - Enable CONFIG_MICROCODE_INTEL and see if it boots then
>>>
>>> - Add CONFIG_DEBUG_INFO to the config.
>>> Add -s to the qemu command line and boot again. Then when it hangs =

>>> connect gdb to see where it hangs
>>>
>>> gdb -ex "target remote localhost:1234" vmlinux
>>> bt
>>>
>>> <show output>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============0325016831733996868==--

