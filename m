Content-Type: multipart/mixed; boundary="===============0127747098641656592=="
MIME-Version: 1.0
From: Bjorn Helgaas <bhelgaas@google.com>
To: lkp@lists.01.org
Subject: Re: a7d06153ee: kexec boot failed
Date: Thu, 19 Dec 2019 07:47:05 -0600
Message-ID: <CAErSpo4_7UV-u2CpfV6uuwUC7pJAj=-pPmjX+eYsxhjTQ8Pb8g@mail.gmail.com>
In-Reply-To: <6f3dc03e-a41e-88f0-4190-bd4f3ac1c258@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0127747098641656592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[Top-posting is discouraged on  Linux lists, but I'll follow suit]

Thanks.  We updated the a7d06153ee patch to fix a possible infinite
loop.  It seems like you're seeing a reboot, so I'm not sure the
update will fix that problem.  If it still occurs with the revised
patch (f8bf2aeb651b ("PCI: Fix pci_add_dma_alias() bitmask size")),
I'll drop that series until we (hopefully James) can reproduce it and
revise the series to avoid the problem.

On Wed, Dec 18, 2019 at 8:00 PM Li Zhijian <zhijianx.li@intel.com> wrote:
>
> Hi Bjorn
>
> when using v4.20 as the first kernel then kexec to a7d06153ee
> the last message(booting message a7d06153ee) we caught refers to the
> attachment
> Afterward, the machine will reboot.
>
> 2nd kernel's kernel cmdline can be found the job.yaml in the first mail.
>
> it's confirmed that it happens 100% on Ivy Bridge platform(Intel(R)
> Core(TM) i7-3770K CPU @ 3.50GHz)
>
>
> Thanks
>
>
> On 12/18/2019 10:33 PM, Bjorn Helgaas wrote:
> > On Wed, Dec 18, 2019 at 3:14 AM kernel test robot <rong.a.chen@intel.=
com> wrote:
> >> FYI, we noticed the following commit (built with gcc-7):
> >>
> >> commit: a7d06153eea209d1eb9ca816bdea3e99639484c9 ("PCI: Fix pci_add_dm=
a_alias() bitmask size")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > That commit seems quite innocuous, so I'm a little skeptical.  Do you
> > have any more details about the failure?
> >
> >> in testcase: boot
> >> on test machine: 8 threads Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz wi=
th 16G memory
> >>
> >> Kexec boot failed first found on commit a7d06153ee,
> >> The first kernel is v4.20, and kexec version is 2.0.18.
> >>
> >> git bisect start
> >> # good: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
> >> git bisect good e42617b825f8073569da76dc4510bfa019b1c35a
> >> # bad: [eb83b6e30b341adb69ab353622d17ea730b64595] 0day head guard for =
'devel-hourly-2019121106'
> >> git bisect bad eb83b6e30b341adb69ab353622d17ea730b64595
> >> # bad: [eb83b6e30b341adb69ab353622d17ea730b64595] 0day head guard for =
'devel-hourly-2019121106'
> >> git bisect bad eb83b6e30b341adb69ab353622d17ea730b64595
> >> # good: [9bb63bb385e48b76deaf09cb27c3416dfdd1bb6d] Merge 'f2fs/dev' in=
to devel-hourly-2019121106
> >> git bisect good 9bb63bb385e48b76deaf09cb27c3416dfdd1bb6d
> >> # bad: [91dc307b62393ccdf782f320642dc48f54f4f34b] Merge 'peterz-queue/=
locking/core' into devel-hourly-2019121106
> >> git bisect bad 91dc307b62393ccdf782f320642dc48f54f4f34b
> >> # good: [f0a2917e6d81c1c9582a9ed7e3a423f85cb8ecef] Merge 'sound/topic/=
pcm-extension-wip' into devel-hourly-2019121106
> >> git bisect good f0a2917e6d81c1c9582a9ed7e3a423f85cb8ecef
> >> # good: [accc00683163aa69955844d76f019e5edcb779a2] Merge 'arnd-playgro=
und/compat-ioctl-endgame-20191209' into devel-hourly-2019121106
> >> git bisect good accc00683163aa69955844d76f019e5edcb779a2
> >> # bad: [e8d880559410aee529dc695609fa15beed3676ad] Merge 'pci/pci/virtu=
alization' into devel-hourly-2019121106
> >> git bisect bad e8d880559410aee529dc695609fa15beed3676ad
> >> # good: [105477b7fd8cee4248732be81aed7b2f615c1141] pinctrl: lynxpoint:=
 Update summary in the driver
> >> git bisect good 105477b7fd8cee4248732be81aed7b2f615c1141
> >> # good: [b5c00c1483caa5085b9dd4466bbe4a65157b9dc1] Merge 'avpatel/risc=
v_debug_defconfigs_v2' into devel-hourly-2019121106
> >> git bisect good b5c00c1483caa5085b9dd4466bbe4a65157b9dc1
> >> # good: [4efb56649132687b5093d90aa62887595e65a09d] x86/mm: Tabulate th=
e page table encoding definitions
> >> git bisect good 4efb56649132687b5093d90aa62887595e65a09d
> >> # good: [33c2c9d3e6ac6c9ae02999cb2f2c1c39a9fb3e48] Merge 'peterz-queue=
/WIP.x86/mm' into devel-hourly-2019121106
> >> git bisect good 33c2c9d3e6ac6c9ae02999cb2f2c1c39a9fb3e48
> >> # bad: [a7d06153eea209d1eb9ca816bdea3e99639484c9] PCI: Fix pci_add_dma=
_alias() bitmask size
> >> git bisect bad a7d06153eea209d1eb9ca816bdea3e99639484c9
> >> # good: [8c386cc817878588195dde38e919aa6ba9409d58] PCI/IOV: Fix memory=
 leak in pci_iov_add_virtfn()
> >> git bisect good 8c386cc817878588195dde38e919aa6ba9409d58
> >> # first bad commit: [a7d06153eea209d1eb9ca816bdea3e99639484c9] PCI: Fi=
x pci_add_dma_alias() bitmask size
> >>
> >> Best Regards,
> >> Rong Chen
> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
>
--===============0127747098641656592==--

