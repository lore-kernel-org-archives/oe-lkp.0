Content-Type: multipart/mixed; boundary="===============4091220628634494826=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [fs] 36e2c7421f: kernel-selftests.splice.short_splice_read.sh.fail
Date: Sat, 19 Sep 2020 07:07:39 +0200
Message-ID: <20200919050739.GA7038@lst.de>
In-Reply-To: <202009181443.C2179FB@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============4091220628634494826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 02:49:19PM -0700, Kees Cook wrote:
> In response to my recent bug fix for splice vs sysfs binary handler[1],
> I added splice testing for other pseudo filesystems[2], for which the
> test output is seen above.
> =

> What is the final verdict on the "should splice have a fallback mode?"
> question[3]? Right now /proc and /sys reject splice attempts (which, as
> I mentioned in the thread, is fine by me, since it would have blocked
> the bug I had to fix from ever being exposed in the first place).

The verdict is: without a set_fs()-like mechanism that allows uaccess
routines to operate on kernel buffers, or even worse a
compat_alloc_user_space-like mechanism we can't have an entirely
generic fallback.

> Should I update the test to _expect_ that splice should fail?

I think so.  We can updated individual file operations to support splice
where actually used applications except it (even when they shouldn't),
but I'd rather not do it just for a test case.
--===============4091220628634494826==--

