Content-Type: multipart/mixed; boundary="===============8568375853990138157=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Tue, 17 Sep 2013 10:56:42 +0800
Message-ID: <20130917025642.GA29664@localhost>
In-Reply-To: <5237C183.7040308@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8568375853990138157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 10:42:11PM -0400, Peter Hurley wrote:
> On 09/12/2013 11:38 PM, Fengguang Wu wrote:
> >On Thu, Sep 12, 2013 at 08:17:00PM -0700, Greg KH wrote:
> >>On Fri, Sep 13, 2013 at 08:51:33AM +0800, Fengguang Wu wrote:
> >>>Hi Peter,
> >>>
> >>>FYI, we noticed much increased vmap_area_lock contentions since this
> >>>commit:
> >>
> >>What does that mean?  What is happening, are we allocating/removing more
> >>memory now?
> >
> >// leave this question to Peter and Tejun. :)
> >
> >>What type of load were you running that showed this problem?
> >
> >The increased contentions and lock hold/wait time showed up in a
> >number of test cases.
> =

> How is the raw data acquired?
> =

> For example, is the test apparatus reading from /proc/vmallocinfo
> (which claims the vmap_area_lock) during the test execution?

We didn't read /proc/vmallocinfo and read /proc/lock_stat once when
the test ends.

> I'm wondering if a Heisenberg effect is happening here.

Thanks,
Fengguang

--===============8568375853990138157==--

