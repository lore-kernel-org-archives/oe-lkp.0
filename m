Content-Type: multipart/mixed; boundary="===============7120230517461171580=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 21bb45b419: kmsg.unregister_netdevice:waiting_for_br-lan_to_become_free.Usage_count=
Date: Wed, 02 Mar 2016 16:00:58 +0800
Message-ID: <87y4a1pav9.fsf@yhuang-dev.intel.com>
In-Reply-To: <56D49603.4010900@cumulusnetworks.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7120230517461171580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

David Ahern <dsa@cumulusnetworks.com> writes:

> On 2/29/16 12:50 AM, kernel test robot wrote:
>> FYI, we noticed the below changes on
>>
>> https://github.com/0day-ci/linux  David-Ahern/net-ipv6-Make-address-flus=
hing-on-ifdown-optional/20160214-062626
>> commit 21bb45b419243ee4d9d74f1d1f97164fbfc481c3 ("net: ipv6: Make addres=
s flushing on ifdown optional")
>>
>>
>> [  136.160531] unregister_netdevice: waiting for br-lan to become free. =
Usage count =3D 1
>>
>
> How do I get the series of commands run? From the logs it looks like
> there is a creation of a bridge, eth0 enslavement, admin down on
> bridge and then delete of the bridge. When I run those commands in a
> VM I do not hit the usage count of 1, so I am clearly missing some
> commands.

The command line to run qemu is as follow:

qemu-system-x86_64 -enable-kvm -kernel /pkg/linux/x86_64-randconfig-n0-0227=
1436/gcc-5/21bb45b419243ee4d9d74f1d1f97164fbfc481c3/vmlinuz-4.5.0-rc2-00420=
-g21bb45b -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-clie=
nt3-openwrt-ia32-2/rand_boot-1-openwrt-i386.cgz-x86_64-randconfig-n0-022714=
36-21bb45b419243ee4d9d74f1d1f97164fbfc481c3-20160228-50262-1pt11n1-0.yaml A=
RCH=3Dx86_64 kconfig=3Dx86_64-randconfig-n0-02271436 branch=3Dlinux-devel/d=
evel-hourly-2016022600 commit=3D21bb45b419243ee4d9d74f1d1f97164fbfc481c3 BO=
OT_IMAGE=3D/pkg/linux/x86_64-randconfig-n0-02271436/gcc-5/21bb45b419243ee4d=
9d74f1d1f97164fbfc481c3/vmlinuz-4.5.0-rc2-00420-g21bb45b max_uptime=3D600 R=
ESULT_ROOT=3D/result/boot/1/vm-client3-openwrt-ia32/openwrt-i386.cgz/x86_64=
-randconfig-n0-02271436/gcc-5/21bb45b419243ee4d9d74f1d1f97164fbfc481c3/0 LK=
P_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug api=
c=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=
=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=
=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal =
rw ip=3D::::vm-client3-openwrt-ia32-2::dhcp drbd.minor_count=3D8'  -initrd =
/fs/sdb6/initrd-vm-client3-openwrt-ia32-2 -m 192 -smp 1 -device e1000,netde=
v=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300=
esb -rtc base=3Dlocaltime -drive file=3D/fs/sdb6/disk0-vm-client3-openwrt-i=
a32-2,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdb6/disk1-vm-client3-open=
wrt-ia32-2,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-client3-=
openwrt-ia32-2 -serial file:/dev/shm/kboot/serial-vm-client3-openwrt-ia32-2=
 -daemonize -display none -monitor null

The root file system used for test can be downloaded in:

https://github.com/fengguang/reproduce-kernel-bug/tree/master/initrd

The one used for test should be yocto i386 root image.

Best Regards,
Huang, Ying

> Thanks for the report,
> David
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============7120230517461171580==--

