Content-Type: multipart/mixed; boundary="===============0784779335932728618=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 10 Apr 2017 13:53:39 +0900
Message-ID: <20170410045339.GB2793@jagdpanzerIV.localdomain>
In-Reply-To: <20170409101230.GB27363@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============0784779335932728618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/09/17 12:12), Pavel Machek wrote:
[..]
> > a side note,
> > that's rather unclear to me how would "message delayed" really help.
> > if your system hard-lockup so badly and there are no printk messages
> > even from NMI watchdog, then we won't be able to print that message.
> =

> We are talking about
> =

>    printk("unusual condition");
>    do_something_clever(); /* Which unfortunately hard-crashes the machine=
 */
> =

> that works with my proposal, but not with yours. Seen it happen many
> times before.

I see your point, sure.
I can't completely agree on "that works with my proposal, but not with your=
s."

on SMP system this would be true only if no other CPU holds the console_sem
at the time we call printk(). (skipping irrelevant cases when we have suspe=
nded
console or !online CPU and !CON_ANYTIME console). and there is nothing that
makes "no other CPU holds the console_sem" always true on SMP system at any
given point in time. so no, "A always works, B never works" is not accurate.

but, once again, I see your point.

	-ss

--===============0784779335932728618==--

