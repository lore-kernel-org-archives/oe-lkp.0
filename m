Content-Type: multipart/mixed; boundary="===============3604945175986696933=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 54f448f888 ("numa stats code cleanup and enhancement"): WARNING: CPU: 0 PID: 0 at mm/percpu.c:1368 pcpu_alloc
Date: Sun, 26 Nov 2017 10:48:14 +0800
Message-ID: <20171126024814.th5saf5ga4k4v4tj@wfg-t540p.sh.intel.com>
In-Reply-To: <20171126024546.q7coxpgw7vxidkrp@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3604945175986696933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2017 at 10:45:46AM +0800, Fengguang Wu wrote:
>Greetings,
>
>0day kernel testing robot got the below dmesg and the first bad commit is
>
>kemi/numa_stat_cleanup/0.1
>
>commit 54f448f8881d7360a1c9e9c8e2fd9c05ddc421b2
>Author:     Kemi Wang <kemi.wang@intel.com>
>AuthorDate: Fri Nov 24 14:16:41 2017 +0800
>Commit:     Kemi Wang <kemi.wang@intel.com>
>CommitDate: Fri Nov 24 14:16:41 2017 +0800
>
>     numa stats code cleanup and enhancement
>
>     Signed-off-by: Kemi Wang <kemi.wang@intel.com>
>
>0c86a6bd85  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
>54f448f888  numa stats code cleanup and enhancement
>15068e303e  try to change commit id
>+-------------------------------------------------------+------------+----=
--------+------------+
>|                                                       | 0c86a6bd85 | 54f=
448f888 | 15068e303e |
>+-------------------------------------------------------+------------+----=
--------+------------+
>| boot_successes                                        | 75         | 2  =
        | 0          |
>| boot_failures                                         | 10         | 71 =
        | 34         |
>| WARNING:at_drivers/pci/pci-sysfs.c:#pci_mmap_resource | 10         | 2  =
        | 1          |
>| EIP:pci_mmap_resource                                 | 10         | 2  =
        | 1          |
>| WARNING:at_mm/percpu.c:#pcpu_alloc                    | 0          | 71 =
        | 34         |
>| EIP:pcpu_alloc                                        | 0          | 71 =
        | 34         |
>+-------------------------------------------------------+------------+----=
--------+------------+

It also triggered some oops:

testcase/path_params/tbox_group/run: boot/1/vm-lkp-nhm-dp1-openwrt-i386

0c86a6bd85ff0629  54f448f8881d7360a1c9e9c8e2
----------------  --------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :4          100%           4:4     dmesg.WARNING:at_mm/percpu.c:=
#pcpu_alloc
           :4          100%           4:4     dmesg.EIP:pcpu_alloc
           :2          100%           2:2     dmesg.BUG:unable_to_handle_ke=
rnel
           :2          100%           2:2     dmesg.Oops:#[##]
           :2          100%           2:2     dmesg.EIP:__inc_numa_state
           :2          100%           2:2     dmesg.Kernel_panic-not_syncin=
g:Fatal_exception
           :2           50%           1:2     dmesg.BUG:kernel_reboot-witho=
ut-warning_in_boot_stage

testcase/path_params/tbox_group/run: boot/1/vm-lkp-nhm-dp1-yocto-i386

0c86a6bd85ff0629  54f448f8881d7360a1c9e9c8e2
----------------  --------------------------
           :4          100%           4:4     dmesg.WARNING:at_mm/percpu.c:=
#pcpu_alloc
           :4          100%           4:4     dmesg.EIP:pcpu_alloc
           :2          100%           2:2     dmesg.BUG:unable_to_handle_ke=
rnel
           :2          100%           2:2     dmesg.Oops:#[##]
           :2          100%           2:2     dmesg.EIP:__inc_numa_state
           :2          100%           2:2     dmesg.Kernel_panic-not_syncin=
g:Fatal_exception

Thanks,
Fengguang

--===============3604945175986696933==--

