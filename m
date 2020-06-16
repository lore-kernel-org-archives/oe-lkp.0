Content-Type: multipart/mixed; boundary="===============2161121976181728961=="
MIME-Version: 1.0
From: Guilherme Piccoli <gpiccoli@canonical.com>
To: lkp@lists.01.org
Subject: Re: [kernel/watchdog.c] f117955a22: kmsg.Failed_to_set_sysctl_parameter'kernel.softlockup_panic=#':parameter_not_found
Date: Tue, 16 Jun 2020 09:15:47 -0300
Message-ID: <CAHD1Q_yxYB9UX4he8CeZMzdr8MhQAzrZtgc5+TsnWRv_dgMSfA@mail.gmail.com>
In-Reply-To: <55e7a318-9021-f350-c80f-bc95070568fb@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2161121976181728961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Vlastimil! I agree with you..it's a good new behavior to report
that case, I guess.
Cheers,


Guilherme

On Tue, Jun 16, 2020 at 5:02 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 6/16/20 9:38 AM, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: f117955a2255721a6a0e9cecf6cad3a6eb43cbc3 ("kernel/watchdog.c: c=
onvert {soft/hard}lockup boot parameters to sysctl aliases")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > in testcase: boot
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> >
> >
> >
> > [    5.306502] netconsole: network logging started
> > [    5.793973] input: ImExPS/2 Generic Explorer Mouse as /devices/platf=
orm/i8042/serio1/input/input3
> > [    5.804702] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow C=
ontrol: RX
> > [    5.828198] Sending DHCP requests ., OK
> > [    5.829815] IP-Config: Got DHCP answer from 10.0.2.2, my address is =
10.0.2.15
> > [    5.831412] IP-Config: Complete:
> > [    5.832501]      device=3Deth0, hwaddr=3D52:54:00:12:34:56, ipaddr=
=3D10.0.2.15, mask=3D255.255.255.0, gw=3D10.0.2.2
> > [    5.835246]      host=3Dvm-snb-ssd-19, domain=3D, nis-domain=3D(none)
> > [    5.836806]      bootserver=3D10.0.2.2, rootserver=3D10.0.2.2, rootp=
ath=3D
> > [    5.836808]      nameserver0=3D10.0.2.3
> > [    5.839613] ALSA device list:
> > [    5.857103]   No soundcards found.
> > [    5.860706] Freeing unused kernel image (initmem) memory: 1540K
> > [    5.868210] Write protecting the kernel read-only data: 20480k
> > [    5.870913] Freeing unused kernel image (text/rodata gap) memory: 20=
44K
> > [    5.872636] Freeing unused kernel image (rodata/data gap) memory: 68K
> > [    5.874149] rodata_test: all tests were successful
> > [    5.875553] Failed to set sysctl parameter 'kernel.softlockup_panic=
=3D1': parameter not found
>
> In case the line above is the reason for this report, then it's because .=
config has:
>
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
>
> While previously the softlockup_panic=3D1 parameter would be just silentl=
y ignored
> in that case. I don't think it's wrong to report it, though.
>
> > [    5.896259] Run /init as init process
> > [    5.897454]   with arguments:
> > [    5.898493]     /init
> > [    5.899418]   with environment:
> > [    5.900468]     HOME=3D/
> > [    5.901346]     TERM=3Dlinux
> > [    5.902311]     user=3Dlkp
> > [    5.903266]     job=3D/lkp/jobs/scheduled/vm-snb-ssd-19/boot-1-debia=
n-i386-20191205.cgz-f117955a2255721a6a0e9cecf6cad3a6eb43cbc3-20200615-43661=
-1fqppwn-3.yaml
> > [    5.906363]     ARCH=3Dx86_64
> > [    5.907358]     kconfig=3Dx86_64-kexec
> > [    5.908495]     branch=3Dlinus/master
> > [    5.909564]     commit=3Df117955a2255721a6a0e9cecf6cad3a6eb43cbc3
> > [    5.910982]     BOOT_IMAGE=3D/pkg/linux/x86_64-kexec/gcc-9/f117955a2=
255721a6a0e9cecf6cad3a6eb43cbc3/vmlinuz-5.7.0-12506-gf117955a22557
> > [    5.913735]     max_uptime=3D600
> > [    5.914651]     RESULT_ROOT=3D/result/boot/1/vm-snb-ssd/debian-i386-=
20191205.cgz/x86_64-kexec/gcc-9/f117955a2255721a6a0e9cecf6cad3a6eb43cbc3/3
> > [    5.917437]     LKP_SERVER=3Dinn
> > [    5.918425]     selinux=3D0
> > [    5.919398]     softlockup_panic=3D1
> > [    5.920495]     nmi_watchdog=3Dpanic
> > [    5.925722]     prompt_ramdisk=3D0
> > [    5.926843]     vga=3Dnormal
> > [    5.927739]     watchdog_thresh=3D60
> > [    5.934222] systemd[1]: RTC configured in localtime, applying delta =
of 0 minutes to system time.
> > [    5.937449] systemd[1]: Failed to insert module 'autofs4': No such f=
ile or directory
> > [    5.941850] random: systemd: uninitialized urandom read (16 bytes re=
ad)
> > [    5.947176] random: systemd: uninitialized urandom read (16 bytes re=
ad)
> >
> >
> > To reproduce:
> >
> >         # build kernel
> >       cd linux
> >       cp config-5.7.0-12506-gf117955a22557 .config
> >       make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare=
 modules_prepare bzImage
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> >
> >
> >
> > Thanks,
> > Rong Chen
> >
>
--===============2161121976181728961==--

