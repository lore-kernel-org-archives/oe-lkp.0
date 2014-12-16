Content-Type: multipart/mixed; boundary="===============1590010991528445188=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 22:15:34 +0100
Message-ID: <alpine.DEB.2.11.1412162205130.17382@nanos>
In-Reply-To: <20141216091528.17ee429d@ultegra>
List-Id: <oe-lkp.lists.linux.dev>

--===============1590010991528445188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2014, Jacob Pan wrote:
> On Tue, 16 Dec 2014 09:48:42 +0530
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > I really don't know what stuff out of the two patches I posted (The
> > above one and the fix I posted yesterday), will possible make the
> > synchronization bad ..
> > =

> But since your patch has real benefits and does not cause regression
> with the current code, there is no reason to hold it back. I was just
> hoping to get help on debugging this.

As I said elsewhere in this thread, this is not going anywhere. The
only sane decision is to revert 2a16fc93d2c9 for now.

Aside of that both NOHZ full and powerclamp need to be fixed
proper. Both of them are a complete disaster and just a steaming pile
of abuse and bandaids fixing the abuse. Read my other replies on that
before you ponder to argue.

The real solution for both things at the moment would be to make them
depend on BROKEN. I'm serious about that, really.

Your's grumpy

       tglx


--===============1590010991528445188==--

