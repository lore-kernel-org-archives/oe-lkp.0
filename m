Content-Type: multipart/mixed; boundary="===============4873766889378068840=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Fri, 21 Jul 2017 09:59:41 +0800
Message-ID: <20170721015941.GB9355@yexl-desktop>
In-Reply-To: <CA+55aFwuebKQ0-sAiRJWpMcaVJ8MjXvCg56DO5q8jMiPDXvc8A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4873766889378068840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 07/19, Linus Torvalds wrote:
>Hmm. I wonder why the kernel test robot ends up having that annoying
>line doubling for the dmesg.
>

Hmm, this line doubling issue should be caused by we set both
'earlyprintk=3DttyS0,115200' and 'console=3DttyS0,115200' in cmdline, after=
 I
remove any of it, this issue is gone, is it an inappropriate setting?

FYI, the whole kernel command line is:

ip=3D::::vm-lkp-nhm-dp1-yocto-i386-7::dhcp
root=3D/dev/ram0
user=3Dlkp
job=3D/lkp/scheduled/vm-lkp-nhm-dp1-yocto-i386-7/boot-1-yocto-tiny-i386-201=
6-04-22.cgz-6974f0c4555e285ab217cee58b6e874f776ff409-20170717-28286-131pyzw=
-0.yaml
ARCH=3Di386
kconfig=3Di386-randconfig-w0-07171351
branch=3Dlinus/master
commit=3D6974f0c4555e285ab217cee58b6e874f776ff409
BOOT_IMAGE=3D/pkg/linux/i386-randconfig-w0-07171351/gcc-6/6974f0c4555e285ab=
217cee58b6e874f776ff409/vmlinuz-4.12.0-10998-g6974f0c
max_uptime=3D600
RESULT_ROOT=3D/result/boot/1/vm-lkp-nhm-dp1-yocto-i386/yocto-tiny-i386-2016=
-04-22.cgz/i386-randconfig-w0-07171351/gcc-6/6974f0c4555e285ab217cee58b6e87=
4f776ff409/0
LKP_SERVER=3Dinn
debug
apic=3Ddebug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=3D100
net.ifnames=3D0
printk.devkmsg=3Don
panic=3D-1
softlockup_panic=3D1
nmi_watchdog=3Dpanic
oops=3Dpanic
load_ramdisk=3D2
prompt_ramdisk=3D0
drbd.minor_count=3D8
systemd.log_level=3Derr
ignore_loglevel
earlyprintk=3DttyS0,115200
console=3DttyS0,115200
console=3Dtty0
vga=3D

Thanks,
Xiaolong

--===============4873766889378068840==--

