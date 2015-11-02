Content-Type: multipart/mixed; boundary="===============0124981752365317048=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/context_tracking] db23da8b95: inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
Date: Mon, 02 Nov 2015 13:19:20 +0100
Message-ID: <563754C8.5060202@redhat.com>
In-Reply-To: <20151102121154.GB8833@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0124981752365317048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

this patch is not ready, and is left for 4.5; see Andy's comment at
http://permalink.gmane.org/gmane.linux.kernel/2072877.  Only the other
two are.

I'm sorry for the inconvenience.

Thanks,

Paolo

On 02/11/2015 13:11, Fengguang Wu wrote:
> Hi Paolo,
> =

> FYI, here is another bisect result.
> =

> https://github.com/0day-ci/linux Paolo-Bonzini/context_tracking-remove-du=
plicate-enabled-check/20151028-094317
> =

> commit db23da8b95ece9b57d4cfd63f5ee10502f1af0c8
> Author:     Paolo Bonzini <pbonzini@redhat.com>
> AuthorDate: Wed Oct 28 02:39:57 2015 +0100
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Oct 28 09:43:20 2015 +0800
> =

>     x86: context_tracking: avoid irq_save/irq_restore on kernel entry and=
 exit
>     =

>     x86 always calls user_enter and user_exit with interrupt disabled.
>     Therefore, it is not necessary to check for exceptions, nor to
>     save/restore the IRQ state, when context tracking functions are
>     called by guest_enter and guest_exit.
>     =

>     Use the previously introduced __context_tracking_entry and
>     __context_tracking_exit.
>     =

>     Cc: Andy Lutomirski <luto@kernel.org>
>     Cc: Frederic Weisbecker <fweisbec@gmail.com>
>     Cc: Rik van Riel <riel@redhat.com>
>     Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

--===============0124981752365317048==--

