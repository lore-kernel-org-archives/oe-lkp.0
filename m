Content-Type: multipart/mixed; boundary="===============7930673076280760423=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 11:26:01 +1000
Message-ID: <20160812012601.GO19025@dastard>
In-Reply-To: <20160811011612.GT16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7930673076280760423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 11:16:12AM +1000, Dave Chinner wrote:
> On Wed, Aug 10, 2016 at 05:33:20PM -0700, Huang, Ying wrote:
> We need to know what is happening that is different - there's a good
> chance the mapping trace events will tell us. Huang, can you get
> a raw event trace from the test?
> =

> I need to see these events:
> =

> 	xfs_file*
> 	xfs_iomap*
> 	xfs_get_block*
> =


lkp-folks, can I please get these traces run and sent to me? I don't
have the time or patience to try to get aim7 running on my machines
- the build is full of hard-coded paths and libraries that aren't
provided by modern distros (e.g. it requires a static libaio.a!) and
it fails at the configure stage complaining that:

configure: error: C compiler cannot create executables

Which is a complete load of BS.

Hence I can't make progress until I have some way of understanding
what the IO pattern is that is generating the profile being
measured. So far I'm unable to do that with any of the tools I been
trying, hence I need the traces to work out what I'm missing...

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============7930673076280760423==--

