Content-Type: multipart/mixed; boundary="===============0092193417680803603=="
MIME-Version: 1.0
From: Bjorn Helgaas <bhelgaas@google.com>
To: lkp@lists.01.org
Subject: Re: a7d06153ee: kexec boot failed
Date: Wed, 18 Dec 2019 08:33:20 -0600
Message-ID: <CAErSpo4bdEwyaDw7E4CfZ8cxtv4=hxpprGhGXwnhp6pQOtgFcQ@mail.gmail.com>
In-Reply-To: <f27874d9-d260-a8a6-63f1-deda04aed98c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0092193417680803603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 3:14 AM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: a7d06153eea209d1eb9ca816bdea3e99639484c9 ("PCI: Fix pci_add_dma_a=
lias() bitmask size")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

That commit seems quite innocuous, so I'm a little skeptical.  Do you
have any more details about the failure?

> in testcase: boot
> on test machine: 8 threads Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz with =
16G memory
>
> Kexec boot failed first found on commit a7d06153ee,
> The first kernel is v4.20, and kexec version is 2.0.18.
>
> git bisect start
> # good: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
> git bisect good e42617b825f8073569da76dc4510bfa019b1c35a
> # bad: [eb83b6e30b341adb69ab353622d17ea730b64595] 0day head guard for 'de=
vel-hourly-2019121106'
> git bisect bad eb83b6e30b341adb69ab353622d17ea730b64595
> # bad: [eb83b6e30b341adb69ab353622d17ea730b64595] 0day head guard for 'de=
vel-hourly-2019121106'
> git bisect bad eb83b6e30b341adb69ab353622d17ea730b64595
> # good: [9bb63bb385e48b76deaf09cb27c3416dfdd1bb6d] Merge 'f2fs/dev' into =
devel-hourly-2019121106
> git bisect good 9bb63bb385e48b76deaf09cb27c3416dfdd1bb6d
> # bad: [91dc307b62393ccdf782f320642dc48f54f4f34b] Merge 'peterz-queue/loc=
king/core' into devel-hourly-2019121106
> git bisect bad 91dc307b62393ccdf782f320642dc48f54f4f34b
> # good: [f0a2917e6d81c1c9582a9ed7e3a423f85cb8ecef] Merge 'sound/topic/pcm=
-extension-wip' into devel-hourly-2019121106
> git bisect good f0a2917e6d81c1c9582a9ed7e3a423f85cb8ecef
> # good: [accc00683163aa69955844d76f019e5edcb779a2] Merge 'arnd-playground=
/compat-ioctl-endgame-20191209' into devel-hourly-2019121106
> git bisect good accc00683163aa69955844d76f019e5edcb779a2
> # bad: [e8d880559410aee529dc695609fa15beed3676ad] Merge 'pci/pci/virtuali=
zation' into devel-hourly-2019121106
> git bisect bad e8d880559410aee529dc695609fa15beed3676ad
> # good: [105477b7fd8cee4248732be81aed7b2f615c1141] pinctrl: lynxpoint: Up=
date summary in the driver
> git bisect good 105477b7fd8cee4248732be81aed7b2f615c1141
> # good: [b5c00c1483caa5085b9dd4466bbe4a65157b9dc1] Merge 'avpatel/riscv_d=
ebug_defconfigs_v2' into devel-hourly-2019121106
> git bisect good b5c00c1483caa5085b9dd4466bbe4a65157b9dc1
> # good: [4efb56649132687b5093d90aa62887595e65a09d] x86/mm: Tabulate the p=
age table encoding definitions
> git bisect good 4efb56649132687b5093d90aa62887595e65a09d
> # good: [33c2c9d3e6ac6c9ae02999cb2f2c1c39a9fb3e48] Merge 'peterz-queue/WI=
P.x86/mm' into devel-hourly-2019121106
> git bisect good 33c2c9d3e6ac6c9ae02999cb2f2c1c39a9fb3e48
> # bad: [a7d06153eea209d1eb9ca816bdea3e99639484c9] PCI: Fix pci_add_dma_al=
ias() bitmask size
> git bisect bad a7d06153eea209d1eb9ca816bdea3e99639484c9
> # good: [8c386cc817878588195dde38e919aa6ba9409d58] PCI/IOV: Fix memory le=
ak in pci_iov_add_virtfn()
> git bisect good 8c386cc817878588195dde38e919aa6ba9409d58
> # first bad commit: [a7d06153eea209d1eb9ca816bdea3e99639484c9] PCI: Fix p=
ci_add_dma_alias() bitmask size
>
> Best Regards,
> Rong Chen
--===============0092193417680803603==--

