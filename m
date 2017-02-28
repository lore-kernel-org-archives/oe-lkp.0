Content-Type: multipart/mixed; boundary="===============7945956556380040060=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 84e26daf36: BUG: kernel reboot-without-warning in boot stage
Date: Tue, 28 Feb 2017 08:47:57 +0800
Message-ID: <20170228004757.ie4uvrk6dqglvnqh@wfg-t540p.sh.intel.com>
In-Reply-To: <20170228004536.o2qflgb7umiwi4xm@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7945956556380040060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 08:45:36AM +0800, Fengguang Wu wrote:
>Hi Matthew,
>
>On Mon, Feb 27, 2017 at 09:28:07PM +0000, Matthew Wilcox wrote:
>>From: kernel test robot [mailto:fengguang.wu(a)intel.com]
>>>
>>> dedab4f65c  Merge 'jss-tpmdd/tabrm-v3' into devel-spot-201702270715
>>> 20e85d3670  ida: Move ida_bitmap to a percpu variable
>>> 84e26daf36  Merge 'dax/fd-alloc' into devel-spot-201702270715

Oops, that's our internal merge commit, so it's reasonable you cannot
reproduce the bug on your tree. Sorry for the noise!

Fengguang

>>> +-------------------------------------------------+------------+-------=
-----+------------+
>>> |                                                 | dedab4f65c | 20e85d=
3670 | 84e26daf36 |
>>> +-------------------------------------------------+------------+-------=
-----+------------+
>>> | boot_successes                                  | 88         | 82    =
     | 0          |
>>> | boot_failures                                   | 4          | 0     =
     | 48         |
>>> | IP-Config:Auto-configuration_of_network_failed  | 4          |       =
     |            |
>>> | BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 0     =
     | 48
>>> |
>>> +-------------------------------------------------+------------+-------=
-----+------------+
>>>
>>> [    0.000000] BRK [0x05884000, 0x05884fff] PGTABLE
>>> [    0.000000] RAMDISK: [mem 0x1fcc6000-0x1ffcffff]
>>> [    0.000000] ACPI: Early table checksum verification disabled
>>>
>>
>>Thanks for reporting this.  I don't know quite how to proceed from
>>here; the modified kernel boots for me just fine.  The code we
>>modified shouldn't even be called this early -- it's around file
>>descriptor handling, and I don't think we even get a file descriptor
>>this early in boot.
>>
>>Can you share the ramdisk that you're booting the kernel with?
>
>Have you tried the attached reproduce-* script in the original email?
>It works for me. That script does not include the ramdisk download
>part because initrd is not necessary/relevant for reproducing this
>bug. In fact all ramdisks we tested can trigger it.
>
>Thanks,
>Fengguang

--===============7945956556380040060==--

