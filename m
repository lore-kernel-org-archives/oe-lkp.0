Content-Type: multipart/mixed; boundary="===============8328857304299221335=="
MIME-Version: 1.0
From: Christoph Lameter <cl@gentwo.org>
To: lkp@lists.01.org
Subject: Re: [this_cpu_ptr] BUG: unable to handle kernel
Date: Thu, 07 Aug 2014 08:48:40 -0500
Message-ID: <alpine.DEB.2.11.1408070847370.10503@gentwo.org>
In-Reply-To: <20140807083959.GA7479@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8328857304299221335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Aug 2014, Fengguang Wu wrote:

> On Wed, Aug 06, 2014 at 06:57:46PM -0500, Christoph Lameter wrote:
> > On Wed, 6 Aug 2014, Fengguang Wu wrote:
> >
> > > It looks the rebased tree still has bug:
> >
> > Yep that occured in two places actually. I updated and rebased the tree.
> > Please try again. The testscript was very helpful. Thanks.
>
> Christoph, the new branch head 858dc288fc98 looks great, I do not find
> boot errors in it. :)

Yeah. There are still failures though. It seems that the cpumask_var_t
can be defined differently and it seems that one variant requires
this_cpu_load whereas the other requires this_cpu_ptr.


--===============8328857304299221335==--

