Content-Type: multipart/mixed; boundary="===============4695877477963109161=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Wed, 17 May 2017 15:13:14 +0200
Message-ID: <20170517131314.GC8621@pathway.suse.cz>
In-Reply-To: <20170508063741.GA364@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============4695877477963109161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 2017-05-08 15:37:41, Sergey Senozhatsky wrote:
> Hello,
> =

> On (04/07/17 10:40), Steven Rostedt wrote:
> [..]
> > On Fri, 7 Apr 2017 14:44:55 +0200
> > Pavel Machek <pavel@ucw.cz> wrote:
> > =

> > > Well, I have to agree here. This is 20 years worth of mess :-(.
> > =

> > Maybe someone should propose a micro-conf at Linux Plumbers where we
> > can brain storm a way to re-invent printk()? Seems it can do with a
> > completely new rewrite. ;-)
> =

> So I've been thinking about it... I'm somewhat limited in budget this
> year and can do either LPC or KS* - purely depending on which one can
> "attract" a required critical mass. From _this_ point of view KS,
> perhaps, would be more appropriate, especially given that it's in EU
> this year, if I'm not mistaken. But LPC has its own merits too, of
> course. LPC's microconference sounds good enough.
> =

> What do you guys think?
> =

> =

> * I obviously don't expect to be invited to the KS, all I said is that
>   I can be in Prague around that time so we can sit somewhere and talk.

I live in Prague and will be happy to discuss printk issues with
interested people.

I think about rewriting printk from time to time. Some brainstorming
might be helpful. On the other hand, I have become aware of many new printk
limits and deficiencies last year. The more I know the less I am sure
that I know enough for making a good design. I would personally prefer
to give it some longer time to gather information. Especially I am
interested into more feedback about the printk kthread and console
work offloading. Also I still do not have enough experience about
how different consoles are used and behave.

Best Regards,
Petr

--===============4695877477963109161==--

