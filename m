Content-Type: multipart/mixed; boundary="===============3876384655640005230=="
MIME-Version: 1.0
From: Sudeep Holla <sudeep.holla@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm] e7c1db75fe: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Tue, 29 Nov 2016 17:21:19 +0000
Message-ID: <CAPKp9uYFmkiWn9uuPjNLFADP0qrqrpArecuKjNku5X72TyJpzg@mail.gmail.com>
In-Reply-To: <20161127181656.GD2501@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3876384655640005230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2016 at 6:16 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit e7c1db75fed821a961ce1ca2b602b08e75de0cd8 ("mm: Prevent __alloc_pag=
es_nodemask() RCU CPU stall warnings")
> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu=
/next
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -m 1G
>
> caused below changes:
>
[...]

> [    8.953192] BUG: sleeping function called from invalid context at mm/p=
age_alloc.c:3746
> [    8.956353] in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swapper/0

I am observing similar BUG/backtrace even on ARM64 platform.

--
Regards,
Sudeep

--===============3876384655640005230==--

