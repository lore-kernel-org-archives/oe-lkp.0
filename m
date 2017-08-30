Content-Type: multipart/mixed; boundary="===============6503103063771656089=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [irda] 66d98e78e4: BUG:unable_to_handle_kernel
Date: Wed, 30 Aug 2017 14:19:23 +0800
Message-ID: <20170830061923.GG7797@yexl-desktop>
In-Reply-To: <20170830061215.GA3682@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6503103063771656089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/30, Greg Kroah-Hartman wrote:
>On Wed, Aug 30, 2017 at 02:04:11PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit:
>> =

>> commit: 66d98e78e44ccb969cb3196995759d200e64b49b ("irda: move net/irda/ =
to drivers/staging/irda/net/")
>> url: https://github.com/0day-ci/linux/commits/Greg-Kroah-Hartman/irda-mo=
ve-it-to-drivers-staging-so-we-can-delete-it/20170829-090816
>> =

>> in testcase: trinity
>> with following parameters:
>> =

>> 	runtime: 300s
>> =

>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>> =

>> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
>> =

>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>> =

>> +-----------------------------------------------------+------------+----=
--------+
>> |                                                     | 89ff9d58e6 | 66d=
98e78e4 |
>> +-----------------------------------------------------+------------+----=
--------+
>> | boot_successes                                      | 0          | 0  =
        |
>> | boot_failures                                       | 10         | 12 =
        |
>> | IP-Config:Auto-configuration_of_network_failed      | 8          |    =
        |
>> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 2          |    =
        |
>> | EIP:note_page                                       | 2          |    =
        |
>> | BUG:unable_to_handle_kernel                         | 0          | 12 =
        |
>> | Oops:#[##]                                          | 0          | 12 =
        |
>> | EIP:dev_add_pack                                    | 0          | 12 =
        |
>> | Kernel_panic-not_syncing:Fatal_exception            | 0          | 12 =
        |
>> +-----------------------------------------------------+------------+----=
--------+
>> =

>> [    0.227015] BUG: unable to handle kernel NULL pointer dereference at =
00000004
>> [    0.228000] IP: dev_add_pack+0x37/0x80
>
>Didn't you report this yesterday as well?  Anyway, am working on it,
>give me a few hours to wake up and test...

Hi,

0day bot tested both the lkml patch and the commit in dev-queue branch of
next-queue.git tree, hence the duplicated report.

Thanks,
Xiaolong
>
>thanks,
>
>greg k-h

--===============6503103063771656089==--

