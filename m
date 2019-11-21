Content-Type: multipart/mixed; boundary="===============8600650855265307196=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf] a0ab2bff12: stderr.Error_opening, size=#Permission_denied
Date: Thu, 21 Nov 2019 15:21:28 +0800
Message-ID: <20191121072128.GC9619@xsang-OptiPlex-9020>
In-Reply-To: <87pnhmd3i7.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8600650855265307196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 04:30:24PM +0200, Alexander Shishkin wrote:
> Oliver Sang <oliver.sang@intel.com> writes:
> =

> > Hi Alex, sorry for confusion, the error is as below
> =

> Hi Oliver,
> =

> Thank you for a prompt follow-up!
> =

> >   + tests/size/too_big
> >     Testing attr > kernel supported size...                    FAILED
> =

> It's a problem between the test case and the test system. The commit
> mentioned actually increases the sizeof(struct perf_event_attr), which
> this test case compiles in. So, if you rebuild the test case against the
> updated include/uapi/linux/perf_event.h, it will pass again.
> =

> I would say, that for correctness sake it makes sense to rebuild the
> testsuite with each new commit, or at least with every commit that
> touches include/uapi.

Hi Alex,

Thanks a lot for suggestion! This exposed some hole in our test flow.
We will improve.

> =

> Regards,
> --
> Alex
--===============8600650855265307196==--

