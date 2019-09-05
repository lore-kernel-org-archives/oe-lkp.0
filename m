Content-Type: multipart/mixed; boundary="===============4025496430090022058=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Thu, 05 Sep 2019 12:37:47 +0200
Message-ID: <CAKMK7uESbH_0_SFUc+v=BhjW0bv4FbL8Dq2UG1fWcSqyue3wig@mail.gmail.com>
In-Reply-To: <20190905065917.GE5541@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4025496430090022058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2019 at 8:58 AM Feng Tang <feng.tang@intel.com> wrote:
>
> Hi Vetter,
>
> On Wed, Sep 04, 2019 at 01:20:29PM +0200, Daniel Vetter wrote:
> > On Wed, Sep 4, 2019 at 1:15 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Wed, 4 Sep 2019 at 19:17, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Sep 4, 2019 at 10:35 AM Feng Tang <feng.tang@intel.com> w=
rote:
> > > > >
> > > > > Hi Daniel,
> > > > >
> > > > > On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
> > > > > > On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann(a=
)suse.de> wrote:
> > > > > > >
> > > > > > > Hi
> > > > > > >
> > > > > > > Am 04.09.19 um 08:27 schrieb Feng Tang:
> > > > > > > >> Thank you for testing. But don't get too excited, because =
the patch
> > > > > > > >> simulates a bug that was present in the original mgag200 c=
ode. A
> > > > > > > >> significant number of frames are simply skipped. That is a=
pparently the
> > > > > > > >> reason why it's faster.
> > > > > > > >
> > > > > > > > Thanks for the detailed info, so the original code skips ti=
me-consuming
> > > > > > > > work inside atomic context on purpose. Is there any space t=
o optmise it?
> > > > > > > > If 2 scheduled update worker are handled at almost same tim=
e, can one be
> > > > > > > > skipped?
> > > > > > >
> > > > > > > To my knowledge, there's only one instance of the worker. Re-=
scheduling
> > > > > > > the worker before a previous instance started, will not creat=
e a second
> > > > > > > instance. The worker's instance will complete all pending upd=
ates. So in
> > > > > > > some way, skipping workers already happens.
> > > > > >
> > > > > > So I think that the most often fbcon update from atomic context=
 is the
> > > > > > blinking cursor. If you disable that one you should be back to =
the old
> > > > > > performance level I think, since just writing to dmesg is from =
process
> > > > > > context, so shouldn't change.
> > > > >
> > > > > Hmm, then for the old driver, it should also do the most update in
> > > > > non-atomic context?
> > > > >
> > > > > One other thing is, I profiled that updating a 3MB shadow buffer =
needs
> > > > > 20 ms, which transfer to 150 MB/s bandwidth. Could it be related =
with
> > > > > the cache setting of DRM shadow buffer? say the orginal code use a
> > > > > cachable buffer?
> > > >
> > > > Hm, that would indicate the write-combining got broken somewhere. T=
his
> > > > should definitely be faster. Also we shouldn't transfer the hole
> > > > thing, except when scrolling ...
> > >
> > > First rule of fbcon usage, you are always effectively scrolling.
> > >
> > > Also these devices might be on a PCIE 1x piece of wet string, not sure
> > > if the numbers reflect that.
> >
> > pcie 1x 1.0 is 250MB/s, so yeah with a bit of inefficiency and
> > overhead not entirely out of the question that 150MB/s is actually the
> > hw limit. If it's really pcie 1x 1.0, no idea where to check that.
> > Also might be worth to double-check that the gpu pci bar is listed as
> > wc in debugfs/x86/pat_memtype_list.
>
> Here is some dump of the device info and the pat_memtype_list, while it is
> running other 0day task:

Looks all good, I guess Dave is right with this probably only being a
real slow, real old pcie link, plus maybe some inefficiencies in the
mapping. Your 150MB/s, was that just the copy, or did you include all
the setup/map/unmap/teardown too in your measurement in the trace?
-Daniel

>
> controller info
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 03:00.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA G2=
00e [Pilot] ServerEngines (SEP1) (rev 05) (prog-if 00 [VGA controller])
>         Subsystem: Intel Corporation MGA G200e [Pilot] ServerEngines (SEP=
1)
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParEr=
r- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 16
>         NUMA node: 0
>         Region 0: Memory at d0000000 (32-bit, prefetchable) [size=3D16M]
>         Region 1: Memory at d1800000 (32-bit, non-prefetchable) [size=3D1=
6K]
>         Region 2: Memory at d1000000 (32-bit, non-prefetchable) [size=3D8=
M]
>         Expansion ROM at 000c0000 [disabled] [size=3D128K]
>         Capabilities: [dc] Power Management version 2
>                 Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,=
D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
>         Capabilities: [e4] Express (v1) Legacy Endpoint, MSI 00
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <6=
4ns, L1 <1us
>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
>                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Uns=
upported-
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
>                         MaxPayload 128 bytes, MaxReadReq 128 bytes
>                 DevSta: CorrErr+ UncorrErr+ FatalErr- UnsuppReq+ AuxPwr- =
TransPend-
>                 LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit =
Latency L0s <64ns, L1 <1us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
>                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>                 LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ D=
LActive- BWMgmt- ABWMgmt-
>         Capabilities: [54] MSI: Enable- Count=3D1/1 Maskable- 64bit-
>                 Address: 00000000  Data: 0000
>         Kernel driver in use: mgag200
>         Kernel modules: mgag200
>
>
> Related pat setting
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> uncached-minus @ 0xc0000000-0xc0001000
> uncached-minus @ 0xc0000000-0xd0000000
> uncached-minus @ 0xc0008000-0xc0009000
> uncached-minus @ 0xc0009000-0xc000a000
> uncached-minus @ 0xc0010000-0xc0011000
> uncached-minus @ 0xc0011000-0xc0012000
> uncached-minus @ 0xc0012000-0xc0013000
> uncached-minus @ 0xc0013000-0xc0014000
> uncached-minus @ 0xc0018000-0xc0019000
> uncached-minus @ 0xc0019000-0xc001a000
> uncached-minus @ 0xc001a000-0xc001b000
> write-combining @ 0xd0000000-0xd0300000
> write-combining @ 0xd0000000-0xd1000000
> uncached-minus @ 0xd1800000-0xd1804000
> uncached-minus @ 0xd1900000-0xd1980000
> uncached-minus @ 0xd1980000-0xd1981000
> uncached-minus @ 0xd1a00000-0xd1a80000
> uncached-minus @ 0xd1a80000-0xd1a81000
> uncached-minus @ 0xd1f10000-0xd1f11000
> uncached-minus @ 0xd1f11000-0xd1f12000
> uncached-minus @ 0xd1f12000-0xd1f13000
>
> Host bridge info
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 00:00.0 Host bridge: Intel Corporation Device 7853
>         Subsystem: Intel Corporation Device 0000
>         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParEr=
r- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+ =
<TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 0
>         NUMA node: 0
>         Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0
>                         ExtTag- RBE+
>                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Uns=
upported-
>                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>                         MaxPayload 128 bytes, MaxReadReq 128 bytes
>                 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- =
TransPend-
>                 LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit L=
atency L0s <512ns, L1 <4us
>                         ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>                 LnkSta: Speed unknown, Width x0, TrErr- Train- SlotClk- D=
LActive- BWMgmt- ABWMgmt-
>                 RootCtl: ErrCorrectable+ ErrNon-Fatal+ ErrFatal+ PMEIntEn=
a- CRSVisible-
>                 RootCap: CRSVisible-
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-=
, OBFF Not Supported ARIFwd-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, L=
TR-, OBFF Disabled ARIFwd-
>                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- Spe=
edDis-
>                          Transmit Margin: Normal Operating Range, EnterMo=
difiedCompliance- ComplianceSOS-
>                          Compliance De-emphasis: -6dB
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationCom=
plete-, EqualizationPhase1-
>                          EqualizationPhase2-, EqualizationPhase3-, LinkEq=
ualizationRequest-
>         Capabilities: [e0] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,=
D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
>         Capabilities: [100 v1] Vendor Specific Information: ID=3D0002 Rev=
=3D0 Len=3D00c <?>
>         Capabilities: [144 v1] Vendor Specific Information: ID=3D0004 Rev=
=3D1 Len=3D03c <?>
>         Capabilities: [1d0 v1] Vendor Specific Information: ID=3D0003 Rev=
=3D1 Len=3D00a <?>
>         Capabilities: [250 v1] #19
>         Capabilities: [280 v1] Vendor Specific Information: ID=3D0005 Rev=
=3D3 Len=3D018 <?>
>         Capabilities: [298 v1] Vendor Specific Information: ID=3D0007 Rev=
=3D0 Len=3D024 <?>
>
>
> Thanks,
> Feng
>
>
> >
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch



-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

--===============4025496430090022058==--

