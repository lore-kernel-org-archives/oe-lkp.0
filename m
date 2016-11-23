Content-Type: multipart/mixed; boundary="===============5464232589430836708=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/cpufeature] c109bf9599: PANIC:double_fault
Date: Wed, 23 Nov 2016 12:28:31 +0100
Message-ID: <20161123112831.4lxxaovo5664l3rn@pd.tnic>
In-Reply-To: <20161123023220.GD14790@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5464232589430836708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 10:32:20AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit c109bf95992b391bb40bc37c5d309d13fead99b5 ("x86/cpufeature: Remove =
cpu_has_pge")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M

So this is a 32-bit guest...

> [   91.997312] Bluetooth: HCI socket layer initialized
> [   91.997946] Bluetooth: L2CAP socket layer initialized
> [   91.998639] Bluetooth: SCO socket layer initialized
> [   92.054441] PANIC: double fault, gdt at c1b7d000 [255 bytes]
> [   92.055035] double fault, tss at c1b8e340
> [   92.055435] eip =3D c130f80c, esp =3D ccc4f000
> [   92.055787] eax =3D 00000000, ebx =3D f4dc084c, ecx =3D c130f80c, edx =
=3D e9b81098
> [   92.056379] esi =3D 00000062, edi =3D 00000000

... and the #DF happens pretty early.

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

I did that on a 64-bit baremetal here and it is merrily chugging away:

...
[main] 14063949 iterations. [F:10780453 S:3215408 HI:7759]
[main] 14074277 iterations. [F:10788365 S:3217790 HI:7759]
[main] 14085253 iterations. [F:10796772 S:3220298 HI:7759 STALLED:1]
[main] 14096969 iterations. [F:10805625 S:3223120 HI:7759 STALLED:1]
...
[main] 15124052 iterations. [F:11593223 S:3457551 HI:7759]
[main] 15134289 iterations. [F:11601090 S:3459865 HI:7759]
[main] 15145212 iterations. [F:11609527 S:3462295 HI:7759]
[main] 15155354 iterations. [F:11617260 S:3464656 HI:7759]
...

no sign of any double faults.

So can you upload that vm image somewhere and tell me exactly how to run
it here so that I can try to reproduce it locally.

Thanks.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============5464232589430836708==--

