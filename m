Content-Type: multipart/mixed; boundary="===============4820101731435160544=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm] 0507503671: will-it-scale.per_process_ops -4.9% regression
Date: Tue, 16 Nov 2021 09:41:28 +0800
Message-ID: <20211116014128.GD34844@shbuild999.sh.intel.com>
In-Reply-To: <20211115214653.GR174703@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4820101731435160544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 10:46:53PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 15, 2021 at 01:15:49PM -0800, H. Peter Anvin wrote:
> > It is perhaps a bit hard for gcc to know what S's are C so they can be =
E'd, since all it sees is assembly.
> =

> Well, if we were able to declare it pure, then it would know that the
> output only depends on the inputs and thus it can merge all
> static_call_{,un}likely() branches that take the same key argument. But
> alas.
> =

> Funnily, everything I try to make that function 'better' actually makes
> it longer, so I'm suspecting it does something clever with
> static_cpu_has() nevertheless.
> =

> > It also doesn't explain how this code
> > could possibly have this kind of impact; of anything, it should make th=
is change more beneficial, not less; certainly not make it consume 5% more =
CPU.
> =

> Yeah, no idea there. We've had wild 0day reports before due to either
> code or data layout changes that otherwise make no sense at all. They've
> tried to eliminate a bunch of that by increasing function alignment or
> somesuch (there was a talk at LPC? on that). But it remains a bit of a
> mystery.

Yes, we gave a talk at LPC:
https://linuxplumbersconf.org/event/11/contributions/895/attachments/770/16=
03/Strange_kernel_performance_changes_lpc_2021.pdf

And as you said, for many strange performance impact cases, we still
don't know the exact root cause. And Fengwei is still working on
chasing this down. =


Thanks,
Feng
--===============4820101731435160544==--

