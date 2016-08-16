Content-Type: multipart/mixed; boundary="===============2176673602735332569=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 10:08:02 +1000
Message-ID: <20160816000802.GE16044@dastard>
In-Reply-To: <87twemndzw.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2176673602735332569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 10:22:43AM -0700, Huang, Ying wrote:
> Hi, Chinner,
> =

> Dave Chinner <david@fromorbit.com> writes:
> =

> > On Wed, Aug 10, 2016 at 06:00:24PM -0700, Linus Torvalds wrote:
> >> On Wed, Aug 10, 2016 at 5:33 PM, Huang, Ying <ying.huang@intel.com> =
wrote:
> >> >
> >> > Here it is,
> >> =

> >> Thanks.
> >> =

> >> Appended is a munged "after" list, with the "before" values in
> >> parenthesis. It actually looks fairly similar.
> >> =

> >> The biggest difference is that we have "mark_page_accessed()" show up
> >> after, and not before. There was also a lot of LRU noise in the
> >> non-profile data. I wonder if that is the reason here: the old model
> >> of using generic_perform_write/block_page_mkwrite didn't mark the
> >> pages accessed, and now with iomap_file_buffered_write() they get
> >> marked as active and that screws up the LRU list, and makes us not
> >> flush out the dirty pages well (because they are seen as active and
> >> not good for writeback), and then you get bad memory use.
> >> =

> >> I'm not seeing anything that looks like locking-related.
> >
> > Not in that profile. I've been doing some local testing inside a
> > 4-node fake-numa 16p/16GB RAM VM to see what I can find.
> =

> You run the test in a virtual machine, I think that is why your perf
> data looks strange (high value of _raw_spin_unlock_irqrestore).
> =

> To setup KVM to use perf, you may refer to,
> =

> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/=
html/Virtualization_Tuning_and_Optimization_Guide/sect-Virtualization_Tunin=
g_Optimization_Guide-Monitoring_Tools-vPMU.html
> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/=
html/Virtualization_Administration_Guide/sect-perf-mon.html
> =

> I haven't tested them.  You may Google to find more information.  Or the
> perf/kvm people can give you more information.

Thanks, "-cpu host" on the qemu command line works. I hate magic,
undocumented(*) features that are necessary to make basic stuff work. =


-Dave.

(*) yeah, try working this capability even exists out from the
qemu/kvm man page.

-- =

Dave Chinner
david(a)fromorbit.com

--===============2176673602735332569==--

