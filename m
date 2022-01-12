Content-Type: multipart/mixed; boundary="===============0191992668360117787=="
MIME-Version: 1.0
From: Sean Christopherson <seanjc@google.com>
To: lkp@lists.01.org
Subject: Re: [x86/entry_32] aa93e2ad74: BUG:soft_lockup-CPU##stuck_for#s![systemd-logind:#]
Date: Wed, 12 Jan 2022 16:14:19 +0000
Message-ID: <Yd7+W1gFbkBs5Lkd@google.com>
In-Reply-To: <Yd6ssarpDknV1r9z@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0191992668360117787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022, Peter Zijlstra wrote:
> On Wed, Jan 12, 2022 at 01:28:58AM +0000, Sean Christopherson wrote:
> > The issue is that PARANOID_EXIT_TO_KERNEL_MODE in the handle_exception_=
return
> > path overwrites the entry stack data with the task stack data, restorin=
g the "bad"
> > segment value.
> =

> Oh gawd... that's terrible, and yes, that now makes perfect sense.
> =

> However did you find that?

printf and running under QEMU, which has a interactive "monitor" that lets =
you
read/write guest memory and can also do VA=3D>PA translations.  Code inspec=
tion
once I realized the value on the stack was being restored between the excep=
tion
fixup and the POP.
--===============0191992668360117787==--

