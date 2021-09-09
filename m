Content-Type: multipart/mixed; boundary="===============8139542284086493103=="
MIME-Version: 1.0
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: lkp@lists.01.org
Subject: Re: [swiotlb] 461021875c: EIP:__dma_direct_alloc_pages
Date: Thu, 09 Sep 2021 11:36:23 -0400
Message-ID: <YTop97GqcXnldiuC@char.us.oracle.com>
In-Reply-To: <20210909150428.GA10436@willie-the-truck>
List-Id: <oe-lkp.lists.linux.dev>

--===============8139542284086493103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 04:04:29PM +0100, Will Deacon wrote:
> On Wed, Sep 08, 2021 at 04:52:39PM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 461021875c5057b3a408db0aa91b15119064ffa8 ("swiotlb: Add restric=
ted DMA pool initialization")
> > https://git.kernel.org/cgit/linux/kernel/git/konrad/swiotlb.git devel/f=
or-linus-5.14
> > =

> > =

> > in testcase: boot
> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > [  157.633812][    T1] BUG: kernel NULL pointer dereference, address: 0=
0000046
> > [  157.636589][    T1] #PF: supervisor read access in kernel mode
> > [  157.637641][    T1] #PF: error_code(0x0000) - not-present page
> > [  157.637641][    T1] *pde =3D 00000000
> > [  157.643000][    T1] Oops: 0000 [#1] SMP
> > [  157.643000][    T1] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        =
W         5.12.0-rc3-00029-g461021875c50 #1
> > [  157.643000][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.12.0-1 04/01/2014
> > [  157.650987][    T1] EIP: __dma_direct_alloc_pages+0xee/0x280
> > [  157.650987][    T1] Code: d2 f6 c1 20 0f 94 c0 0f 95 c2 d3 e0 d3 e2 =
83 c0 ff 83 d2 ff 39 f0 89 d0 19 f8 0f 92 c0 0f b6 c0 8d 44 40 01 8b 93 c0 =
02 00 00 <80> 7a 46 00 74 6c 8b 7d ec 89 d8 89 fa e8 c0 34 00 00 89 c6 85 c0
> > [  157.658987][    T1] EAX: 00000004 EBX: c2713884 ECX: 00000018 EDX: 0=
0000000
> > [  157.658987][    T1] ESI: ffffffff EDI: 00000000 EBP: c1c43d2c ESP: c=
1c43d10
> > [  157.658987][    T1] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFL=
AGS: 00010297
> > [  157.666985][    T1] CR0: 80050033 CR2: 00000046 CR3: 1b1da000 CR4: 0=
00406d0
> > [  157.666985][    T1] Call Trace:
> > [  157.666985][    T1]  dma_direct_alloc+0x50/0x180
> > [  157.674977][    T1]  dma_alloc_attrs+0x69/0xc0
> > [  157.674977][    T1]  ide_allocate_dma_engine+0x55/0x80
> =

> This IDE code doesn't exist upstream any more. See b7fb14d3ac63 ("ide: re=
move
> the legacy ide driver").

Let me kill that branch since we never pushed that to Linus.
> =

> Will
--===============8139542284086493103==--

