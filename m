Content-Type: multipart/mixed; boundary="===============7141075708873855128=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [torture] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 30 Sep 2014 12:22:20 -0700
Message-ID: <20140930192220.GT5015@linux.vnet.ibm.com>
In-Reply-To: <20140930114138.GA3974@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7141075708873855128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 07:41:38PM +0800, Fengguang Wu wrote:
> Hi Paul,
> =

> > One thing would be something like this:
> > =

> > 	( sleep 300; rmmod rcutorture ) &
> > =

> > Running both locktorture and rcutorture concurrently is not supported
> > at the moment because both make the assumption that they have the entire
> > system at their disposal.
> =

> It's good to know that! Following your instructions, I just added 2
> test cases for rcutorture and locktorture in LKP. :)

Very good!  Please let me know how it goes.

							Thanx, Paul


--===============7141075708873855128==--

