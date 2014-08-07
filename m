Content-Type: multipart/mixed; boundary="===============9028557068822324567=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [microcode/load_module] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7094 __might_sleep+0x51/0x16f()
Date: Thu, 07 Aug 2014 21:26:15 +0930
Message-ID: <87r40scy3k.fsf@rustcorp.com.au>
In-Reply-To: <20140807104140.GN19379@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============9028557068822324567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:
> On Wed, Aug 06, 2014 at 05:12:24AM +0800, Fengguang Wu wrote:
>> Greetings,
>> =

>> Here is a microcode/load_module error triggered by debug check commit
>> 64c2181bc433b17f04da8fe8592aa83cceac9606 ("sched: Debug nested
>> sleeps"):

Hmm, google lead me to that.  Yuck, that's subtle.

> Cc: Rusty Russell <rusty@rustcorp.com.au>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Link: http://lkml.kernel.org/n/tip-xtd4qlahotb7ar4bmo9lapz8(a)git.kernel.=
org
> ---
>  kernel/module.c |   26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -3094,6 +3094,28 @@ static int may_init_module(void)
>  	return 0;
>  }
>  =

> +int wait_finished_loading(struct module *mod)
> +{

Is this something we can generalize?  At least needs a comment on
why we don't just use the normal wait_event_interruptible...

Cheers,
Rusty.

--===============9028557068822324567==--

