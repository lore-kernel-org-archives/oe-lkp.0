Content-Type: multipart/mixed; boundary="===============9199757778883730334=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: fix verification
Date: Wed, 10 Feb 2021 10:59:24 +0800
Message-ID: <20210210025924.GB26362@xsang-OptiPlex-9020>
In-Reply-To: <87czxaoqko.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============9199757778883730334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 10:35:27AM +0106, John Ogness wrote:
> Hello LKP Project,
> =

> Thank you for your valuable and excellent work!
> =

> You recently detected a problem:
> =

> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/STZF3OODVA=
5KOG447JR2AJJXREWIPRXD/
> =

> We have posted a patch to fix the issue:
> =

> https://lkml.kernel.org/r/20210205141728.18117-1-john.ogness(a)linutronix=
.de

Hi John Ogness,

by applying the patch upon below commit:
commit: b031a684bfd01d633c79d281bd0cf11c2f834ada ("printk: remove logbuf_lo=
ck writer-protection of ringbuffer")

we didn't reproduce the previous INFO:rcu_tasks_detected_stalls_on_tasks
issue in 30 runs:

b031a684bfd01d63: ("printk: remove logbuf_lock writer-protection of ringbuf=
fer")
7e926a042bfad8b7: ("printk: avoid prb_first_valid_seq() where possible")

b031a684bfd01d63  7e926a042bfad8b7334b4677d3
----------------  --------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
         10:21         -48%            :30    dmesg.INFO:rcu_tasks_detected=
_stalls_on_tasks
         19:21         -90%            :30    last_state.is_incomplete_run
          1:21          -5%            :30    last_state.post_run


> =

> Using a local lkp installation I can verify the problem is fixed. But we
> would like to know if there possibilities to verify fixes using the LKP
> test robot? Or is there any way to check that the test robot sees the
> problem is fixed?
> =

> Thanks.
> =

> John Ogness
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============9199757778883730334==--

