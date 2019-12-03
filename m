Content-Type: multipart/mixed; boundary="===============8183423680507395064=="
MIME-Version: 1.0
From: Saravana Kannan <saravanak@google.com>
To: lkp@lists.01.org
Subject: Re: 5e6669387e ("of/platform: Pause/resume sync state during init .."): [ 3.192726] WARNING: CPU: 1 PID: 1 at drivers/base/core.c:688 device_links_supplier_sync_state_resume
Date: Tue, 03 Dec 2019 14:50:49 -0800
Message-ID: <CAGETcx9-TZfARQgc7N4=kp1WVvMuxpmw3n3-TmwYO1YNkQKmRw@mail.gmail.com>
In-Reply-To: <CAL_JsqKBuCfCvFwbUQwTQxYAR1WL5r5Mnm_RBhHgH0b7_Bkg6w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8183423680507395064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2019 at 1:10 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Dec 3, 2019 at 2:05 PM Saravana Kannan <saravanak@google.com> w=
rote:
> >
> > On Tue, Dec 3, 2019 at 1:01 AM Frank Rowand <frowand.list@gmail.com> =
wrote:
> > >
> > > On 12/2/19 3:19 PM, Saravana Kannan wrote:
> > > > On Sun, Dec 1, 2019 at 7:00 AM kernel test robot <lkp@intel.com> =
wrote:
> > > >>
> > > >> Greetings,
> > > >>
> > > >> 0day kernel testing robot got the below dmesg and the first bad co=
mmit is
> > > >>
> > > >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 master
> > > >>
> > > >> commit 5e6669387e2287f25f09fd0abd279dae104cfa7e
> > > >> Author:     Saravana Kannan <saravanak@google.com>
> > > >> AuthorDate: Wed Sep 4 14:11:24 2019 -0700
> > > >> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >> CommitDate: Fri Oct 4 17:30:19 2019 +0200
> > > >>
> > > >>     of/platform: Pause/resume sync state during init and of_platfo=
rm_populate()
> > > >>
> > > >>     When all the top level devices are populated from DT during ke=
rnel
> > > >>     init, the supplier devices could be added and probed before the
> > > >>     consumer devices are added and linked to the suppliers. To avo=
id the
> > > >>     sync_state() callback from being called prematurely, pause the
> > > >>     sync_state() callbacks before populating the devices and resum=
e them
> > > >>     at late_initcall_sync().
> > > >>
> > > >>     Similarly, when children devices are populated from a module u=
sing
> > > >>     of_platform_populate(), there could be supplier-consumer depen=
dencies
> > > >>     between the children devices that are populated. To avoid the =
same
> > > >>     problem with sync_state() being called prematurely, pause and =
resume
> > > >>     sync_state() callbacks across of_platform_populate().
> > > >>
> > > >>     Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > >>     Link: https://lore.kernel.org/r/20190904211126.47518-6-saravan=
ak(a)google.com
> > > >>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.or=
g>
> > > >>
> > > >> fc5a251d0f  driver core: Add sync_state driver/bus callback
> > > >> 5e6669387e  of/platform: Pause/resume sync state during init and o=
f_platform_populate()
> > > >> 81b6b96475  Merge branch 'master' of git://git.kernel.org/pub/scm/=
linux/kernel/git/torvalds/linux; tag 'dma-mapping-5.5' of git://git.infrade=
ad.org/users/hch/dma-mapping
> > > >> +-----------------------------------------------------------------=
--------+------------+------------+------------+
> > > >> |                                                                 =
        | fc5a251d0f | 5e6669387e | 81b6b96475 |
> > > >> +-----------------------------------------------------------------=
--------+------------+------------+------------+
> > > >> | boot_successes                                                  =
        | 30         | 0          | 0          |
> > > >> | boot_failures                                                   =
        | 1          | 11         | 22         |
> > > >> | Oops:#[##]                                                      =
        | 1          |            |            |
> > > >> | EIP:unmap_vmas                                                  =
        | 1          |            |            |
> > > >> | PANIC:double_fault                                              =
        | 1          |            |            |
> > > >> | Kernel_panic-not_syncing:Fatal_exception                        =
        | 1          |            |            |
> > > >> | WARNING:at_drivers/base/core.c:#device_links_supplier_sync_state=
_resume | 0          | 11         | 22         |
> > > >> | EIP:device_links_supplier_sync_state_resume                     =
        | 0          | 11         | 22         |
> > > >> +-----------------------------------------------------------------=
--------+------------+------------+------------+
> > > >>
> > > >> If you fix the issue, kindly add following tag
> > > >> Reported-by: kernel test robot <lkp@intel.com>
> > > >>
> > > >> [    3.186107] OF: /testcase-data/phandle-tests/consumer-b: #phand=
le-cells =3D 2 found -1
> > > >> [    3.188595] platform testcase-data:testcase-device2: IRQ index =
0 not found
> > > >> [    3.191047] ### dt-test ### end of unittest - 199 passed, 0 fai=
led
> > > >> [    3.191932] ------------[ cut here ]------------
> > > >> [    3.192571] Unmatched sync_state pause/resume!
> > > >> [    3.192726] WARNING: CPU: 1 PID: 1 at drivers/base/core.c:688 d=
evice_links_supplier_sync_state_resume+0x27/0xc0
> > > >> [    3.195084] Modules linked in:
> > > >> [    3.195494] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G           =
     T 5.4.0-rc1-00005-g5e6669387e228 #1
> > > >> [    3.196674] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS 1.10.2-1 04/01/2014
> > > >> [    3.197693] EIP: device_links_supplier_sync_state_resume+0x27/0=
xc0
> > > >> [    3.198680] Code: 00 00 00 3e 8d 74 26 00 57 56 31 d2 53 b8 a0 =
d0 d9 c1 e8 6c b6 38 00 a1 e4 d0 d9 c1 85 c0 75 13 68 84 ba c4 c1 e8 29 30 =
b1 ff <0f> 0b 58 eb 7f 8d 74 26 00 83 e8 01 85 c0 a3 e4 d0 d9 c1 75 6f 8b
> > > >> [    3.201560] EAX: 00000022 EBX: 00000000 ECX: 00000000 EDX: 0000=
0000
> > > >> [    3.202466] ESI: 000001ab EDI: c02c7f80 EBP: c1e87d27 ESP: c02c=
7f20
> > > >> [    3.203301] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS=
: 00010282
> > > >> [    3.204258] CR0: 80050033 CR2: bfa1bf98 CR3: 01f28000 CR4: 0014=
0690
> > > >> [    3.205022] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 0000=
0000
> > > >> [    3.205919] DR6: fffe0ff0 DR7: 00000400
> > > >> [    3.206529] Call Trace:
> > > >> [    3.207011]  ? of_platform_sync_state_init+0x13/0x16
> > > >> [    3.207719]  ? do_one_initcall+0xda/0x260
> > > >> [    3.208247]  ? kernel_init_freeable+0x110/0x197
> > > >> [    3.208906]  ? rest_init+0x120/0x120
> > > >> [    3.209369]  ? kernel_init+0xa/0x100
> > > >> [    3.209775]  ? ret_from_fork+0x19/0x24
> > > >> [    3.210283] ---[ end trace 81d0f2d2ee65199b ]---
> > > >> [    3.210955] ALSA device list:
> > > >
> > > > Rob/Frank,
> > > >
> > > > This seems to be an issue with the unit test code not properly
> > > > cleaning up the state after it's done.
> > > >
> > > > Specifically, unittest_data_add() setting up of_root on systems whe=
re
> > > > there's no device tree (of_root =3D=3D NULL). It doesn't clean up o=
f_root
> > > > after the tests are done. This affects the of_have_populated_dt() A=
PI
> > > > that in turn affects calls to
> > > > device_links_supplier_sync_state_pause/resume(). I think unittests
> > > > shouldn't affect the of_have_populated_dt() API.
> > > There are at least a couple of reasons why the unittest devicetree da=
ta
> > > needs to remain after the point where devicetree unittests currently
> > > complete.  So cleaning up (removing the data) is not an option.
> > >
> > > I depend on the unittest devicetree entries still existing after the =
system
> > > boots and I can log into a shell for some validation of the final res=
ult of
> > > the devicetree data.
> >
> > IMHO unittests shouldn't have a residual impact on the system after
> > they are done. So, I'll agree to disagree on this one.
>
> They shouldn't be enabled in a production system either. Why would you
> want the extra boot time?

Should we ask the kernel test robot folks to not enable OF unittest
then? It broke my patch, but I wouldn't be surprised if it's silently
breaking other stuff too. I think we need to do option 4 below.

>
> > > There is also a desire for the devicetree unittests to be able to be =
loaded
> > > as a module.  That work is not yet scheduled, but I do not want to pr=
eclude
> > > the possibility.  If unittests are loaded from a module then they will
> > > need some devicetree data to exist that is created in early boot.  Th=
at
> > > data will be in the devicetree when of_platform_sync_state_init() is
> > > invoked.
> >
> > On a normal system, FDT is parsed and of_root is set (or not set) very
> > early on during setup_arch() before any of the initcall levels are
> > run. The return value of of_have_populated_dt() isn't expected to
> > change across initcall levels. But because of the way the unittest is
> > written (the of_root is changed at late_initcall() level) the return
> > value of of_have_populated_dt() changes across initcall levels. I
> > think that's a real problem with the unittest -- it's breaking API
> > semantics.
>
> I think what's really desired here is a 'Am I booting using DT' call.

I think the community has decided to use of_have_populated_dt() as
that call. So, we shouldn't break it.

>
> > of_have_populated_dt() is being used to check if DT is present in the
> > system and different things are done based on that. We can't have that
> > value change across initcall levels.
> >
> > Couple of thoughts:
> > 1. Don't run unit test if there is no live DT in the system?
>
> That's pretty much the only case I do run. I use UML to run the tests.

Ah, makes sense.

> > 2. If you don't want to do (1), then at least set up the unit test
> > data during setup_arch() instead of doing it at some initcall level?
>
> That further breaks making it a module. The plan is also to move to
> kunit which probably will preclude some hacky hook into setup_arch().
> Side effects may need to be fixed for kunit though.

Yup.

> > 3. Can you use overlays for the unit tests if they are loaded as a modu=
le?
>
> That was the idea, yes.
>
>
> 4. Make running the unittests a command line option instead of running
> if enabled. Still has side effects, but you have to explicitly run it.

Hmm... this is another good option. I think this should be done. Do we
have a consensus on this?

> A module would still be my preference. If only there was someone
> interested in making everything a module... ;)

:)

> > > > I was looking into writing a unittest patch to fix this, but I don't
> > > > know enough about the FDT parsing code to make sure I don't leak any
> > > > memory or free stuff that's in use. I'm not sure I can simply set
> > > > of_root =3D NULL if it was NULL before the unittest started. Let me=
 know
> > > > how I should proceed or if you plan to write up a patch for this.
> > >
> > > Based on the above, "clean up" of the unittest data is not the soluti=
on.
> > >
> > > I haven't looked at the mechanism in device_links_supplier_sync_state=
_resume()
> > > that leads to the WARN yet.  But is does not seem reasonable for that=
 code
> > > to be so sensitive to what valid data is in the devicetree that a WAR=
N results.
> >
> > Sure, I could easily fix it to work around this. But this seems to be
> > a genuine problem with the unittest setup IMO.

I'll go ahead and do this (basically always doing it instead of
checking on of_have_populated_dt()) but I don't want us to forget this
unittest issue.

-Saravana
--===============8183423680507395064==--

