Content-Type: multipart/mixed; boundary="===============4786683494052809823=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [locking/mutexes] cb4bbc457b: -40.0% unixbench.score
Date: Sun, 24 Jan 2016 22:05:11 -0800
Message-ID: <20160125060511.GE4503@linux.vnet.ibm.com>
In-Reply-To: <87io2iih8w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4786683494052809823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:23:59AM +0800, Huang, Ying wrote:
> Davidlohr Bueso <dave@stgolabs.net> writes:
> =

> > On Fri, 22 Jan 2016, kernel test robot wrote:
> >
> >>FYI, we noticed the below changes on
> >>
> >>https://github.com/0day-ci/linux
> >> Ding-Tianhong/locking-mutexes-don-t-spin-on-owner-when-wait-list-is-no=
t-NULL/20160121-173317
> >>commit cb4bbc457bfed6194ffab1b10c7be73b3f16ca2d ("locking/mutexes: don'=
t spin on owner when wait list is not NULL.")
> >
> > I'm not sure why this would even be reported, as this patch has not bee=
n accepted
> > or acked or nothin', by anyone.
> =

> Sorry for bothering.  The purpose is FYI as in the original report
> email.  We test patches posted to LKML, if we found some changes related
> to the patch, we will send out a report.  Hope the reviewer could
> take that as information for his/her review if the report isn't totally
> nonsense.

For me, the 0day reports on LKML postings have been quite helpful.  They
give the submitter immediate feedback on a number of issues, thus reducing
the number of rounds of review.

								Thanx, Paul


--===============4786683494052809823==--

