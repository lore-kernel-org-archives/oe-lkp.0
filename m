Content-Type: multipart/mixed; boundary="===============5337816252450605795=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 75925e1ad7: BUG: unable to handle kernel paging request at 000045b8
Date: Fri, 22 Jan 2016 17:27:38 -0800
Message-ID: <20160123012738.GA28154@tassilo.jf.intel.com>
In-Reply-To: <56a1b114.H5JOWAoJgA2/uN2W%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5337816252450605795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 12:33:24PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Thanks. I managed to break 32bit kernels. The appended patch should
fix it.

----

x86, perf: Fix perf user stack trace walking
    =

Fix 75925e1ad7 (perf/x86: Optimize stack walk user accesses)
   =

Replace the hard coded 64bit frame pointer sizes, with sizeof depending
on the size of unsigned long on the host.
    =

This avoids a stack smash on 32bit kernels, which was dutifully reported
by the 0day kbuild robot.
    =

Signed-off-by: Andi Kleen <ak@linux.intel.com>

diff --git a/arch/x86/kernel/cpu/perf_event.c b/arch/x86/kernel/cpu/perf_ev=
ent.c
index 1b443db..ea4eb5c 100644
--- a/arch/x86/kernel/cpu/perf_event.c
+++ b/arch/x86/kernel/cpu/perf_event.c
@@ -2328,13 +2328,16 @@ perf_callchain_user(struct perf_callchain_entry *en=
try, struct pt_regs *regs)
 		frame.next_frame	     =3D NULL;
 		frame.return_address =3D 0;
 =

-		if (!access_ok(VERIFY_READ, fp, 16))
+		if (!access_ok(VERIFY_READ, fp, sizeof(frame)))
 			break;
 =

-		bytes =3D __copy_from_user_nmi(&frame.next_frame, fp, 8);
+		bytes =3D __copy_from_user_nmi(&frame.next_frame, fp,
+						sizeof(frame.next_frame));
 		if (bytes !=3D 0)
 			break;
-		bytes =3D __copy_from_user_nmi(&frame.return_address, fp+8, 8);
+		bytes =3D __copy_from_user_nmi(&frame.return_address,
+					fp + sizeof(frame.next_frame),
+					sizeof(frame.return_address));
 		if (bytes !=3D 0)
 			break;
=20

--===============5337816252450605795==--

