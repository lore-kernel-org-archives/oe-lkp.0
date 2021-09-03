Content-Type: multipart/mixed; boundary="===============1279747935389647027=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Fri, 03 Sep 2021 13:28:25 +0800
Message-ID: <8ac28fce-0cfb-cc4d-1a3d-2f104ff46767@linux.intel.com>
In-Reply-To: <20210603161004.GL23647@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1279747935389647027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jan,

      Do you have time to look at this? I re-test it in v5.13 and v5.14, =

the regression still existed. Thanks.


On 6/4/2021 12:10 AM, Jan Kara wrote:
> Similarly to previous test, 'Orig' is the original state before 05c2c00f3=
7,
> 'Patched' is a state after commit 05c2c00f37, 'Hack1' is 05c2c00f37 but w=
ith
> lock_buffer() calls removed from orphan handling, 'Hack2' is 05c2c00f37 w=
ith
> lock_buffer() calls removed and checksumming moved from under orphan_lock,
> 'BH orphan lock' is 05c2c00f37 with orphan_lock replaced with sb buffer
> lock.
> =

> As we can see with fixed filesystem size, the regression isn't actually
> that big anymore but it about matches what 0-day reported. Replacing orph=
an
> lock with superblock buffer_head lock makes things even much worse - not
> really surprising given we are replacing optimized mutex implementation
> with a bitlock. Just removing buffer lock (Hack1 test) doesn't seem to
> improve the results noticeably so that is not a problem. Moving
> checksumming out from under the orphan_lock would probably help noticeably
> (Hack2 test) but there's the problem when to compute checksums for
> nojournal mode and also we'd need to be very careful with all the other
> places updating superblock so that they serialize against orphan operatio=
ns
> so that they cannot invalidate the checksum - IMO not very compelling.
> =

> So as we chatted on today's call probably the best option is to leave the
> code as is for now and instead work on moving away from orphan list
> altogether. I'll revive my patches to do that.

-- =

Zhengjun Xing
--===============1279747935389647027==--

