Content-Type: multipart/mixed; boundary="===============6086898313599006413=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Sat, 08 Jun 2019 11:56:04 -0400
Message-ID: <Pine.LNX.4.44L0.1906081153140.11124-100000@netrider.rowland.org>
In-Reply-To: <20190608151943.GD28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6086898313599006413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Jun 2019, Paul E. McKenney wrote:

> On Thu, Jun 06, 2019 at 10:19:43AM -0400, Alan Stern wrote:
> > On Thu, 6 Jun 2019, Andrea Parri wrote:
> > =

> > > This seems a sensible change to me: looking forward to seeing a patch,
> > > on top of -rcu/dev, for further review and testing!
> > > =

> > > We could also add (to LKMM) the barrier() for rcu_read_{lock,unlock}()
> > > discussed in this thread (maybe once the RCU code and the informal doc
> > > will have settled in such direction).
> > =

> > Yes.  Also for SRCU.  That point had not escaped me.
> =

> And it does seem pretty settled.  There are quite a few examples where
> there are normal accesses at either end of the RCU read-side critical
> sections, for example, the one in the requirements diffs below.
> =

> For SRCU, srcu_read_lock() and srcu_read_unlock() have implied compiler
> barriers since 2006.  ;-)
> =

> 							Thanx, Paul
> =

> ------------------------------------------------------------------------
> =

> diff --git a/Documentation/RCU/Design/Requirements/Requirements.html b/Do=
cumentation/RCU/Design/Requirements/Requirements.html
> index 5a9238a2883c..080b39cc1dbb 100644
> --- a/Documentation/RCU/Design/Requirements/Requirements.html
> +++ b/Documentation/RCU/Design/Requirements/Requirements.html
> @@ -2129,6 +2129,8 @@ Some of the relevant points of interest are as foll=
ows:
>  <li>	<a href=3D"#Hotplug CPU">Hotplug CPU</a>.
>  <li>	<a href=3D"#Scheduler and RCU">Scheduler and RCU</a>.
>  <li>	<a href=3D"#Tracing and RCU">Tracing and RCU</a>.
> +<li>	<a href=3D"#Accesses to User Mamory and RCU">
------------------------------------^
> +Accesses to User Mamory and RCU</a>.
---------------------^
>  <li>	<a href=3D"#Energy Efficiency">Energy Efficiency</a>.
>  <li>	<a href=3D"#Scheduling-Clock Interrupts and RCU">
>  	Scheduling-Clock Interrupts and RCU</a>.
> @@ -2521,6 +2523,75 @@ cannot be used.
>  The tracing folks both located the requirement and provided the
>  needed fix, so this surprise requirement was relatively painless.
>  =

> +<h3><a name=3D"Accesses to User Mamory and RCU">
----------------------------------^
> +Accesses to User Mamory and RCU</a></h3>
---------------------^

Are these issues especially notable for female programmers?  :-)

Alan


--===============6086898313599006413==--

