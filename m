Content-Type: multipart/mixed; boundary="===============6530323962714761740=="
MIME-Version: 1.0
From: Bae, Chang Seok <chang.seok.bae@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Wed, 08 Dec 2021 18:00:06 +0000
Message-ID: <DF832BC5-AB0F-44AD-83C3-E0108176F945@intel.com>
In-Reply-To: <bbc24579-b6ee-37cb-4bbf-10e3476537e0@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6530323962714761740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Dec 7, 2021, at 15:14, Hansen, Dave <dave.hansen@intel.com> wrote:
> =

> Oliver or Chang, could you try to reproduce this by hand on one of the
> suspect systems?  Build:
> =

>  1bdda24c4a ("signal: Add an optional check for altstack size")
> =

> then run will-it-scale by hand.  Then build:
> =

>  3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> and run it again.  Also, do we see any higher core-count regressions?
> These all seem to happen with:
> =

> 	mode=3Dthread
> 	nr_task=3D16
> =

> That's really odd to see that for these systems with probably ~50 cores
> each.  I'd expect to see it get worse at higher core counts.

tglx also asked a similar thing -- test it without the python script between
5.16-rcX vs 5.15.

So, ran this with those kernel versions and some patches:
    $ ./signal1_threads -s 10 -t 16

The test accounts total number of delivered signals in 16 threads in a seco=
nd.
Repeat this 10 times and then average out. That=E2=80=99s what '{ average }=
' tells. So,
higher is better.

In this test, the lock contention came from this signal return path:
    rt_sigreturn()
        --> restore_altstack()
            --> do_sigaltstack()
But do_sigaltstack() is not needed here as no sigaltstack changes. So, perh=
aps
skip it like [2].

Then, I got this:

  { kernel version }	: { average } =

  5.15.0				: 585577
  5.16.0-rc4			: 514959
  5.16.0-rc4 + [1]		: 575066
  5.16.0-rc4 + [2]		: 597201

I think at least the last case serves as a proof of concept for this issue.

Thanks,
Chang


[1] tglx=E2=80=99s diff shown in here: https://lore.kernel.org/lkml/87bl1s3=
57p.ffs(a)tglx/

[2] =

diff --git a/kernel/signal.c b/kernel/signal.c
index a629b11bf3e0..8194d2f38bf1 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4224,6 +4224,11 @@ int restore_altstack(const stack_t __user *uss)
        stack_t new;
        if (copy_from_user(&new, uss, sizeof(stack_t)))
                return -EFAULT;
+       if (current->sas_ss_sp =3D=3D (unsigned long) new.ss_sp &&
+           current->sas_ss_size =3D=3D new.ss_size &&
+           current->sas_ss_flags =3D=3D new.ss_flags)
+               return 0;
+
        (void)do_sigaltstack(&new, NULL, current_user_stack_pointer(),
                             MINSIGSTKSZ);
        /* squash all but EFAULT for now */


--===============6530323962714761740==--

