Content-Type: multipart/mixed; boundary="===============5611787628745381342=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [serial: 8250_lpss] a13e19cf3d: BUG: kernel hang in boot stage
Date: Mon, 24 Oct 2016 10:13:53 +0800
Message-ID: <20161024021353.ij63ldkfl7cigcwr@wfg-t540p.sh.intel.com>
In-Reply-To: <1477154414.6423.34.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5611787628745381342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sat, Oct 22, 2016 at 07:40:14PM +0300, Andy Shevchenko wrote:
>On Mon, 2016-09-05 at 18:15 +0300, Andy Shevchenko wrote:
>> +Heikki
>>
>> On Sat, 2016-09-03 at 16:25 +0800, kernel test robot wrote:
>> > Greetings,
>> >
>> > 0day kernel testing robot got the below dmesg and the first bad
>> > commit
>> > is
>>
>> Briefly tested I have hang issues *with* or *without* the mentioned
>> commit if under hang you meant no getty available on serial console.
>> Otherwise I see output from kernel till=C2=A0
>>
>> [=C2=A0=C2=A0=C2=A061.625900] raid6test: complete (2429 tests, 0 failure=
s)
>> [=C2=A0=C2=A0=C2=A061.671165] BIOS EDD facility v0.16 2004-Jun-25, 0 dev=
ices found
>> [=C2=A0=C2=A0=C2=A061.678004] EDD information not available.
>> [=C2=A0=C2=A0=C2=A061.714036] ALSA device list:
>> [=C2=A0=C2=A0=C2=A061.717459]=C2=A0=C2=A0=C2=A0#0: Dummy 1
>> [=C2=A0=C2=A0=C2=A061.720480]=C2=A0=C2=A0=C2=A0#1: MTPAV on parallel por=
t at 0x378
>>
>> Attached defconfigs per commit I have tested (also diff between mine
>> and
>> yours when I did make savedefconfig).
>>
>> So, may I ask what exact hardware you are using to test this one?
>
>May I ask beloved LKP team what the status of the issue is? Shall we
>close it or there is more information coming?

Please close the issue.

I tried rebuild the kernel and redo the tests, and find the new kernel
no longer has early boot hang. Sorry for the noise!

Cheers,
Fengguang

>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-
>> > next
>> >
>> > commit a13e19cf3dc1080cf8a3a174cefd9199610faed7
>> > Author:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Andy Shevchenko <andriy.shevchenk=
o@linux.intel.com>
>> > AuthorDate: Wed Aug 17 19:20:27 2016 +0300
>> > Commit:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Greg Kroah-Hartman <gregkh@linu=
xfoundation.org>
>> > CommitDate: Wed Aug 31 16:13:30 2016 +0200
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0serial: 8250_lpss: split LPSS driver to separa=
te module
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0The SoCs, such as Intel Braswell, have DesignW=
are UART IP. Split
>> > out the
>> > =C2=A0=C2=A0=C2=A0=C2=A0support of such chips to a separate module whi=
ch also will be
>> > used
>> > for Intel
>> > =C2=A0=C2=A0=C2=A0=C2=A0Quark later.
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0The rationale to have the separate driver to b=
e existing:
>> > =C2=A0=C2=A0=C2=A0=C2=A0- Do not contaminate 8250_pci.c anymore with L=
PSS related quirks
>> > =C2=A0=C2=A0=C2=A0=C2=A0- All of them are using same DMA engine and th=
ey are Designware
>> > IP
>> > which means
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0that in the future we might share =
the code between 8250_dw.c
>> > and
>> > 8250_lpss.c
>> > =C2=A0=C2=A0=C2=A0=C2=A0- It reduces the kernel memory footprint on no=
n-X86 machines
>> > where
>> > 8250_pci.c
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0is in use
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0Besides the split the driver also has been ref=
actored, in
>> > particular a) the DMA
>> > =C2=A0=C2=A0=C2=A0=C2=A0and port setup are separate functions, b) the =
two new structures
>> > lpss8250 and
>> > =C2=A0=C2=A0=C2=A0=C2=A0lpss8250_board are introduced to keep necessar=
y data instead of
>> > =C2=A0=C2=A0=C2=A0=C2=A0pciserial_board, c) DMA parameters are passed =
to the DMA setup
>> > via
>> > mentioned
>> > =C2=A0=C2=A0=C2=A0=C2=A0custom structure. Most of the changes are done=
 due to the future
>> > support of
>> > =C2=A0=C2=A0=C2=A0=C2=A0UART DMA on Intel Quark.
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0The Intel Quark UART DMA support is based on b=
its taking from
>> > BSP
>> > code
>> > =C2=A0=C2=A0=C2=A0=C2=A0published by Intel earlier.
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0The driver does not use any specific power man=
agement. PCI core
>> > takes care of
>> > =C2=A0=C2=A0=C2=A0=C2=A0the default behaviour during suspend and resum=
e.
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Andy Shevchenko <andriy.shevche=
nko@linux.intel.co
>> > m>
>> > =C2=A0=C2=A0=C2=A0=C2=A0Tested-by: Bryan O'Donoghue <pure.logic@nexu=
s-software.ie>
>> > =C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Greg Kroah-Hartman <gregkh@li=
nuxfoundation.org>
>> >
>> > +-------------------------------+------------+------------+---------
>> > --
>> > -+
>> > >
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 68af490b03 | a13e19cf3d |
>> > > 6fe4da5401
>> > > >
>> >
>> > +-------------------------------+------------+------------+---------
>> > --
>> > -+
>> > >
>> > > boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 63=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|
>> > > 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|
>> > > 27=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> > > BUG:kernel_hang_in_boot_stage | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
>> > > 27=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> >
>> > +-------------------------------+------------+------------+---------
>> > --
>> > -+
>> >
>> > Booting the kernel.
>> >
>> > Elapsed time: 500
>> > BUG: kernel hang in boot stage
>> > Linux version 4.8.0-rc2-00028-ga13e19c #1
>> > Command line:=C2=A0=C2=A0root=3D/dev/ram0 hung_task_panic=3D1 debug ap=
ic=3Ddebug
>> > sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
>> > net.ifnames=3D0
>> > printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpan=
ic
>> > oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 systemd.log_level=3De=
rr
>> > ignore_loglevel earlyprintk=3DttyS0,115200 console=3DttyS0,115200
>> > console=3Dtty0 vga=3Dnormal rw link=3D/kbuild-tests/run-queue/kvm/x86_=
64-
>> > randconfig-r0-09031101/linux-devel:devel-spot-
>> > 201609030826:a13e19cf3dc1080cf8a3a174cefd9199610faed7:bisect-linux-
>> > 0/.vmlinuz-a13e19cf3dc1080cf8a3a174cefd9199610faed7-20160903152912-
>> > 8-
>> > vp branch=3Dlinux-devel/devel-spot-201609030826
>> > BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-r0-09031101/gcc-
>> > 6/a13e19cf3dc1080cf8a3a174cefd9199610faed7/vmlinuz-4.8.0-rc2-00028-
>> > ga13e19c drbd.minor_count=3D8
>> >
>> >
>> > git bisect start 6fe4da54019254083959652e61fab5d7b6d8b16b
>> > 3eab887a55424fc2c27553b7bfe32330df83f7b8 --
>> > git bisect good 86374892625f368ff0a7d0045bbd10f5005f5095=C2=A0=C2=A0#
>> > 13:00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0Merge 'linux-review/Paul-Burton/Partial-MIPS-
>> > Malta-DT-conversion/20160903-000153' into devel-spot-201609030826
>> > git bisect=C2=A0=C2=A0bad 28b0a3136795a9a1d1abb0331790bbae75e71e03=C2=
=A0=C2=A0#
>> > 13:14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A011=C2=A0=C2=A0Merge 'renesas/topic/sdr104-v6' into devel-
>> > spot-
>> > 201609030826
>> > git bisect good 2e5ad9bf16a597bcf52ffee14dc5a3dc80e60ae9=C2=A0=C2=A0#
>> > 13:24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A022+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0Merge 'linux-review/Wang-Nan/perf-report-
>> > Recognize-hugetlb-mapping-as-anon-mapping/20160902-220432' into
>> > devel-
>> > spot-201609030826
>> > git bisect=C2=A0=C2=A0bad bedfbf8942db947f2a9be3e3a4e01d8ddf3bdf4e=C2=
=A0=C2=A0#
>> > 13:40=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A08=C2=A0=C2=A0Merge 'linux-review/Luca-Ceresoli/rtl8723au-
>> > remove-declaration-of-unimplemented-functions/20160902-211231' into
>> > devel-spot-201609030826
>> > git bisect=C2=A0=C2=A0bad 687a5fb1c4382d1e37d444fdc24f9a0ecb4034a0=C2=
=A0=C2=A0#
>> > 14:02=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A010=C2=A0=C2=A0Merge 'tty/tty-testing' into devel-spot-
>> > 201609030826
>> > git bisect good 259bbca0cd7b626ab0fc5eb63dfc24b1408e29b4=C2=A0=C2=A0#
>> > 14:13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A021+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0Merge 'linux-review/Toke-H-iland-J-
>> > rgensen/mac80211-Move-reorder-sensitive-TX-handlers-to-after-TXQ-
>> > dequeue/20160902-215155' into devel-spot-201609030826
>> > git bisect good bf7a791d2c931375ae966adfb0a93eae426c6d7e=C2=A0=C2=A0#
>> > 14:26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A022+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0Merge 'linux-review/Hariprasad-Shenai/cxgb4-
>> > Add-
>> > support-for-ndo_get_vf_config/20160902-214923' into devel-spot-
>> > 201609030826
>> > git bisect good 5887ad43ee02a00f17a6132b7fb256dc6865474c=C2=A0=C2=A0#
>> > 14:41=C2=A0=C2=A0=C2=A0=C2=A0=C2=A022+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0tty: serial: fsl_lpuart: Use cyclic DMA for Rx
>> > git bisect good 9217a5bf66061c392e461255c5d9d41aac136e58=C2=A0=C2=A0#
>> > 14:50=C2=A0=C2=A0=C2=A0=C2=A0=C2=A022+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0dmaengine: dw: keep copy of custom slave
>> > config
>> > in dwc
>> > git bisect good 8d17047207d52182ccd55b9529e1c8cc062c07c2=C2=A0=C2=A0#
>> > 15:06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A022+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0serial: 8250_dma: switch to new
>> > dmaengine_terminate_* API
>> > git bisect good 68af490b03b40cc31b2cd47899661d87ab9f127d=C2=A0=C2=A0#
>> > 15:22=C2=A0=C2=A0=C2=A0=C2=A0=C2=A022+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0serial: 8250: enable AFE on ports where FIFO
>> > is
>> > 16 bytes
>> > git bisect=C2=A0=C2=A0bad a13e19cf3dc1080cf8a3a174cefd9199610faed7=C2=
=A0=C2=A0#
>> > 15:36=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A04=C2=A0=C2=A0serial: 8250_lpss: split LPSS driver to
>> > separate
>> > module
>> > # first bad commit: [a13e19cf3dc1080cf8a3a174cefd9199610faed7]
>> > serial:
>> > 8250_lpss: split LPSS driver to separate module
>> > git bisect good 68af490b03b40cc31b2cd47899661d87ab9f127d=C2=A0=C2=A0#
>> > 15:40=C2=A0=C2=A0=C2=A0=C2=A0=C2=A063+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00=C2=A0=C2=A0serial: 8250: enable AFE on ports where FIFO
>> > is
>> > 16 bytes
>> > # extra tests on HEAD of linux-devel/devel-spot-201609030826
>> > git bisect=C2=A0=C2=A0bad 6fe4da54019254083959652e61fab5d7b6d8b16b=C2=
=A0=C2=A0#
>> > 15:40=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A027=C2=A0=C2=A00day head guard for 'devel-spot-201609030826'
>> > # extra tests on tree/branch tty/tty-next
>> > git bisect=C2=A0=C2=A0bad d2f5a7311bcaed681a41cb3419b8fe92a7b68bf5=C2=
=A0=C2=A0#
>> > 16:00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A017=C2=A0=C2=A0dmaengine: hsu: refactor hsu_dma_do_irq() to
>> > return int
>> > # extra tests on tree/branch linus/master
>> > git bisect good 0141af184adc7f6ea9bd2f9631a15704d0806f8b=C2=A0=C2=A0#
>> > 16:10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A066+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A01=C2=A0=C2=A0Merge branch 'for-linus' of
>> > git://git.kernel.dk/linux-block
>> > # extra tests on tree/branch linux-next/master
>> > git bisect good 0f98f121e1670eaa2a2fbb675e07d6ba7f0e146f=C2=A0=C2=A0#
>> > 16:24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A065+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A01=C2=A0=C2=A0Add linux-next specific files for 20160825
>> >
>> >
>> > ---
>> > 0-DAY kernel test infrastructure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Open Source
>> > Technology
>> > Center
>> > https://lists.01.org/pipermail/lkp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Intel
>> > Corporation
>>
>>
>
>-- =

>Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Intel Finland Oy

--===============5611787628745381342==--

